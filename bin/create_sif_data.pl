#!/usr/bin/env perl
# Name: create_sif_data.pl
#		By default the program assumes:
#		1) It is being run from the top-level repository directory (and that 'data' and 'schema' are subdirectories
#		   of the current directory)
# 		2) That the user has a ~/.nsip_sif_data config file
#
#       To run the program from elsewhere, specify the location of the 'data' and 'schema' directories in the
#		~/.nsip_sif_data config file
#
# Usage:
#		Specify the database on the command line:
#			./create_sif_data.pl --database=siftest01  --create-schools=1
#
#		Use the database found in the ~/.nsip_sif_data file:
#			./create_sif_data.pl --create-schools=1
#
# Help:
#		See the usage() function below for more command line options and examples or run ./create_sif_data.pl --help
#		See the sample .nsip_sif_data file on github.

use strict;
use warnings;
use lib "/var/sif/sif-data/lib";
use lib "/home/ubuntu/perl5/lib/perl5";
use perl5i::2;
use SIF::Data;
use Getopt::Long;
use DateTime;
use DateTime::Event::Recurrence;
use Data::Dumper;

my $sd = SIF::Data->new();

my ($schools, $students, $student_contacts, $staff, $rooms, $groups,
	$grading, $account, $vendors, $debtors, $agcollections, $fix, $codeset, $create_db,
	$db_name, $ttable, $school_id, $elements, $fobjects, $scheduled_activities,
	$silent) = get_args();

if (defined $create_db) {
	$db_name = $sd->create_database($create_db);
}

my ($config, $dbh, $dsn) = $sd->db_connect($db_name);
# print "DSN = $dsn\n" unless ($silent);

if ((defined $ttable) && ($ttable eq 'first')) {
	$school_id = first_school();
}

if ((defined $ttable) && ($ttable eq '')) {
	if (! check_schools()) {
		print "\nNo schools exist\nSchools must exist before creating timetables\n";
	} else {
		print "\n--create-time-table must be specified with an existing school Id \n";
		my ($school_cnt, $room_cnt) = get_group_stats();
		$room_cnt = 1 if ($room_cnt == 0);
		my $tot = $school_cnt * $room_cnt;
		print "Without a school Id, $tot timetables in the $school_cnt schools could be created\n";
	}
	usage_exit();
}

if (defined $school_id) {
	my $val = validate_school_id($school_id);
	if (! $val) {
		print "$school_id is not a valid school reference\n";
		usage_exit();
	}
}

if ($elements && (! $schools)) {
	if (! check_schools()) {
		print "\nNo schools exist\nSchools must exist or be created when creating other elements\n";
		usage_exit();
	}
}

my @postcodes = $sd->create_postcodes();

if ($ttable) {
	create_ttable($ttable, $school_id);
} else {

	create_schools($schools);

	create_students($students, $school_id);

	create_staff($staff, $school_id);

	create_rooms($rooms, $school_id);

	create_groups($groups, $school_id);

	create_grading($grading, $school_id);

	create_agcollections($agcollections);

	create_student_contacts($student_contacts, $school_id);

	create_accounts($account);

	create_vendors($vendors);

	create_debtors($debtors, $schools);

	create_financial_objects($fobjects);

        create_scheduled_activities($scheduled_activities, $school_id);

	fix_data($fix);

	code_set($codeset);
}

exit 0;


sub get_args {
	my $all   = 0;
	my $help  = 0;

	my $schools          = undef;
	my $students         = undef;
	my $staff            = undef;
	my $rooms            = undef;
	my $groups           = undef;
	my $grading          = undef;
	my $account          = undef;
	my $vendors          = undef;
	my $debtors          = undef;
	my $agcollections    = undef;
	my $fix              = undef;
	my $codeset          = undef;
	my $create_db        = undef;
	my $db_name          = undef;
	my $school_id        = undef;
	my $ttable           = undef;
	my $student_contacts = undef;
	my $fobjects         = undef;
	my $scheduled_activites         = undef;
	my $silent           = 0;

	my $result = GetOptions (
		"help"                     => \$help,
		"silent"                   => \$silent,
		"create-schools=s"         => \$schools,
		"create-students=s"        => \$students,
		"create-staff=s"           => \$staff,
		"create-rooms=s"           => \$rooms,
		"create-teaching-groups"   => \$groups,
		"create-scheduled-activities=s"   => \$scheduled_activities,
		"create-grading"           => \$grading,
		"create-accounts=s"        => \$account,
		"create-vendors=s"         => \$vendors,
		"create-debtors=s"         => \$debtors,
		"create-agcollections"     => \$agcollections,
		"fix"                      => \$fix,
		"codeset"                  => \$codeset,
		"create-database=s"        => \$create_db,
		"database=s"               => \$db_name,
		"create-time-table:s"      => \$ttable,
		"school-id=s"              => \$school_id,
		"create-fobjects=s"        => \$fobjects,
		"create-student-contacts"  => \$student_contacts,
	);

	if ($help) {
		usage_exit();
	}

	my $elements = 0;
	++$elements if ($students);
	++$elements if ($staff);
	++$elements if ($rooms);
	++$elements if ($groups);
	++$elements if ($grading);
	++$elements if ($student_contacts);

	if (! $create_db && ! $db_name) {
		print "\nA database must be specified or created\n";
		usage_exit();
	}

	if ($create_db && $db_name) {
		print "\nCannot specify both --create-database and --database in one command\n";
		usage_exit();
	}
	if ($create_db && $school_id) {
		print "\nCannot specify both --create-database and --school_id in the same command\n";
		usage_exit();
	}

	if ($schools && $school_id) {
		print "\nCannot specify both --create-schools and --school_id in the same command\n";
		usage_exit();
	}

	if ($create_db && $elements && (! $schools )) {
		print "\nMust include create-schools when creating database and other elements\n";
		usage_exit();
	}

	if (defined $ttable) {
		my $err = 0;
		++$err if ($elements);
		++$err if ($schools);
		++$err if ($create_db);
		if ($err){
			print "\ncreate-time-table must be called on an existing school as a stand-alone command\n         (--database is allowed)\n";
			usage_exit();
		}

		$school_id = $ttable;
	}

	return ($schools, $students, $student_contacts, $staff, $rooms,
	$groups, $grading, $account, $vendors, $debtors, $agcollections, $fix, $codeset,
	$create_db, $db_name, $ttable,  $school_id, $elements, $fobjects, $scheduled_activities,
	$silent);
}

sub usage_exit {
	print <<'EOT';

Sample usage is:

  ./create_sif_data.pl --create-database=name   # Create new database

  ./create_sif_data.pl --database=name_of_db    # Use the named database

  ./create_sif_data.pl --create-schools=16      # Create 16 schools
  ./create_sif_data.pl --create-schools=6..14   # Create random 6-14 schools
  ./create_sif_data.pl --create-accounts=8..16  # Create random 8-16 Accounts
  ./create_sif_data.pl --create-vendors=8..16   # Create random 8-16 Vendors
  -----------------------------------------------------------------------
    Following commands affect all schools in the database unless a school
    RefId is specified as follows
       --school-id=4002EF5E-22A8-11E4-B112-958031DE1888

  ./create_sif_data.pl --create-students=8..21  # Create random 8-21 students

  ./create_sif_data.pl --create-staff=5..20     # Create random 5-20 staff

  ./create_sif_data.pl --create-rooms=3..5      # Create random 3-5 rooms

  ./create_sif_data.pl --create-teaching-groups # Create groups for all years and students

  ./create_sif_data.pl --create-debtors=8..16   # Create random 8-16 Debtors

  ./create_sif_data.pl --create-agcollections   # Create AG Collections round and status reports

  ./create_sif_data.pl --create-scheduled-activities=8..16   # Create random 8-16 scheduled activities

  ./create_sif_data.pl --create-grading         # Populate grading assignment tables

  -----------------------------------------------------------------------
  ./create_sif_data.pl --create-time-table=school_id
          # Creates new Teaching Groups and Timetable in selected school
          # Requires school to have been created

  ./create_sif_data.pl --create-fobjects=number_of_schools
		  # Creates financial objects.
		  # Requires database be specified and have been created

  ./create_sif_data.pl --fix                   # Update missing data

  ./create_sif_data.pl --codeset               # Add the codeset

  By default the program assumes:
  1) It is being run from the top-level repository directory (and that 'data' and 'schema' are subdirectories
     of the current directory)
  2) That the user has a ~/.nsip_sif_data config file

  To run the program from elsewhere, specify the location of the 'data' and 'schema' directories in the
  ~/.nsip_sif_data config file

EOT

	exit 0;
}

sub create_schools {
	my ($schools) = @_;

	my ($sch_lower, $sch_upper, $num_schools);
	if (defined $schools) {
		($sch_lower, $sch_upper) = split(/\.\./, $schools);
		if (! defined $sch_upper) {
			$num_schools = $sch_lower;
		} else {
			$num_schools = int(rand($sch_upper - $sch_lower)) + $sch_lower;
		}
		if ($num_schools != int($num_schools)) {
			print "Invalid argument for create-schools\n";
			usage_exit();
		}

		# Process school creation for $num_schools
		my ($done) = make_schools($num_schools);

		print "\n$done schools created \n" unless ($silent);
	}

	return ($schools);
}

sub create_students {
	my ($students, $school) = @_;

	if (defined $students) {

		my ($done) = make_students($students, $school);

		print "\n$done students created \n" unless ($silent);
	}
	return ($students);
}

sub create_staff {
	my ($staff, $school) = @_;

	if (defined $staff) {

		my ($done, $xxx) = make_staff($staff, $school);

		print "\n$done staff created \n" unless ($silent);
	}
	return ($staff);
}

sub create_rooms {
	my ($rooms, $school) = @_;

	if (defined $rooms) {

		my ($done, $xxx) = make_rooms($rooms, $school);

		print "\n$done rooms created \n" unless ($silent);
	}
	return ($rooms);
}

