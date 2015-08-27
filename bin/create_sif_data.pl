#!/usr/bin/perl
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
use perl5i::2;
use SIF::Data;
use Getopt::Long;
use Data::Dumper;

my $sd = SIF::Data->new();

my ($schools, $students, $staff, $rooms, $groups, $grading, $fix, $codeset, $create_db, 
    $db_name, $ttable, $school_id, $elements, $silent) = get_args();

if (defined $create_db) {
	$db_name = $sd->create_database($create_db);
}

my ($config, $dbh, $dsn) = $sd->db_connect($db_name);
print "DSN = $dsn\n" unless ($silent);

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

	fix_data($fix);

	code_set($codeset);
}

exit 0;


sub get_args {
	my $all   = 0;
	my $help  = 0;

	my $schools   = undef;
	my $students  = undef;
	my $staff     = undef;
	my $rooms     = undef;
	my $groups    = undef;
	my $grading   = undef;
	my $fix       = undef;
	my $codeset   = undef;
	my $create_db = undef;
	my $db_name   = undef;
	my $school_id = undef;
	my $ttable    = undef;
	my $silent    = 0;

	my $result = GetOptions (
		"help"                     => \$help,
		"silent"                   => \$silent,
		"create-schools=s"         => \$schools,
		"create-students=s"        => \$students,
		"create-staff=s"           => \$staff,
		"create-rooms=s"           => \$rooms,
		"create-teaching-groups"   => \$groups,
		"create-grading"           => \$grading,
		"fix"                      => \$fix,
		"codeset"                  => \$codeset,
		"create-database=s"        => \$create_db,
		"database=s"               => \$db_name,
		"create-time-table:s"      => \$ttable,
		"school-id=s"              => \$school_id,
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

	if ($create_db && $elements && (! $schools)) {
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

	return ($schools, $students, $staff, $rooms, $groups, $grading, $fix, $codeset, $create_db, $db_name, $ttable,  $school_id, $elements, $silent);
}

sub usage_exit {
	print <<'EOT';

Sample usage is:

  ./create_sif_data.pl --create-database=name   # Create new database  

  ./create_sif_data.pl --database=name_of_db    # Use the named database

  ./create_sif_data.pl --create-schools=16      # Create 16 schools
  ./create_sif_data.pl --create-schools=6..14   # Create random 6-14 schools
  -----------------------------------------------------------------------
    Following commands affect all schools in the database unless a school
    RefId is specified as follows
       --school-id=4002EF5E-22A8-11E4-B112-958031DE1888    

  ./create_sif_data.pl --create-students=8..21  # Create random 8-21 students

  ./create_sif_data.pl --create-staff=5..20     # Create random 5-20 staff

  ./create_sif_data.pl --create-rooms=3..5      # Create random 3-5 rooms

  ./create_sif_data.pl --create-teaching-groups # Create groups for all years and students

  ./create_sif_data.pl --create-grading         # Populate grading assignment tables

  -----------------------------------------------------------------------
  ./create_sif_data.pl --create-time-table=school_id
          # Creates new Teaching Groups and Timetable in selected school
          # Requires school to have been created
  
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

sub create_grading {
	my ($grading, $school) = @_;

	if (defined $grading) {
		make_grading($grading, $school);
	}
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

		print "Calendar created for  $school\n" unless ($silent);

	return();
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

			my $BirthDate = int(rand(45)) + 1950;

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

sub get_students {
	my ($school, $number, $year)= @_;

	$number =~ s/-/\.\./;
	my ($lower, $upper) = split(/\.\./, $number);
	if (! defined $upper) {
		$upper = $lower;
		$lower = 1;
	}

	my @student_list;
	my $select = "SELECT RefId from StudentPersonal WHERE SchoolInfo_RefId = \"$school\" and YearLevel = \"$year\"";
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
		print "\n$done staff created for school $school\n" unless ($silent);
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
			my $num_tg = num_teaching_groups($row->{SchoolInfo_RefId});

			#
			# GradingAssignmentScore: 
			# Create one score per student in a teaching group and grading assignment 
			# (i.e. num_students_in_tg * 5_assignments_in_tg * num_tg)
			#

			my $students_in_tg = students_in_teaching_group($row->{RefId});
			next if (scalar @{ $students_in_tg } == 0);

			foreach my $stId ( @{ $students_in_tg } ) {

				for ( 1 .. $num_tg ) {
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
					$sth2->execute( $sd->create_grading_assignment_score($stId->[0], $row->{RefId}, $gaId));
				}
			}
		} # 1 .. 5 grading assignments
	} # TeachingGroup rows

	if ( (defined $grading) && ($num_tg_seen == 0) ) {
		die qq(\nNo teaching groups were found.\nYou may need to run this program with the "--create-teaching-groups" options first);
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
		my $schoolyear = "2014"; # make_new_year();
		my $localid = $sd->create_localid();
		my $title = "Timetable" . $refid;
		my $dayspercycle = $sd->make_days_per_cycle();
		my $periodspercycle = $sd->make_periods_per_cycle();
		my $sth = $dbh->prepare("INSERT INTO TimeTable(RefId,
			SchoolInfo_RefId, SchoolYear, LocalId, Title,
			DaysPerCycle,PeriodsPerCycle) Values (?,?,?,?,?,?,?)");
		$sth->execute($refid, $schoolid, $schoolyear, $localid, $title,
			$dayspercycle, $periodspercycle);
		for (my $i = 0; $i < $dayspercycle; $i++){
			make_timetable_day($i,$refid);
			for (my $j = 0; $j < $periodspercycle; $j++){
				make_timetable_period($refid,$i,$j);
				my $subid = make_timetable_subject($schoolid);
				my $done = make_timetable_cell($refid, $subid, $schoolid, $i, $j);
				$cells += $done;
			}
		}
		++$cnt
	}
	return ($cnt, $cells);
} 

sub make_timetable_cell {
	my ($ttid, $ttsid, $school, $dayid, $periodid) = @_;

	my $refid = $sd->make_new_id();

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

	# Get or make staff
	$select = "SELECT * FROM StaffPersonal WHERE SchoolInfo_RefId = \"$school\"";

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

	my $tgid = make_teaching_group($school, $rmid);;

	my $celltype = $sd->make_cell_type();

	# NOTE: Might need a SchoolInfo_RefId - TBC Ben/Scott
	my $sth = $dbh->prepare("INSERT INTO TimeTableCell (RefId,
		TimeTable_RefId, TimeTableSubject_RefId, TeachingGroup_RefId,
		RoomInfo_RefId,CellType, PeriodId, DayId, StaffPersonal_RefId)
		Values(?,?,?,?,?,?,?,?,?)");
	$sth->execute($refid, $ttid, $ttsid, $tgid, $rmid, $celltype,
		$periodid, $dayid, $staffid);
	my $done = 1;
	return $done;
}

sub make_timetable_day {
	my ($dayid, $ttid) = @_;

	my @days = ("Monday","Tuesday","Wednesday","Thursday","Friday");
	my $daytitle = $days[$dayid % @days];
	my $stmt = "INSERT INTO TimeTable_Day (
		TimeTable_RefId, DayId, DayTitle) Values(?,?,?)";
	my $sth0 = $dbh->prepare($stmt);
	$sth0->execute($ttid, $dayid, $daytitle);
}

sub make_timetable_period {
	my ($ttid, $dayid, $periodid,) = @_;

	my @times = ("9AM","10AM","11AM","12PM","1PM","2PM","3PM");
	my $periodtitle =
	my $sth = $dbh->prepare("INSERT INTO TimeTable_Period (TimeTable_RefId,
		DayId, PeriodId, PeriodTitle) Values(?,?,?,?)");
	$sth->execute($ttid,$dayid,$periodid,$times[$periodid % @times]);
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
		$shortname, $longname, $subjecttype, $school_id, '2014',
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