sub create_groups {
	my ($students, $school) = @_;

	if (defined $students) {

		my ($schools, $rooms) = make_groups($students, $school);

		print "\n$schools schools processed - $rooms groups created \n" unless ($silent);
	}
	return ($students);
}

sub create_scheduled_activities {
        my ($students, $school) = @_;

        if (defined $scheduled_activities) {

                my ($schools, $scheduled_activities) = make_scheduled_activities($students, $school);

                print "\n$schools schools processed - $scheduled_activities schdled activities created \n" unless ($silent);
        }
        return ($scheduled_activities);
}

sub create_grading {
	my ($grading, $school) = @_;

	if (defined $grading) {
		make_grading($grading, $school);
	}
}

sub create_agcollections {
        my ($agcollections) = @_;

        if (defined $agcollections) {
                make_agcollections($agcollections);
        }
}

sub create_student_contacts {
	my ($student_contacts, $school) = @_;

	if (defined $student_contacts) {
		make_student_contacts($student_contacts, $school);
	}
}

sub create_accounts {
	my($account) = @_;

	if (defined $account) {
		make_financial_accounts($account);
	}

	return ($account);
}

sub create_vendors {
	my($vendors) = @_;

	if (defined $vendors) {
		make_vendors($vendors);
	}

	return ($vendors);
}

sub create_debtors {
	my($debtors, $schools) = @_;

	if (defined $debtors) {
		make_debtors($debtors, $schools);
	}

	return ($debtors);
}

sub create_financial_objects {
	my($fobjects) = @_;

	if (defined $fobjects) {
		create_schools($fobjects);

		my $val = ($fobjects * 3) . '..' . ($fobjects *10);
		create_accounts($val);

		create_debtors('10..23'); 		#per school
	}

	return ($fobjects);
}

sub create_ttable {
	my ($ttable, $school) = @_;

	if (defined $ttable) {

		my ($done, $cells) = make_ttable($school);

		print "\n$done time table created - $cells cells \n" unless ($silent);
	}
	return ($ttable);
}

sub fix_data {
	my ($fix) = @_;

	my $result = '';
	if ($fix) {

		my $kla = $sd->make_kla;
		$result = 'ok';
		print " KLA = $kla $result\n";
	}

	return ($result);
}

sub code_set {
	my ($cs_request) = @_;
	if ($cs_request) {
		# TODO Check table already exists ? (assume)
		my $cs_data = $sd->load_codeset();

		my $old_count = 0;
		my $old_data = {};
		# XXX XML - How to do a basic SELECT from the Kafka list
		my $sth = $dbh->prepare(q{
			SELECT * FROM CodeSet
		});
		$sth->execute();
		while (my $ref = $sth->fetchrow_hashref) {
			$old_count++;
			$old_data->{$ref->{CodeSet}}{$ref->{CodeKey}} = $ref->{CodeValue};
		}

		$sth = $dbh->prepare(q{
			INSERT INTO CodeSet (CodeSet, CodeKey, CodeValue) VALUES (?, ?, ?)
		});
		my $created = 0;
		my $rows = 0;
		foreach my $CodeSet (keys %$cs_data) {
			foreach my $key (keys %{$cs_data->{$CodeSet}}) {
				$rows++;
				if (! exists($old_data->{$CodeSet}) || !exists($old_data->{$CodeSet}{$key}) ) {
					$created++;
					$sth->execute( $CodeSet, $key, $cs_data->{$CodeSet}{$key} );
				}
			}
		}
		$dbh->commit();
		print "Created $created of $rows in CodeSet\n";
	}
	# return ($result);
}

sub get_range {
	my ($data) = @_;
	my $number;

	$data =~ s/-/\.\./;

	my ($lower, $upper) = split(/\.\./, $data);
	if (! defined $upper) {
		return $lower;
	}

	$number = int(rand($upper - $lower)) + $lower;

	return ($number);
}

sub make_schools {
	my ($schools) = @_;


	my $cnt = 0;
	for (my $i = 0; $i < $schools ; $i++){
		my $data = $sd->create_SchoolInfo({});
		my $uuid = $sd->make_new_id();

		#
		# XXX - Change 'prepare' to an XML Query
		#
		my $sth = $dbh->prepare("
			INSERT INTO SchoolInfo (
				RefId, LocalId, SchoolName, CampusSchoolCampusId, CampusAdminStatus, CampusCampusType,
				StateProvinceId, CommonwealthId, SchoolSector, OperationalStatus,
				IndependentSchool, SchoolType,
				Address_Street_StreetNumber, Address_Street_StreetName, Address_City, Address_StateProvince,
				Address_PostalCode, Address_ARIA, Entity_Open
			) VALUES (
				?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?
			)
		");

		#
		# XXX - Change execute to substitute list of variables by number or name
		#
		$sth->execute(
			$uuid, $sd->create_localid(), $sd->create_school_name(),
			$data->{CampusSchoolCampusId}, $data->{CampusAdminStatus}, $data->{CampusCampusType},
			$data->{StateProvinceId}, $data->{CommonwealthId}, $data->{SchoolSector}, $data->{OperationalStatus},
			$data->{IndependentSchool}, $data->{SchoolType},
			$data->{Address_Street_StreetNumber}, $data->{Address_Street_StreetName}, $data->{Address_City},
			$data->{Address_StateProvince}, $data->{Address_PostalCode}, $data->{Address_ARIA}, $data->{Entity_Open},
		);

		print "School RefId = $uuid\n" unless ($silent);

		make_calendar($uuid);

		++$cnt;
	}
	return ($cnt);
}

sub make_calendar {
	my ($school) = @_;

		my $data = $sd->create_calendar({});

		my $sth = $dbh->prepare("
			INSERT INTO CalendarSummary (
				RefId, SchoolInfo_RefId, SchoolYear, CalendarSummary_LocalId,
				DaysInSession, StartDate, EndDate
			) VALUES (
				?,?,?,?,?,?,?
			)
		");
		$sth->execute(
			$data->{refid}, $school, $data->{schoolyear},
			$sd->create_localid(), $data->{daysinsession},
			$data->{startdate}, $data->{enddate},
		);

		my ($cnt) = make_calendar_days($school, $data);

		print "Calendar created with $cnt days\n" unless ($silent);

	return();
}

sub make_calendar_days {
	my ($school, $data) = @_;

	my $cnt = 0;

	my $working_days = DateTime::Event::Recurrence->weekly( days => [1 .. +5] );

	my ($syear, $smth, $sday) = split('-', $data->{startdate});
	my ($eyear, $emth, $eday) = split('-', $data->{enddate});

	my $start = DateTime->new(year => $syear, month => $smth, day => $sday );
	my $end   = DateTime->new(year => $eyear, month => $emth, day => $eday );

	my @days = $working_days->as_list(
    	start => $start,
    	end   => $end
	);

	foreach my $day (@days) {
		my $date = substr($day->datetime, 0, 10);
		my $refid = $sd->make_new_id();
		++$cnt;
		my ($type_code, $towards, $value) = get_date_code($date);


		my $sth = $dbh->prepare("
			INSERT INTO CalendarDate (
				CalendarDate, CalendarSummary_RefId, RefId,
				SchoolInfo_RefId, SchoolYear,
				CalendarDateType_Code, CalendarDateNumber,
				StudentAttendance_CountsTowardsAttendance,
				StudentAttendance_AttendanceValue
			) VALUES (
				?,?,?,?,?,?,?,?,?
			)
		");
		$sth->execute(
			$date, $data->{refid}, $refid, $school, $data->{schoolyear},
			$type_code, $cnt, $towards, $value,
		);

	}

	return ($cnt);
}

sub get_date_code {
	my ($date) = @_;

	my $code = '';
	my $towards = 'Yes';
	my $value = '1.0';

	#if ($date eq '2014-01-28') {
	#	$code = '0845';
	#	$towards = 'No';
	#}
	#if ($date eq '2014-04-18') {
	#	$code = '0846';
	#	$towards = 'No';
	#}
	#if ($date eq '2014-04-25') {
	#	$code = '0846';
	#	$towards = 'No';
	#}

	#quick and dirty: no accounting for weekday/weekend
	if ($date =~ m/-01-26$/) {
		$code = '0845';
		$towards = 'No';
	}
	# arbitrary Easter: no accounting for movable feasts
	if ($date =~ m/-04-18$/) {
		$code = '0845';
		$towards = 'No';
	}
	if ($date =~ m/-04-25$/) {
		$code = '0846';
		$towards = 'No';
	}

	my ($syear, $smth, $sday) = split('-', $date);

	#if ($syear eq '2014') {
		# generalise to all years; quick and dirty fix for now
		if ($smth eq '04') {
			if (($sday >= '05') && ($sday <= '21')) {
				$code = '0846';
				$towards = 'No';
			}
		}
		if ($smth eq '06') {
			if (($sday >= '28') && ($sday <= '30')) {
				$code = '0846';
				$towards = 'No';
			}
		}
		if ($smth eq '07') {
			if (($sday >= '01') && ($sday <= '13')) {
				$code = '0846';
				$towards = 'No';
			}
		}
		if ($smth eq '09') {
			if (($sday >= '20') && ($sday <= '30')) {
				$code = '0846';
				$towards = 'No';
			}
		}
		if ($smth eq '10') {
			if (($sday >= '01') && ($sday <= '05')) {
				$code = '0846';
				$towards = 'No';
			}
		}

		#}
	$code = 'INST' unless $code;
	$value = '0.0' if ($towards eq 'No');

	return ($code, $towards, $value);
}

sub make_students {
	my ($students, $school, $year) = @_;

	my $cnt = 0;

	my $sth;
	if (defined $school) {
		$sth = $dbh->prepare("SELECT * from SchoolInfo WHERE RefId = \"$school\"");
	} else {
		$sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	}
	$sth->execute();

	while (my $row = $sth->fetchrow_hashref) {
		my $schoolid = $row->{RefId};

		my ($num_students) = get_range($students);

		for (my $i = 0; $i < $num_students; $i++){
			my $data = $sd->create_StudentPersonal({});

			$data->{YearLevel} = $year if (defined $year);

		    my $local_id = $sd->create_localid();
		    my $sth = $dbh->prepare("
				INSERT INTO StudentPersonal (
					RefId, LocalId, FamilyName, GivenName, MiddleName, PreferredGivenName, SchoolInfo_RefId, YearLevel,
					StateProvinceId, Sex, BirthDate, IndigenousStatus,
					CountryofBirth, MostRecent_YearLevel, MostRecent_Parent1Language, MostRecent_Parent2Language,
					MostRecent_Parent1SchoolEducation, MostRecent_Parent2SchoolEducation,
					MostRecent_Parent1NonSchoolEducation, MostRecent_Parent2NonSchoolEducation,
					MostRecent_Parent1EmploymentType, MostRecent_Parent2EmploymentType,
					Email

				) VALUES (
					?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?
				)
			");
		    $sth->execute(
				$data->{refid}, $local_id, $data->{FamilyName}, $data->{GivenName}, $data->{MiddleName},
				$data->{GivenName}, $schoolid, $data->{yearlevel},
				$data->{StateProvinceId}, $data->{Sex}, $data->{BirthDate}, $data->{IndigenousStatus},
				$data->{CountryofBirth}, $data->{MostRecent_YearLevel},
				$data->{MostRecent_Parent1Language}, $data->{MostRecent_Parent2Language},
				$data->{MostRecent_Parent1SchoolEducation}, $data->{MostRecent_Parent2SchoolEducation},
				$data->{MostRecent_Parent1NonSchoolEducation}, $data->{MostRecent_Parent2NonSchoolEducation},
				$data->{MostRecent_Parent1EmploymentType}, $data->{MostRecent_Parent2EmploymentType},
				$data->{Email}
			);

			# Add to StudentSchoolEnrollment
			my $enroll = $sd->create_StudentSchoolEnrollment($data->{yearlevel});
			my  $sth1 = $dbh->prepare("INSERT INTO StudentSchoolEnrollment (
			RefId, StudentPersonal_RefId, SchoolInfo_refId, MembershipType,
			SchoolYear, TimeFrame, YearLevel, FTE, EntryDate)

			Values(?,?,?,?,?,?,?,?,?)");

			$sth1->execute(
				$enroll->{refid}, $data->{refid}, $schoolid,
				$enroll->{MembershipType}, $enroll->{SchoolYear},
				$enroll->{TimeFrame}, $enroll->{YearLevel}, $enroll->{FTE},
				$enroll->{EntryDate}
			);

			++$cnt;
		}
	}
	return ($cnt);
}

sub make_staff {
	my ($staff, $school) = @_;

	my $cnt = 0;

	# Get School Info
	my $sth;
	if (defined $school) {
		$sth = $dbh->prepare("SELECT * from SchoolInfo WHERE RefId = \"$school\"");
	} else {
		$sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	}
	$sth->execute();

	# Insert staff into table
	my $refid;
	while (my $row = $sth->fetchrow_hashref) {
		my $schoolid = $row->{RefId};

		my ($num_staff) = get_range($staff);

		for(my $i = 0; $i < $num_staff; $i++){
			my $data = $sd->create_StaffPersonal({});

			my $BirthDate = sprintf(
				"%04d-%02d-%02d",
				int(rand(45)) + 1950,
				int(rand(12)) + 1,
				int(rand(28)) + 1,
			);

			my $local_id = $sd->create_localid();
			my  $sth0 = $dbh->prepare("INSERT INTO StaffPersonal (RefId,
			LocalId, FamilyName, GivenName, MiddleName, PreferredGivenName,
			SchoolInfo_RefId, StateProvinceId, Sex, EmploymentStatus,
			PhoneNumber, Email, BirthDate, PreferredFamilyName, Salutation)
			Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			$sth0->execute(
				$data->{refid}, $local_id, $data->{FamilyName},
				$data->{GivenName}, $data->{MiddleName},
				$data->{PreferredGivenName}, $schoolid,
				$data->{StateProvinceId}, $data->{Sex},
				$data->{EmploymentStatus}, $data->{PhoneNumber},
				$data->{Email}, $BirthDate, $data->{FamilyName},
				$data->{Salutation}

			);

			$refid = $data->{refid};

			# Add to StaffAssignment
			my $assign = $sd->create_StaffAssignment({});
			my  $sth1 = $dbh->prepare("INSERT INTO StaffAssignment (RefId,
			SchoolInfo_RefId, SchoolYear, StaffPersonal_RefID, Description,
			PrimaryAssignment, JobStartDate, JobEndDate, JobFunction,
			StaffActivity_Code)
			Values(?,?,?,?,?,?,?,?,?,?)");

			$sth1->execute(
				$assign->{refid}, $schoolid, $assign->{SchoolYear},
				$refid, $assign->{Description},
				$assign->{PrimaryAssignment}, $assign->{JobStartDate},
				$assign->{JobEndDate}, $assign->{JobFunction},
				$assign->{StaffActivity_Code}
			);

			# Add to StaffPersonal_OtherId
			my $type1 = 'DET_USER_ID';
			my $type2 = 'pep';
			$type2 = 'cep' if ($cnt == int($cnt / 10));
			my $other = 'random_string';
			my $sth2 = $dbh->prepare("INSERT INTO StaffPersonal_OtherId
			(StaffPersonal_RefId, OtherId, OtherIdType)
			Values(?,?,?)");

			$sth2->execute(
				$refid, $other, $type1
			);

			$sth2->execute(
				$refid, $other, $type2
			);



			++$cnt;
		}
	}
	return ($cnt, $refid);
}

sub make_rooms {
	my ($rooms, $school) = @_;

	my $cnt = 0;

	# Get School Info
	my $sth;
	if (defined $school) {
		$sth = $dbh->prepare("SELECT * from SchoolInfo WHERE RefId = \"$school\"");
	} else {
		$sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	}
	$sth->execute();

	# Insert rooms into table
	my $refId;
	while (my $row = $sth->fetchrow_hashref) {
		my $schoolid = $row->{RefId};

		my ($num_rooms) = get_range($rooms);

		for(my $i = 0; $i < $num_rooms; $i++){
			$refId = $sd->make_new_id();
			my $roomNumber = int(rand(1000) + 1);
			my $description = "Room $roomNumber";
			my $capacity = int(rand(50) + 10);
			my $roomsize = $sd->make_room_size();
			my $roomtype = $sd->make_room_type();
			my $sth = $dbh->prepare("INSERT INTO RoomInfo (RefId,
				SchoolInfo_RefId, RoomNumber, Description, Capacity,
				RoomSize, RoomType)
				Values(?,?,?,?,?,?,?)");
			$sth->execute($refId, $schoolid, $roomNumber, $description,
				$capacity, $roomsize, $roomtype);
			++$cnt;
		}
	}
	return ($cnt, $refId);
}

sub make_groups {
	my ($students, $school) = @_;

	my $cnt = 0;
	my $room_cnt = 0;

	# Get School Info
	my $school_sth;
	if (defined $school) {
		$school_sth = $dbh->prepare("SELECT * from SchoolInfo WHERE RefId = \"$school\"");
	} else {
		$school_sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	}
	$school_sth->execute();

	while (my $row = $school_sth->fetchrow_hashref) {
		my $schoolid = $row->{RefId};

		# select any rooms -or create them.
		my $select = "SELECT * FROM RoomInfo WHERE SchoolInfo_RefId = \"$schoolid\"";
		my $room_sth;
		$room_sth = $dbh->prepare($select);
		$room_sth->execute();
		my $rooms = 0;

		while (my $room = $room_sth->fetchrow_hashref) {
			++$rooms;
		}

		if ($rooms < 12 ) {
			my $num = 12 - $rooms;
			my ($new_rooms, $xxx) = make_rooms($num, $schoolid);
			print "\n$new_rooms rooms created for school_id $schoolid\n" unless ($silent);
			$rooms = 12;
		}

#		$room_sth = $dbh->prepare($select);
		$room_sth->execute();

		# get $n random, unique subjects for years 10 - 12

		my $n = 4;
		my ($subject_ref, $num_subjects) = get_subjects($schoolid, $n);

		my @subjects;
		for my $y (1..$n) {
			my $new = 0;
			until ($new) {
				my $shortname = $subject_ref->[int(rand($num_subjects))];
				$new = 1;
				for my $t (1..$n) {
					if (defined $subjects[$t]) {
						$new = 0 if ($subjects[$t] eq $shortname);
					}
				}
				$subjects[$y] = $shortname if ($new);
			}
		}

		my $student_base = '10..28';      # Number to create if none found
		my $year = 0;
		while (my $room = $room_sth->fetchrow_hashref) {
			my $roomid = $room->{RefId};

			my $refid;
			++$year;

			next if ($year > 12);

			my ($students_ref, $num_students) = get_students($schoolid, $student_base, $year);
			# if there are no students, don't bother creating teaching groups
			next unless $num_students;

			# assign students to TeachingGroups for years 1-9
			my @assigned;
			for my $s (0..$num_students - 1) {
				my $st = $students_ref->[$s];
				my $tgroup = int(rand(6)) + 1;
				push @{$assigned[$tgroup]}, $st
			}

			if ($year > 9) {
				# Assign students for this year to 4 groups
				my @studentg;
				for my $s (0..$num_students - 1) {
					my $st = $students_ref->[$s];
					my $tgroup = int(rand(4)) + 1;
					push @{$studentg[$tgroup]}, $st
				}

				my $num_subs = $#subjects;

				for my $s (1..$num_subs) {

					my $shortname = $subjects[$s];
					my $longname = $sd->make_long_name($shortname);

					# Randomise indexes
					my @populate;
					for my $y (1..4) {
						my $new = 0;
						until ($new) {
							my $p = int(rand(6)) + 1;
							$new = 1;
							for my $t (1..4) {
								if (defined $populate[$t]) {
									$new = 0 if ($populate[$t] eq $p);
								}
							}
							$populate[$y] = $p if ($new);
						}
					}

					for my $i (1..6) {
						# Do not create a teaching group with no students
						next unless ((defined $populate[$s]) && ($i == $populate[$s]) and $studentg[$s]);

						my $name = $year . chr(64 + $i) . " $longname";

						# Insert TeachingGroupInfo
						($refid) = make_teaching_group($schoolid, $roomid, $name, $year);
						++$room_cnt;

						# select students and staff - or create them
						if ((defined $populate[$s]) && ($i == $populate[$s])) {
							add_students($refid, $studentg[$s]);
						}

						add_staff($refid, $schoolid, $rooms);
					}
				}

				next;
			}

			for my $i (1..6) {
				# Do not create a teaching group with no students
				next unless ($assigned[$i]);
                # print "XXX XXX XXX $schoolid - $i = " . Dumper($assigned[$i]) . "\n";

				my $name = $year . chr(64 + $i);

				# Insert TeachingGroupInfo
				($refid) = make_teaching_group($schoolid, $roomid, $name, $year);
				++$room_cnt;

				# select students and staff - or create them
				add_students($refid, $assigned[$i]);

				add_staff($refid, $schoolid, $rooms);
			}
		}
		++$cnt;
	}
	return ($cnt, $room_cnt);
}

sub make_scheduled_activities {
        my ($students, $school) = @_;

        my $cnt = 0;
        my $activities_cnt = 0;

        # Get School Info
        my $school_sth;
        if (defined $school) {
                $school_sth = $dbh->prepare("SELECT * from SchoolInfo WHERE RefId = \"$school\"");
        } else {
                $school_sth = $dbh->prepare("SELECT * FROM SchoolInfo");
        }
        $school_sth->execute();

        # presupposes there is a populated timetable for each school
        while (my $row = $school_sth->fetchrow_hashref) {
                my $schoolid = $row->{RefId};
                my $num_students = get_range($students);
                my ($students_ref, $num_students1) = get_students($schoolid, $num_students, undef);
                my (@staff) = get_staff($schoolid, 1, $num_students1/10 + 1);
                for(my $i=0; $i<$num_students; $i++) {
                # Get the timetable
                my ($ttable, $cellcount) = get_cells($schoolid, -1);
                my $i = int(rand(scalar @$ttable));
                # RefId, TimeTable_RefId, TimeTableSubject_RefId, DayId, PeriodId 
                make_scheduled_activity($schoolid, $students_ref->[int(rand( $num_students1))], $staff[int(rand(scalar @staff))],
                  $$ttable[$i][0], $$ttable[$i][1], $$ttable[$i][2], $$ttable[$i][3], $$ttable[$i][4]);
                $activities_cnt++;
              }
                $cnt++;
        }
        return ($cnt, $activities_cnt);
}

sub make_scheduled_activity {
        my ($schoolid, $studentid, $staffid, $cellid, $timetableid, $subjectid, $dayid, $periodid) = @_;

        my $data = $sd->create_ScheduledActivity({
                schoolid => $schoolid,
                cellid   => $cellid,
                timetableid   => $timetableid,
                subjectid   => $subjectid,
                dayid   => $dayid,
                periodid   => $periodid,
        });

        my $sth = $dbh->prepare("
                INSERT INTO ScheduledActivity (
                        RefId, SchoolInfo_RefId, TimeTableCell_RefId, TimeTable_RefId, TimeTableSubject_RefId, DayId, PeriodId,
                        Date, StartTime, FinishTime, CellType, Location, Type, Name
                )
                values (
                        ?,?,?,?,?,?,?,?,?,?,?,?,?,?
                )
        ");
        $sth->execute(
                $data->{refid}, $data->{schoolid}, $data->{cellid},
                        $data->{timetableid}, $data->{subjectid},
                        $data->{dayid}, $data->{periodid},
                        $data->{date}, $data->{start_time},
                        $data->{finish_time}, $data->{cell_type},
                        $data->{location}, $data->{type}, 
                        $data->{name}
        );
        $sth = $dbh->prepare("
                INSERT INTO ScheduledActivity_Student (
                        ScheduledActivity_RefId, StudentPersonal_RefId
                )
                values (
                        ?,?
                )
        ");
        $sth->execute(
                $data->{refid}, $studentid
        );
        $sth = $dbh->prepare("
                INSERT INTO ScheduledActivity_Teacher (
                        ScheduledActivity_RefId, StaffPersonal_RefId, StartTime, FinishTime,
                        Credit, Supervision, Weighting
                )
                values (
                        ?,?,?,?,?,?,?
                )
        ");
        my $credit = rand();
        my $supervision = rand();
        $sth->execute(
                $data->{refid}, $staffid, $data->{start_time},
                        $data->{finish_time}, 
                        $credit > 0.9 ? "Casual" :
                        $credit > 0.8 ? "Extra" :
                        $credit > 0.7 ? "In-Lieu" :
                        $credit > 0.6 ? "Underload" : "",
                        $supervision > 0.9 ? "MergedClass" :
                        $supervision > 0.8 ? "MinimalSupervision" : "Normal",
                        "1.0"
        );


        return $data->{refid};
}


sub make_teaching_group {
	my ($schoolid, $roomid, $name, $year) = @_;

	my $data = $sd->create_TeachingGroup({
		schoolid => $schoolid,
		roomid   => $roomid
	});

	$data->{short_name} = $name if (defined $name);
	$data->{long_name} = $name if (defined $name);
	$data->{yearlevel} = $year if (defined $year);

	my $sth = $dbh->prepare("
		INSERT INTO TeachingGroup (
			RefId, ShortName, LongName, LocalId, SchoolYear, SchoolInfo_RefId, KLA
		)
		values (
			?,?,?,?,?,?,?
		)
	");
	$sth->execute(
		$data->{refid}, $data->{short_name}, $data->{long_name},
			$data->{localid}, $data->{yearlevel},
			$data->{schoolid}, $data->{kla}
	);

	return $data->{refid};
}

sub add_students {
	my ($refid, $students) = @_;

	foreach my $student (@$students) {

		my $sth_tg_student = $dbh->prepare(q{
			INSERT INTO TeachingGroup_Student
			(TeachingGroup_RefId, StudentPersonal_RefId)
			VALUES (?, ?)
 		});

		$sth_tg_student->execute(
			$refid, $student
		);
	}

	return($students);
}

sub add_staff {
	my ($refid, $schoolid, $rooms) = @_;

	my $lower = $rooms + 2;
	my $upper = $rooms + 6;

	my (@staff) = get_staff($schoolid, $lower, $upper);

	@staff = sort { int(rand 3)-1 <=> int(rand 3)-1 } @staff;

	my $num_staff = int(rand($upper - $lower)) + $lower;

	# Assign 1 teacher per teaching group
	my $staff_member = int(rand($num_staff)) + 1;

	my $sth_tg_staff = $dbh->prepare(q{
		INSERT INTO TeachingGroup_Teacher
		(TeachingGroup_RefId, StaffPersonal_RefId,
		TeacherAssociation, TeacherLocalId)
		VALUES (?, ?, ?, ?)
 	});

	$sth_tg_staff->execute(
		$refid, $staff[$staff_member], '', ''
	);

	return();
}

sub add_given_staff_to_teaching_group ($$) {
	my ($tgid, $staffid) = @_;
        my $sth_tg_staff = $dbh->prepare(q{
                INSERT INTO TeachingGroup_Teacher
                (TeachingGroup_RefId, StaffPersonal_RefId,
                TeacherAssociation, TeacherLocalId)
                VALUES (?, ?, ?, ?)
       });

       $sth_tg_staff->execute(
                $tgid, $staffid, '', ''
       );

       return();
}

sub get_subjects {
	my ($schoolid, $n) = @_;

	my @subject_list;
	my $select = "SELECT SubjectShortName from TimeTableSubject WHERE SchoolInfo_RefId = \"$schoolid\"";
	my $sth;
	$sth = $dbh->prepare($select);
	$sth->execute();

	my $subjects = 0;
	while (my $subject_row = $sth->fetchrow_hashref) {
		++$subjects;
	}

	my $num = $n * 3;
	if ($subjects < $num) {
		for my $i (1..$num) {
			my ($done) = make_timetable_subject($schoolid);
		}
		print "\n$num subjects created for school $schoolid\n" unless ($silent);
	}

	$sth->execute();
	$subjects = 0;
	while (my $subject_row = $sth->fetchrow_hashref) {
		push @subject_list, $subject_row->{SubjectShortName};
		++$subjects;
	}

	return (\@subject_list, $subjects);
}

# if $n less than total number of cells in db, return total number of cells in db
sub get_cells {
        my ($schoolid, $n) = @_;

        my @subject_list;
        my $limit = "";
        if ($n > 0) {
          $limit = " LIMIT $n";
        }
        my $select = "SELECT c.RefId, c.TimeTable_RefId, c.TimeTableSubject_RefId, c.DayId, c.PeriodId from TimeTableCell c, TimeTable t WHERE c.TimeTable_RefId = t.RefId AND t.SchoolInfo_RefId = \"$schoolid\" $limit";
        my $sth;
        $sth = $dbh->prepare($select);
        $sth->execute();

        my $cells = 0;
        while (my $subject_row = $sth->fetchrow_hashref) {
                push @subject_list, [$subject_row->{RefId}, $subject_row->{TimeTable_RefId}, $subject_row->{TimeTableSubject_RefId}, 
                $subject_row->{DayId}, $subject_row->{PeriodId}];
                ++$cells;
        }

        return (\@subject_list, $cells);
}



sub get_students {
	my ($school, $number, $year)= @_;

	$number =~ s/-/\.\./;
	my ($lower, $upper) = split(/\.\./, $number);
	if (! defined $upper) {
		$upper = $lower;
		$lower = 1;
	}

	my @student_list;
	my $select;
	if (defined $year) {
		$select = "SELECT RefId from StudentPersonal WHERE SchoolInfo_RefId = \"$school\" and YearLevel = \"$year\"";
	} else {
		$select = "SELECT RefId from StudentPersonal WHERE SchoolInfo_RefId = \"$school\"";
	}
	my $sth;
	$sth = $dbh->prepare($select);
	$sth->execute();

	my $students = 0;
	while (my $student_row = $sth->fetchrow_hashref) {
		++$students;
	}

	if (! $students) {
		my $min = $upper * 2;
		my $max = $upper * 5;
		my ($done) = make_students("$min..$max", $school, $year);
		print "\n$done students created for school $school\n" unless ($silent);
	}

	$sth->execute();
	$students = 0;
	while (my $student_row = $sth->fetchrow_hashref) {
		push @student_list, $student_row->{RefId};
		++$students;
	}
	return (\@student_list, $students);
}

sub get_staff {
	my ($school, $min, $max)= @_;

	my @staff_list;
	my $select = "SELECT RefId from StaffPersonal WHERE SchoolInfo_RefId = \"$school\"";
	my $sth;
	$sth = $dbh->prepare($select);
	$sth->execute();

	my $staff = 0;
	while (my $staff_row = $sth->fetchrow_hashref) {
		++$staff;
	}

	if ($staff < $max) {
		my $num = $max - $staff;
		my ($done, $xxx) = make_staff("$num", $school);
		print "$done staff created for school $school\n" unless ($silent);
	}

	$sth->execute();
	while (my $staff_row = $sth->fetchrow_hashref) {
		push @staff_list, $staff_row->{RefId};
	}
	return @staff_list;
}

#
# Populate the GradingAssignment and GradingAssignmentScore tables
#

sub make_grading {
	my ($grading, $school) = @_;

	my $sth;
	if (defined $school) {
		$sth = $dbh->prepare("SELECT * from TeachingGroup WHERE SchoolInfo_RefId = ?");
		$sth->execute($school);
	} else {
		$sth = $dbh->prepare("SELECT * FROM TeachingGroup");
		$sth->execute();
	}

	my $num_tg_seen = 0;

	while (my $row = $sth->fetchrow_hashref) {

		$num_tg_seen++;
		my $students_in_tg = students_in_teaching_group($row->{RefId});

		# Create 5 grading assignments per teaching group

		for ( 1 .. 5 ) {
			my $sth = $dbh->prepare(q{
				INSERT INTO GradingAssignment
					(
						RefId,
						TeachingGroup_RefId,
						GradingCategory,
						Description,
						PointsPossible,
						CreateDate,
						DueDate,
						Weight,
						MaxAttemptsAllowed,
						DetailedDescriptionURL
					)
				VALUES
					(
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?
					)
 			});

			my @values = $sd->create_grading_assignment($row->{RefId});
			$sth->execute( @values );

			my $gaId   = $values[0];

			#
			# GradingAssignmentScore:
			# Create one score per student in a teaching group and grading assignment
			# (i.e. num_students_in_tg * 5_assignments_in_tg * num_tg)
			#

			next if (scalar @{ $students_in_tg } == 0);

			foreach my $stId ( @{ $students_in_tg } ) {

				my $sth2 = $dbh->prepare(q{
					INSERT INTO GradingAssignmentScore
						(
							RefId,
							StudentPersonal_RefId,
							TeachingGroup_RefId,
							GradingAssignment_RefId,
							ScorePoints,
							ScorePercent,
							ScoreLetter,
							ScoreDescription
						)
					VALUES
						(
							?,
							?,
							?,
							?,
							?,
							?,
							?,
							?
						)
 				});
				$sth2->execute(
					$sd->create_grading_assignment_score(
						$stId->[0],
						$row->{RefId},
						$gaId
					)
				);
			}
		} # 1 .. 5 grading assignments
	} # TeachingGroup rows

	if ( (defined $grading) && ($num_tg_seen == 0) ) {
		die qq(\nNo teaching groups were found.\nYou may need to run this program with the "--create-teaching-groups" options first);
	}
}

#
# Populate the CollectionRound and CollectionStatus tables
#

sub make_agcollections {
        my ($grading, $school) = @_;

                my $sth_collectionround = $dbh->prepare(q{
                                        INSERT INTO CollectionRound
                                        (
                                                RefId,
                                                AGCollection,
                                                CollectionYear
                                        )
                                VALUES
                                        (
                                                ?,
                                                ?,
                                                ?
                                        )
                        });
                 my $sth_aground = $dbh->prepare(q{
                                INSERT INTO AGRound
                                        (
                                                CollectionRound_RefId, RoundCode, RoundName,
                                                StartDate, DueDate, EndDate
                                        )
                                VALUES
                                        (
                                                ?, ?, ?, ?, ?, ?
                                        )
                   });
                   my $sth_collectionstatus = $dbh->prepare(q{
                                INSERT INTO CollectionStatus
                                        (
                                                RefId, ReportingAuthority, ReportingAuthoritySystem,
                                                ReportingAuthorityCommonwealthId, SubmittedBy,
                                                SubmissionTimestamp, AgCollection, CollectionYear, RoundCode
                                        )
                                VALUES
                                        (
                                                ?, ?, ?, ?, ?, ?, ?, ?, ?
                                        )
                   });
                   my $sth_objectresponse = $dbh->prepare(q{
                                INSERT INTO CollectionStatus_AGReportingObjectResponse
                                        (
                                                CollectionStatus_RefId, SubmittedRefId, SifRefId, 
                                                HttpStatusCode, ErrorText, CommonwealthId, 
                                                EntityName, AgSubmissionStatusCode
                                        )
                                VALUES
                                        (
                                                ?, ?, ?, ?, ?, ?, ?, ?
                                        )
                   });
                   my $sth_getresponse = $dbh->prepare("
                        SELECT id FROM CollectionStatus_AGReportingObjectResponse WHERE
                        CollectionStatus_RefId = ? AND SubmittedRefId = ?");
                   my $sth_agrule = $dbh->prepare(q{
                                INSERT INTO CollectionStatus_AGROResponse_AGRule
                                        (
                                                AGReportingObjectResponse_Id, AGRuleCode, 
                                                AGRuleComment, AGRuleResponse, AGRuleStatus

                                        )
                                VALUES
                                        (
                                                ?, ?, ?, ?, ?
                                        )
                   });

        foreach $type qw(COI FQ SES STATS) {
                 my @collection_rounds_values = $sd->create_collection_rounds($type);
                 $sth_collectionround->execute( @collection_rounds_values );
                 my $roundrefid = $collection_rounds_values[0];
                 foreach my $roundnumber (1..2) {
                        my @values = $sd->create_collection_round_list_item($roundrefid, $type, $roundnumber);
                        $sth_aground->execute( @values );
                        my @collection_status_values = $sd->create_collection_status($type, $roundnumber);
                        $sth_collectionstatus->execute( @collection_status_values );
                        my $collectionstatusrefid = $collection_status_values[0];
                        my @reporting_object_response_values = $sd->create_reporting_object_response($collectionstatusrefid, $type, $roundnumber);
                        $sth_objectresponse->execute( @reporting_object_response_values );
                        $sth_getresponse->execute([$reporting_object_response_values[0], $reporting_object_response_values[1]]);
                        my $row = $sth->fetchrow_hashref;
                        my $reportingobjectrecordnumber = $row->{id};
                        foreach my $rulenumber (1..3) {
                            my @ag_rule_values = $sd->create_agrule($reportingobjectrecordnumber, sprintf("WR-%03d", $rulenumber));
                            $sth_agrule->execute( @ag_rule_values );

                        }
                 }
        }
}

sub num_teaching_groups {
	my ($schoolId) = @_;

	my $sth = $dbh->prepare("SELECT count(*) AS cnt from TeachingGroup WHERE SchoolInfo_RefId = ?");
	$sth->execute($schoolId);
	my $row = $sth->fetchrow_hashref;

	return $row->{cnt};
}

sub students_in_teaching_group {
	my ($tgId) = @_;

	my $sth = $dbh->prepare("
		SELECT
			StudentPersonal_RefId
		FROM
			TeachingGroup_Student
		WHERE
			TeachingGroup_RefId = ?"
	);
	$sth->execute($tgId);
	return $sth->fetchall_arrayref;
}

#
# #133: Populate student contact records
# Tables:
#     address, language, StudentSchoolEnrollment, StudentContactPersonal, StudentContactRelationship
#

sub make_student_contacts {
	my ($student_contacts, $school) = @_;

	my $sth;
	#if (defined $school) {
	#	$sth = $dbh->prepare("TODO WHERE TODO = ?");
	#	$sth->execute($school);
	#} else {
	#	$sth = $dbh->prepare("TODO");
	#	$sth->execute();
	#}

	$sth = $dbh->prepare("SELECT RefId FROM StudentPersonal");
	$sth->execute();

	my $insert_address = $dbh->prepare("INSERT INTO Address (Person_RefId, AddressType, AddressRole, Line1, City, StateProvince,PostalCode) VALUES (?, '0123', '012A', ?, ?, ?, ?)");
	my $insert_language = $dbh->prepare("INSERT INTO Language (Person_RefId, LanguageCode, LanguageType) VALUES (?, ?, ?)");

	# XXX Temp hack ignore duplicates here
	my $insert_contact = $dbh->prepare(q{
		INSERT IGNORE INTO StudentContactPersonal
			(
				RefId, LocalId,
				Title, FamilyName, GivenName, PreferredGivenName, PreferredFamilyName,
				Sex,
				PhoneNumberType, PhoneNumber,
				Email, EmailType,
				SchoolEducationLevel, NonSchoolEducation, EmploymentType
			)
		VALUES
			(
				?, ?,
				?, ?, ?, ?, ?,
				?,
				?, ?,
				?, ?,
				?, ?, ?
			)
	});

	my $insert_relationship = $dbh->prepare(q{
		INSERT IGNORE INTO StudentContactRelationship
			(
				RefId, StudentPersonal_RefId, StudentContactPersonal_RefId,
				Relationship, ParentLegalGuardian,
				PickupRights, LivesWith, AccessToRecords,
				EmergencyContact, HasCustody, DisciplinaryContact, PrimaryCareProvider,
				FeesBilling, FamilyMail, InterventionOrder
			)
		VALUES
			(
				?, ?, ?,
				?, ?,
				?, ?, ?,
				?, ?, ?, ?,
				?, ?, ?
			)
	});

	my $done_address = 0;
	my $done_contact = 0;
	my $done_language = 0;
	while (my $row = $sth->fetchrow_hashref) {
		# STUDENT CONTACT PERSONAL - 2
		for (my $i = 0; $i < 1; $i++) {
			$done_contact++;
			# print "Creating contact - $row->{RefId} $i\n";
			my $mf = (rand(10) > 5);

			my $refid = $sd->make_new_id();
			my $refid2 = $sd->make_new_id();
			my $relationship = rand(10) <= 8 ? "1" : int(rand(12) + 2);
			$relationship = "0$relationship" if ($relationship < 10);
                        my $data = $sd->create_StaffPersonal({});
			$insert_contact->execute(
				$refid, int(rand(1000000)),
                                $data->{Salutation},
                                $data->{GivenName}, $data->{FamilyName},
                                $data->{GivenName}, $data->{FamilyName},
				$data->{Sex},
				"0096", 
				int(rand(90000000)) + 9999999, # make sure no initial zero in phone number
                                $data->{Email},
				"01",
				int(rand(5)), int(rand(4) + 5), int(rand(4)+1) # corrected

			);

			$insert_relationship->execute(
				# Random ID, Student Personal, Contact ID
				$refid2, $row->{RefId}, $refid,
				$relationship,
				# (see #XXX) $relationship == 1 ? ( $mf ? "Parent1" : "Parent2") : "",
				#['Y','N','U','X']->[int(rand(4))],
				rand(10) < 8 ? 'Y' : 'N',
				rand(10) < 9 ? 'Y' : 'N', rand(10) < 9 ? 'Y' : 'N', rand(10) < 9 ? 'Y' : 'N',
				rand(10) < 9 ? 'Y' : 'N', rand(10) < 9 ? 'Y' : 'N', rand(10) < 9 ? 'Y' : 'N', rand(10) < 9 ? 'Y' : 'N',
				rand(10) < 9 ? 'Y' : 'N', rand(10) < 9 ? 'Y' : 'N', rand(10) < 9 ? 'Y' : 'N',
			);
		}

		# ADDRESS
		$done_address++;
		# print "Creating address - $row->{RefId}\n";
		$insert_address->execute(
			$row->{RefId},
			"Line1",	# mpf
			"City1",
			"StatePrivince",
			"PostalCode"
		);

		# LANGUAGE
		$done_language++;
		# print "Creating Language - $row->{RefId}\n";
		$insert_language->execute(
			$row->{RefId},
			"1201",
			"1"
		);

		# 20% extra record
		if (rand(10) < 2) {
            my @langs = ('0002', '7101', '2401', '2201', '5203', '4202');
			$done_language++;
			# print "Creating 2nd Language - $row->{RefId}\n";
			my $loc = int(rand(scalar(@langs) - 1));
			$insert_language->execute(
				$row->{RefId},
                $langs[$loc],
				"2"
			);
		}

		# STUDENT CONTACT PERSONAL

	}

	print "\n$done_contact contacts created \n" unless ($silent);
	print "\n$done_language languages created \n" unless ($silent);
	print "\n$done_address addresses created \n" unless ($silent);
	$dbh->commit();
}

sub make_financial_accounts {
	my ($accounts) = @_;

	my ($num_accounts) = get_range($accounts);

	my $faccounts = $sd->load_accounts();
	my $extent = scalar(@{$faccounts});

	my ($location_list, $locations) = get_locations($num_accounts);

	my @new_accounts;

	my $created = 0;

	for (my $i = 0; $i < $num_accounts; $i++){

		my $accnt = $sd->create_financial_account({});

		my $location = undef;
		if ($created/2 == int($created/2)) {
			my $loc = int(rand($locations));
			$location = $location_list->[$loc];
		}

		my ($faccount, $fa_name, $classref) = get_faccount_detail($extent, $faccounts);
		my $sub_act = undef;

		my $sth = $dbh->prepare("
			INSERT INTO FinancialAccount (RefId, SubAccount_RefId,
			LocationInfo_RefId, AccountNumber, Name, Description,
			FinancialClass_RefId, CreationDate, CreationTime)
			Values (?,?,?,?,?,?,?,?,?)");
		$sth->execute($accnt->{refid}, $sub_act, $location,
			$faccount, $fa_name, $accnt->{description}, $classref,
			$accnt->{date_created}, $accnt->{time_created});

		++$created;

		push @new_accounts, $accnt->{refid};
	}

	# Populate Sub_act in a second pass
	# get array of existing FinancialAccounts
	my $sth = $dbh->prepare("
		SELECT RefId from FinancialAccount");
	$sth->execute;

	my $count = 0;
	my @account_list;
	while (my $account_row = $sth->fetchrow_hashref) {
		push @account_list, $account_row->{RefId};
		++$count;
	}

	my $link = 0;
	foreach my $account (@new_accounts) {
		++$link;
		if ($link/2 == int($link/2)) {
			my $found = 0;
			until ($found) {
				my $try = @account_list[int(rand($count))];
				unless  ($try eq $account) {
					$sth = $dbh->prepare("
						UPDATE FinancialAccount SET SubAccount_RefId=?
						WHERE RefId = ?");
					$sth->execute($try, $account);

					$found = 1;
				}
			}
		}
	}
	print "$created Finacial Accounts created\n" unless ($silent);

	return;
}

sub get_faccount_detail {
	my ($extent, $faccounts) = @_;

	my $unique = 0;
	my $rand;
	my $max = 0;
	until ($unique) {
		$rand = int(rand($extent));
		my $sth;
		$sth = $dbh->prepare("
			SELECT AccountNumber FROM FinancialAccount where
			AccountNumber = ?");
		$sth->execute(@{$faccounts}[$rand]->[0]);
		my $acts = 0;
		while (my $a = $sth->fetchrow_hashref) {
			++$acts;
			++$max;
		}
		$unique = 1 if ($acts == 0);
		$unique = 1 if ($max >= $extent);  # All accounts allocated
	}

	my $faccount = @{$faccounts}[$rand]->[0];
	my $fa_name  = @{$faccounts}[$rand]->[1];

	# get or make FinancialClass
	my $class = substr($faccount, 0, 2);
	my $classref;
	my $sth;
	$sth = $dbh->prepare("
		SELECT RefId FROM FinancialClass WHERE Name = ?");
	$sth->execute($class);
	my $cnt = 0;
	while (my $cl = $sth->fetchrow_hashref) {
		++$cnt;
		$classref = $cl->{RefId};
	}
	if (! $cnt) {
		my $fin_class = $sd->create_financial_class({});

		my $sth = $dbh->prepare("
			INSERT INTO FinancialClass (RefId, Name, Description,
				ClassType)
			Values (?,?,?,?)");
		$sth->execute($fin_class->{refid}, $class,
			$fin_class->{description}, $fin_class->{classtype});

		$classref = $fin_class->{refid};
	}

	return ($faccount, $fa_name, $classref);
}


sub get_locations {
	my ($number) = @_;

	my @location_list;
	my $sth;
	$sth = $dbh->prepare("
		SELECT RefId from LocationInfo");
	$sth->execute();

	my $locations = 0;
	while (my $location_row = $sth->fetchrow_hashref) {
		++$locations;
	}

	if (! $locations) {
		my $min = $number;
		my $max = $number * 2;
		my ($done) = make_locations($min, $max);
		print "\n$done Locations created\n" unless ($silent);
	}

	$sth->execute();
	$locations = 0;
	while (my $location_row = $sth->fetchrow_hashref) {
		push @location_list, $location_row->{RefId};
		++$locations;
	}
	return (\@location_list, $locations);

}

sub make_locations {
	my ($min, $max) = @_;

	my $locations = 0;
	my @new_locations;
	my ($number) = get_range($min . '..' . $max);

	for (my $i = 0; $i < $number; $i++){

		my $location = $sd->create_locations({});

		# get random school RefId
		my $sth;
		$sth = $dbh->prepare("
			SELECT RefId from SchoolInfo");
		$sth->execute();

		my $schools = 0;
		my @school_list;
		while (my $school_row = $sth->fetchrow_hashref) {
			push @school_list, $school_row->{RefId};
			++$schools;
		}
		my $schoolref = undef;
		if ($schools == 1) {
			$schoolref = $school_list[0];
		} elsif ($schools > 1) {
            my $r = int(rand($schools));
			$schoolref = $school_list[$r];
		}

		$sth = $dbh->prepare("
			INSERT INTO LocationInfo (RefId, LocationType,
				SiteCategory, Name, Description, LocalId,
				StateProvinceId, Parent_LocationInfo_RefId,
				SchoolInfo_RefId, PhoneNumber)
			Values (?,?,?,?,?,?,?,?,?,?)");
		$sth->execute($location->{refid}, $location->{type},
			$location->{category}, $location->{name},
			$location->{desc}, $location->{localid},
			$location->{stateprov}, $location->{parent},
			$schoolref, $location->{phone});

		my $type = '0123';
		my $role = '1075';
		make_address($location->{refid}, $type, $role);

		push @new_locations, $location->{refid};

		++$locations;
	}

	# populate ParentLocationRefId in a second pass
	# get array of existing locations
	my $sth = $dbh->prepare("
		SELECT RefId from LocationInfo");
	$sth->execute;

	my $count = 0;
	my @location_list;
	while (my $location_row = $sth->fetchrow_hashref) {
		push @location_list, $location_row->{RefId};
		++$count;
	}

	foreach my $parent (@new_locations) {

		my $found = 0;
		until ($found) {
			my $try = @location_list[int(rand($count))];
			unless  ($try eq $parent) {
				$sth = $dbh->prepare(q{
					UPDATE LocationInfo SET Parent_LocationInfo_RefId=?
					WHERE RefId = ?
				});
				$sth->execute($try, $parent);

				$found = 1;
			}
		}
	}

	return $locations;
}

sub make_vendors {
	my ($vendors) = @_;

	my ($num_vendors) = get_range($vendors);
	my $created;

	for (my $i = 0; $i < $num_vendors; $i++){

		my $vendor = $sd->create_vendor({});

		my $sth;
		$sth = $dbh->prepare("
			INSERT INTO VendorInfo (RefId, Name, ContactInfo_FamilyName,
				ContactInfo_GivenName,  ContactInfo_MiddleName,
				ContactInfo_PositionTitle,  ContactInfo_Role,
				ContactInfo_Email,  ContactInfo_PhoneNumber, CustomerId,
				ABN, RegisteredForGST, PaymentTerms, BPay, BSB,
				AccountNumber, AccountName)
			Values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		$sth->execute($vendor->{refid}, $vendor->{name},
			$vendor->{familyname}, $vendor->{givenname},
			$vendor->{middlename}, $vendor->{position},
			$vendor->{role}, $vendor->{email}, $vendor->{phone},
			$vendor->{id}, $vendor->{abn}, $vendor->{gst},
			$vendor->{terms}, $vendor->{bpay}, $vendor->{bsb},
			$vendor->{accountnumber}, $vendor->{accountname});

		++$created;

		my $type = '0123';
		my $role = '1075';
		make_address($vendor->{refid}, $type, $role);
	}

	print "$created Vendors created\n" unless ($silent);

	return;
}

sub get_vendors {
	my ($number, $force) = @_;

	$force = 0 if (! defined $force);	# $force forces new vendors
										# for each school

	my @vendor_list;
	my @vname_list;

	my $sth;
	$sth = $dbh->prepare("
		SELECT RefId, ContactInfo_GivenName, ContactInfo_FamilyName from VendorInfo");
	$sth->execute();

	my $vendors = 0;
	while (my $vendor_row = $sth->fetchrow_hashref) {
		++$vendors;
	}

	$vendors = 0 if ($force);

	if (! $vendors) {
		my $min = $number;
		my $max = $number * 2;
		my $num = $min . '..' . $max;
		my ($done) = make_vendors($num);
	}

	$sth->execute();
	$vendors = 0;
	while (my $vendor_row = $sth->fetchrow_hashref) {
		push @vendor_list, $vendor_row->{RefId};
		push @vname_list, $vendor_row->{ContactInfo_GivenName} . " " . $vendor_row->{ContactInfo_FamilyName};
		++$vendors;
	}

	return (\@vendor_list, $vendors, \@vname_list);

}

sub make_debtors {
	my ($debtors, $school) = @_;

	my $school_sth;
	if (defined $school) {
		$school_sth = $dbh->prepare("SELECT * from SchoolInfo WHERE RefId = \"$school\"");
	} else {
		$school_sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	}
	$school_sth->execute();

	my $created;
	while (my $row = $school_sth->fetchrow_hashref) {
		my $schoolid = $row->{RefId};

		my ($num_debtors) = get_range($debtors);

		my $student_base = '32..45';    # Number to create if none found
		my ($students_ref, $num_students) = get_students($schoolid, $student_base);

		my $item_base = $num_debtors * 2;
		my $force = 1;     # forces new items for each school

		my ($contact_list, $contacts, $cname_list) = get_student_contacts($item_base, $schoolid, $force, $silent);

		my ($vendor_list, $vendors, $vname_list) = get_vendors($item_base, $force);
		my $lower = int($num_students / 33);
		my $upper = int($num_students / 18);
		my (@staff) = get_staff($schoolid, $lower, $upper);

		for (my $i = 0; $i < $num_debtors; $i++){

			my $refid = $sd->make_new_id();
			my $billedentity;
			my $entityref;
			my $billname;
			my $discount;
			my $random;
			if (int($i/2) == $i/2) {
				$random = int(rand($vendors));
				$billedentity = $vendor_list->[$random];
				$entityref = 'VendorInfo';
				$billname = $vname_list->[$random];
				$discount = 0;
			} else {
				$random = int(rand($contacts));
				$billedentity = $contact_list->[$random];
				$entityref = 'StudentContactPersonal';
				$billname = $cname_list->[$random];
				$discount = 10;
			}
			my $billnote = undef;

			my $sth;
			$sth = $dbh->prepare("
				INSERT INTO Debtor (RefId, BilledEntity,
				BilledEntity_SIFRefObject,  BillingName, BillingNote,
				Discount)
				Values (?,?,?,?,?,?)");
			$sth->execute($refid, $billedentity, $entityref,
				$billname, $billnote, $discount);

			++$created;
		}
	}

	print "\n$created Debtors created\n" unless ($silent);

	return;
}

sub get_student_contacts {
	my ($number, $school, $force, $silent) = @_;

	$force = 0 if (! defined $force);	# $force forces new contacts
										# for each school

	my @contact_list;
	my @name_list;
	my $contacts = 0;

	my $sth;
	$sth = $dbh->prepare("
		SELECT RefId, GivenName, FamilyName from StudentContactPersonal");
	$sth->execute();

	while (my $contacts_row = $sth->fetchrow_hashref) {
		++$contacts;
	}

	$contacts = 0 if ($force);

	if (! $contacts) {
		my $min = $number;
		my $max = $number * 2;
		my $num = $min . '..' . $max;
		my ($done) = make_contacts($num);
		print "$done StudentContactPersonal records created\n" unless ($silent);
	}

	$sth->execute();
	$contacts = 0;
	while (my $contacts_row = $sth->fetchrow_hashref) {
		push @contact_list, $contacts_row->{RefId};
		push @name_list, $contacts_row->{GivenName} . " " . $contacts_row->{FamilyName};
		++$contacts;
	}

	return (\@contact_list, $contacts, \@name_list);
}

sub make_contacts {
	my ($contacts) = @_;

	my ($num_contacts) = get_range($contacts);
	my $created = 0;

	for (my $i = 0; $i < $num_contacts; $i++){

		my $contact = $sd->create_studen_contact({});

		my $sth;
		$sth = $dbh->prepare("
			INSERT INTO StudentContactPersonal (RefId, LocalId, Title,
				FamilyName, GivenName, PreferredGivenName,
				PreferredFamilyName, MiddleName, Sex, PhoneNumberType,
				PhoneNumber, Email, EmailType, SchoolEducationLevel,
				NonSchoolEducation, EmploymentType)
			Values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		$sth->execute($contact->{refid}, $contact->{localid},
			$contact->{title}, $contact->{familyname},
			$contact->{givenname}, $contact->{preferredgivenname},
			$contact->{preferredfamilyname}, $contact->{middlename},
			$contact->{sex}, $contact->{phonenumbertype},
			$contact->{phonenumber}, $contact->{email},
			$contact->{emailtype}, $contact->{educationlevel},
			$contact->{nonschooled}, $contact->{employtype});

		++$created;

	}
	return $created;
}

sub make_address {
	my ($refid, $type, $role) = @_;

	my $address = $sd->create_address({});

	my $line1 = undef;
	my $line2 = undef;

	my $sth = $dbh->prepare("
		INSERT INTO Address (Person_RefId, AddressType,
			AddressRole, StreetNumber, StreetName, Line1, Line2,
			City, StateProvince, PostalCode)
		Values (?,?,?,?,?,?,?,?,?,?)");
	$sth->execute($refid, $type, $role, $address->{StreetNumber},
		$address->{StreetName}, $line1, $line2, $address->{City},
		$address->{StateProvince}, $address->{PostalCode});

	return;
}

sub get_or_make_subjects {
  my ($school) = @_;
                 my @subjects = ();
                my $subj_sth = $dbh->prepare("SELECT * from TimeTableSubject WHERE SchoolInfo_RefId = \"$school\"");
                $subj_sth->execute();
                while (my $subjrow = $subj_sth->fetchrow_hashref) {
                  push @subjects, $subjrow->{RefId};
                }
                unless (@subjects) {
                  my ($ii, $subid);
                  for ($ii=0; $ii<10;$ii++) {
                  $subid = make_timetable_subject($school);
                  push @subjects, $subid;
                }
              }
        return @subjects;
}

sub get_or_make_groups {
my ($school, $rooms) = @_;

                 my @groups = ();
                                 my $group_sth = $dbh->prepare("SELECT * from TeachingGroup WHERE SchoolInfo_RefId = \"$school\"");
                $group_sth->execute();
                while (my $row = $group_sth->fetchrow_hashref) {
                  # there are no room IDs stored for teaching groups in the database! Forced to pick one at random
                  push @groups, { refid => $row->{RefId}, yrlvl => $row->{SchoolYear}, rmid => $$rooms[int(rand(scalar @$rooms))] };
                }
                unless (@groups) {
                  my ($ii, $subid);
                  for ($ii=0; $ii<50;$ii++) {
        my $yrlvl = int(rand(12)+1);
        my $rmid = $$rooms[int(scalar @$rooms)];
        my $tgid = make_teaching_group($school, $rmid, $yrlvl . chr(65+int(rand(10))), $yrlvl);;
        # add_given_staff_to_teaching_group($tgid, $staffid);
        add_random_students_to_teaching_group($tgid, $school, 20, $yrlvl);
                  push @groups, { refid => $tgid, yrlvl => $yrlvl, rmid => $rmid };
                }
              }
        return @groups;
}

sub get_or_make_rooms {
  my ($school) = @_;

  my @rooms = ();
        my $select = "SELECT * FROM RoomInfo WHERE SchoolInfo_RefId = \"$school\"";
        my $room_sth = $dbh->prepare($select);
        $room_sth->execute();
        my $rooms = 0;

        while (my $row = $room_sth->fetchrow_hashref) {
                push @rooms, $row->{RefId};
        }
        my $rmid;
        unless (@rooms) {
                my ($xxx, $roomid) = make_rooms(20, $school);
        }
        return @rooms;
}

sub make_ttable {
	my ($school) = @_;

	my $cnt = 0;
	my $cells = 0;

	# Get School Info
	my $school_sth;
	$school_sth = $dbh->prepare("SELECT * from SchoolInfo WHERE RefId = \"$school\"");
	$school_sth->execute();

	while (my $row = $school_sth->fetchrow_hashref) {
		my $schoolid = $row->{RefId};

		my $refid = $sd->make_new_id();
		my $schoolyear = make_this_year();
		my $localid = $sd->create_localid();
		my $title = "Timetable" . $refid;
		my $dayspercycle = $sd->make_days_per_cycle();
		my $periodspercycle = $sd->make_periods_per_cycle();
                my @subjects = get_or_make_subjects($school);
                my @rooms = get_or_make_rooms($school);
                my @groups = get_or_make_groups($school, \@rooms);

		my $sth = $dbh->prepare("INSERT INTO TimeTable(RefId,
			SchoolInfo_RefId, SchoolYear, LocalId, Title,
			DaysPerCycle,PeriodsPerCycle) Values (?,?,?,?,?,?,?)");
		$sth->execute($refid, $schoolid, $schoolyear, $localid, $title,
			$dayspercycle, $periodspercycle);
		for (my $i = 0; $i < $dayspercycle; $i++){
			my $day_id = make_timetable_day($i,$refid);
			for (my $j = 0; $j < $periodspercycle; $j++){
				make_timetable_period($day_id, $refid,$i,$j);
                                # my $subid = make_timetable_subject($schoolid);
                                my $subid = $subjects[int(rand(scalar @subjects))];
                                my $tgid = $groups[int(rand(scalar @groups))];
                                my $rmid = $rooms[int(rand(scalar @rooms))];
				my $done = make_timetable_cell($refid, $subid, $schoolid, $i, $j, $tgid, $$tgid{"rmid"});
				$cells += $done;
			}
		}
		++$cnt
	}
	return ($cnt, $cells);
}

sub make_timetable_cell {
	my ($ttid, $ttsid, $school, $dayid, $periodid, $groupid, $rmid) = @_;

	my $refid = $sd->make_new_id();

=pod=
	# Get or make room
	my $select = "SELECT * FROM RoomInfo WHERE SchoolInfo_RefId = \"$school\"";
	my $room_sth = $dbh->prepare($select);
	$room_sth->execute();
	my $rooms = 0;

	while (my $room = $room_sth->fetchrow_hashref) {
		++$rooms;
	}
	my $rmid;
	if (! $rooms) {
		my ($xxx, $roomid) = make_rooms(1, $school);
		$rmid = $roomid;
	} else {
		my $c = 0;
		my $r = int(rand($rooms));
		$room_sth->execute();
		while (my $row = $room_sth->fetchrow_hashref) {
			$rmid = $row->{RefId} if ($c == $r);
			++$c;
		}
	}
=cut=

	# Get or make staff
	my $select = "SELECT * FROM StaffPersonal WHERE SchoolInfo_RefId = \"$school\"";

	my $staff_sth = $dbh->prepare($select);
	$staff_sth->execute();
	my $num_staff = 0;

	while (my $staff = $staff_sth->fetchrow_hashref) {
		++$num_staff;
	}

	my $staffid;
	if (! $num_staff) {
		my ($xxx, $stid) = make_staff(1, $school);
		$staffid = $stid;
	} else {
		my $c = 0;
		my $r = int(rand($num_staff));
		$staff_sth->execute();
		while (my $row = $staff_sth->fetchrow_hashref) {
			$staffid = $row->{RefId} if ($c == $r);
			++$c;
		}
	}

        #my $yrlvl = int(rand(12)+1);
        #my $tgid = make_teaching_group($school, $rmid, $yrlvl . chr(65+int(rand(10))), $yrlvl);;
        #add_given_staff_to_teaching_group($tgid, $staffid);
        #add_random_students_to_teaching_group($tgid, $school, 20, $yrlvl);
        my $yrlvl = $$groupid{"yrlvl"};
        my $tgid = $$groupid{"refid"};
        add_given_staff_to_teaching_group($tgid, $staffid);
	my $celltype = $sd->make_cell_type();

	# NOTE: Might need a SchoolInfo_RefId - TBC Ben/Scott
	my $sth = $dbh->prepare("INSERT INTO TimeTableCell (RefId,
		TimeTable_RefId, TimeTableSubject_RefId, TeachingGroup_RefId,
		RoomInfo_RefId,CellType, PeriodId, DayId, StaffPersonal_RefId)
		Values(?,?,?,?,?,?,?,?,?)");
	$sth->execute($refid, $ttid, $ttsid, $tgid, $rmid, $celltype,
		$periodid, $dayid, $staffid);

        my $sth2 = $dbh->prepare("INSERT INTO TimeTableCell_TeacherCover(TimeTableCell_RefId, StaffPersonal_RefId,
          StaffLocalId, StartTime, FinishTime, Credit, Supervision, Weighting)
          Values(?,?,?,?,?,?,?,?)");
        my $extra = rand() > 0.9;
        $sth2->execute($refid, $staffid, $staffid,
          sprintf("%02d:05:00", $periodid+9), 
          sprintf("%02d:55:00", $periodid+9),
          $extra ? "Extra" : "",
          rand() > 0.9 ? "MinimalSupervision" : "Normal",
          $extra ? "1.2" : "1.0"
        );
	my $done = 1;
	return $done;
}

sub add_random_students_to_teaching_group($$$$) {
	my ($tgid, $schoolid, $studentnum, $yearlevel) = @_;
	my ($students_input, $studentcount) = get_students($schoolid, $studentnum * 10, $yearlevel);
	my @students = ();
	my $i;
	for($i = 0; $i < $studentnum; $i++) {
		push @students, @$students_input[int(rand($studentcount))];
	}
	add_students($tgid, \@students);
}

sub make_timetable_day {
	my ($dayid, $ttid) = @_;

	my @days = ("Monday","Tuesday","Wednesday","Thursday","Friday");
	my $daytitle ;
	$daytitle = $days[$dayid % @days];
	my $stmt = "INSERT INTO TimeTable_Day (
		TimeTable_RefId, DayId, DayTitle) Values(?,?,?)";
	my $sth0 = $dbh->prepare($stmt);
	$sth0->execute($ttid, $dayid, $daytitle);
	return $dbh->last_insert_id( undef, undef, undef, undef );
}

sub make_timetable_period {
	my ($day_id, $ttid, $dayid, $periodid,) = @_;

	my @times = ("9AM","10AM","11AM","12PM","1PM","2PM","3PM");
	my $periodtitle =
	my $sth = $dbh->prepare("INSERT INTO TimeTable_Period (TimeTable_Day_Id, TimeTable_RefId,
		DayId, PeriodId, PeriodTitle) Values(?, ?,?,?,?)");
	$sth->execute($day_id, $ttid,$dayid,$periodid,$times[$periodid % @times]);
}

sub make_timetable_subject {
	my ($school_id) = @_;

	my $refId = $sd->make_new_id();
	my $acyear = $sd->make_new_year();
	my $code = int(rand(10)) . int(rand(10)) . int(rand(10));
	my $shortname = $sd->make_short_name();

	my $longname = $sd->make_long_name($shortname);
	my $subjectid = "$shortname $code";
	my $subjecttype = $sd->make_subject_type();
	my $size = int(rand(15) + 5);
	my $sth = $dbh->prepare(q{
		INSERT INTO TimeTableSubject
			(RefId, SubjectLocalId,AcademicYear,Faculty,SubjectShortName,
			SubjectLongName,SubjectType,SchoolInfo_RefId,SchoolYear,
			ProposedMinClassSize, ProposedMaxClassSize, Semester)
		VALUES
			(?,?,?,?,?,?,?,?,?,?,?, ?)
	});
	$sth->execute(
		$refId, $subjectid, $acyear, "Faculty of $longname",
		$shortname, $longname, $subjecttype, $school_id, make_this_year(),
		$size, $size, int( rand(2) + 1)
	);

	# Also TimeTableSubject_OtherCodeList
	my ($other_code, $code_set) = $sd->create_OtherCode();
	my $sth1 = $dbh->prepare("INSERT INTO TimeTableSubject_OtherCodeList (
		TimeTableSubject_RefId, OtherCode, OtherCode_CodeSet)
		VALUES (?, ?, ?)");
	$sth1->execute($refId, $other_code, $code_set);

	return $refId;
}

sub make_this_year() {
	        my @a = localtime(time);
		return $a[5]+1900;
}

sub validate_school_id {
	my ($school) = @_;

	my $sth = $dbh->prepare("SELECT count(*) AS cnt from SchoolInfo WHERE RefId = \"$school\"");
	$sth->execute();

	my $row = $sth->fetchrow_hashref;
	return ($row->{cnt});
}

sub first_school {
	my $sth = $dbh->prepare("SELECT RefId FROM SchoolInfo ORDER BY RefId LIMIT 1");
	$sth->execute();
	my $row = $sth->fetchrow_hashref;
	return $row->{RefId} // '';
}

sub check_schools {

	my $val = 0;
	my $sth = $dbh->prepare("SELECT count(*) AS cnt from SchoolInfo");
	$sth->execute();

	my $row = $sth->fetchrow_hashref;
	return ($row->{cnt});
}

sub check_rooms {

	my $sth = $dbh->prepare("SELECT count(*) AS cnt from RoomInfo");
	$sth->execute();

	my $row = $sth->fetchrow_hashref;
	return ($row->{cnt});
}

sub get_group_stats {

	my $school_cnt = check_schools();
	my $room_cnt   = check_rooms();

	return ($school_cnt, $room_cnt);
}
