#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use SIF::Data;
use Getopt::Long;

my $sd = SIF::Data->new();

# Get and process command line options
my ($schools, $students, $staff, 
	$rooms, $groups, $fix, $create_db, 
	$db_name, $ttable, $school_id) = get_args();

# XXX need config to do this - move code to SIF::Data (maybe $sd->db_create($dbname) instead of db_connect
if (defined $create_db) {
	$db_name = create_database($create_db);
}

print "db_name = $db_name\n" if (defined $db_name);;

my($config, $dbh) = $sd->db_connect($db_name);

if (defined $school_id) {
	my $val = validate_school_id($school_id);
	if (! $val) {
		print "$school_id is not a valid school reference\n";
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

	fix_data($fix);
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
	my $fix       = undef;
	my $create_db = undef;
	my $db_name   = undef;
	my $school_id = undef;
	my $ttable    = undef;

	my $result = GetOptions (
		"help"						  => \$help,
		"create-schools=s"            => \$schools,
		"create-students=s"           => \$students,
		"create-staff=s"              => \$staff,
		"create-rooms=s"              => \$rooms,
		"create-teaching-groups=s"    => \$groups,
		"fix"                         => \$fix,
		"create-database=s"           => \$create_db,
		"database=s"                  => \$db_name,
		"create-time-table=s"		  => \$ttable,
		"school-id=s"                 => \$school_id,
	);

	if ($help) {
		usage_exit();
	}

	my $elements = 0;
	++$elements if ($students);
	++$elements if ($staff);
	++$elements if ($rooms);
	++$elements if ($groups);
#	++$elements if ($ttable);

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

	if ($ttable) {
		my $err = 0;
		++$err if ($elements);
		++$err if ($schools);
		++$err if ($create_db);
		if ($err){
			print "\ncreate-time-table must be called on an existing school as a stand-alone cammand\n         (--database is allowed)\n";
			usage_exit();
		}

		$school_id = $ttable;
	}

	return ($schools, $students, $staff, $rooms, $groups, $fix, $create_db, $db_name, $ttable,  $school_id);
}

sub usage_exit {
	print <<'EOT';

Sample usage is:

  ./create_sif_data.pl --create-database=name	# Create new database  

  ./create_sif_data.pl --database=name_of_db	# Use the named database

  ./create_sif_data.pl --create-schools=16	# Create 16 schools
  ./create_sif_data.pl --create-schools=6..14	# Create random 6-14 schools
  -----------------------------------------------------------------------
	Following commands affect all schools in the database unless a school
	RefId is specified as follows
	   --school-id=4002EF5E-22A8-11E4-B112-958031DE1888    

  ./create_sif_data.pl --create-students=8..21	# Create random 8-21 students

  ./create_sif_data.pl --create-staff=5..20	# Create random 5-20 staff

  ./create_sif_data.pl --create-rooms=3..5	# Create random 3-5 rooms

  ./create_sif_data.pl --create-teaching-groups=7..20
						# Create  with random 7-20 students 
  -----------------------------------------------------------------------
  ./create_sif_data.pl --create-time-table=school_id
          # Creates a new Teaching Group and Timetable in selected school
            Requires school to have been created
  
  ./create_sif_data.pl --fix           		# Update missing data  

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

		print "\n $done schools created \n";
	}

	return ($schools);
}

sub create_students {
	my ($students, $school) = @_;

	if (defined $students) {

		my ($done) = make_students($students, $school);

		print "\n $done students created \n";
	}
	return ($students);
}

sub create_staff {
	my ($staff, $school) = @_;

	if (defined $staff) {

		my ($done, $xxx) = make_staff($staff, $school);

		print "\n $done staff created \n";
	}
	return ($staff);
}

sub create_rooms {
	my ($rooms, $school) = @_;

	if (defined $rooms) {

		my ($done, $xxx) = make_rooms($rooms, $school);

		print "\n $done rooms created \n";
	}
	return ($rooms);
}

sub create_groups {
	my ($students, $school) = @_;

	if (defined $students) {

		my ($schools, $rooms) = make_groups($students, $school);

		print "\n $schools schools processed - $rooms groups created \n";
	}
	return ($students);
}

sub create_ttable {
	my ($ttable, $school) = @_;

	if (defined $ttable) {

		my ($done, $cells) = make_ttable($school);

		print "\n $done time table created - $cells cells \n";
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

sub create_database {
	my ($db_name) = @_;

	# XXX This code, config, connecting to DB, correct name/password
	# 	appears in the Library, maybe move this code there?

	# XXX These ones won't work due to remote server names missing etc.
	# 	Fix this using dsn template
	die "Bad db name" if ($db_name =~ m/[\/|\.|;|\s]+/);

	# CREATE DB
	my $dsn = $config->{mysql_dsn_template};
	$dsn =~ s/TEMPLATE//;
	print STDERR "DEBUG CREAT DSN $dsn\n";
	my $dbh = DBI->connect($dsn, $config->{mysql_user}, $config->{mysql_password});
	$dbh->do("CREATE DATABASE $db_name");

	# CONNECT TO DB
	$dsn = $config->{mysql_dsn_template};
	$dsn =~ s/TEMPLATE/$db_name/;
	print STDERR "DEBUG $dsn\n";
	$dbh = DBI->connect($dsn, $config->{mysql_user}, $config->{mysql_password});

	die "XXX You must now manually create the Schema...";

	# XXX Could replace these by reading file, split on ";" ?
	# 	DBD::mysql has a parameter mysql_multi_statements:
	system("/usr/bin/mysql $db_name < ../schema/common/create.sql") == 0
		or die "system call to create.sql failed\n";

	system("/usr/bin/mysql $db_name < ../schema/AU1.3/example.sql") == 0
		or die "system call to example.sql failed\n";
	
	return ($db_name);
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
		my $local_id = $sd->create_localid();
		my $uuid = $sd->make_new_id();
		my $school_name = $sd->create_school_name();
		my $sth = $dbh->prepare("INSERT INTO SchoolInfo (RefId, LocalId, SchoolName) Values(?,?,?)");
		$sth->execute($uuid,$local_id,$school_name);

		print "\nSchool RefId = $uuid";

		++$cnt;
	}
	return ($cnt);
}

sub make_students {
	my ($students, $school) = @_;

	my $cnt = 0;

	# Get School Info
	my $sth;
	if (defined $school) {
		$sth = $dbh->prepare("SELECT * from SchoolInfo WHERE RefId = \"$school\"");
	} else {
		$sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	}
	$sth->execute();

	# Insert students into table
	while (my $row = $sth->fetchrow_hashref) {
		my $schoolid = $row->{RefId};

		my ($num_students) = get_range($students);

		for(my $i = 0; $i < $num_students; $i++){
		    my $student = $sd->create_student();
		    my $local_id = $sd->create_localid();
		    my  $sth0 = $dbh->prepare("INSERT INTO StudentPersonal (RefId,
		    LocalId, FamilyName, GivenName, SchoolInfo_RefId, YearLevel)
		    Values(?,?,?,?,?,?)");
		    $sth0->execute($student->{refid}, $local_id,
		    $student->{lastname},$student->{firstname},
		    $schoolid, $student->{yearlevel});

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
			my $staff = $sd->create_student();
			my $local_id = $sd->create_localid();
			my  $sth0 = $dbh->prepare("INSERT INTO StaffPersonal (RefId,
			LocalId, FamilyName, GivenName, SchoolInfo_RefId)
			Values(?,?,?,?,?)");
			$sth0->execute($staff->{refid}, $local_id,
			$staff->{lastname},$staff->{firstname},
			$schoolid);
			$refid = $staff->{refid};
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
		
		if (! $rooms) {
			my ($rooms, $xxx) = make_rooms("5-10", $schoolid);
			print "\n$rooms rooms created for school_id $schoolid\n";
		}

#		$room_sth = $dbh->prepare($select);
		$room_sth->execute();

		while (my $room = $room_sth->fetchrow_hashref) {
			my $roomid = $room->{RefId};
			# Insert TeachinGroupInfo
			my ($refid) = make_teaching_group($schoolid, $roomid);
			++$room_cnt;

			# select students - or create them
			$groups =~ s/-/\.\./;
			my ($lower, $upper) = split(/\.\./, $groups);
			if (! defined $upper) {
		    	$upper = $lower;
		    	$lower = 1;
			}
			my (@students) = get_students($schoolid, $lower, $upper);

			@students = sort { int(rand 3)-1 <=> int(rand 3)-1 } @students;

			my $num_students = int(rand($upper - $lower)) + $lower;
        	for (my $student_num = 0; $student_num < $num_students; $student_num++) {
				if (defined $students[$student_num]) {
					my $sth_tg_student = $dbh->prepare(q{
						INSERT INTO TeachingGroup_Student 
						(TeachingGroup_RefId, StudentPersonal_RefId) 
						VALUES (?, ?)
 					});

					$sth_tg_student->execute(
						$refid, $students[$student_num]
					);
				}
			}

			# select staff - or create them
			$lower = $rooms + 2;
			$upper = $rooms * 2;

			my (@staff) = get_staff($schoolid, $lower, $upper);

			@staff = sort { int(rand 3)-1 <=> int(rand 3)-1 } @staff;

			my $num_staff = int(rand($upper - $lower)) + $lower;
			for (my $staff_num = 0; $staff_num < $num_staff; $staff_num++) {
				if (defined $staff[$staff_num]) {
					my $sth_tg_staff = $dbh->prepare(q{
						INSERT INTO TeachingGroup_Teacher
						(TeachingGroup_RefId, StaffPersonal_RefId) 
						VALUES (?, ?)
 					});

					$sth_tg_staff->execute(
						$refid, $staff[$staff_num]
					);
				}
			}
		}
		++$cnt;
	}
	return ($cnt, $room_cnt);
}

sub make_teaching_group {
	my ($schoolid, $roomid) = @_;

	# Insert TeachinGroupInfo
	my $refid = $sd->make_new_id();
	my $short_name = $sd->make_short_name();
	my $long_name = $sd->make_long_name($short_name);
	my $localid = $roomid;
	my $yearlevel = int(rand(12)) + 1;
	my $sth = $dbh->prepare("INSERT INTO TeachingGroup (RefId,
		ShortName, LongName, LocalId, SchoolYear, SchoolInfo_RefId)
		Values(?,?,?,?,?,?)");
	$sth->execute($refid, $short_name, $long_name, $localid, $yearlevel,
		$schoolid);
	return $refid;
}

sub get_students {
	my ($school, $lower, $upper)= @_;

	my @student_list;
	my $select = "SELECT RefId from StudentPersonal WHERE SchoolInfo_RefId = \"$school\"";
	my $sth;
	$sth = $dbh->prepare($select);
	$sth->execute();

	my $students = 0;
	while (my $student_row = $sth->fetchrow_hashref) {
		++$students;
	}	

	if (! $students) {
		my $min = $upper * 2;
		my $max = $upper * 10;
# for testing
# $min = 4;
# $max = 8;
		my ($done) = make_students("$min..$max", $school);
		print "\n$done students created for school $school\n";
	}

	$sth->execute();
	while (my $student_row = $sth->fetchrow_hashref) {
		push @student_list, $student_row->{RefId};	
	}
	return @student_list;
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

	if (! $staff) {
# for testing
# $min = 4;
# $max = 8;
		my ($done, $xxx) = make_staff("$min..$max", $school);
		print "\n$done staff created for school $school\n";
	}

	$sth->execute();
	while (my $staff_row = $sth->fetchrow_hashref) {
		push @staff_list, $staff_row->{RefId};	
	}
	return @staff_list;
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
				my $subid = make_timetable_subject();
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
	my $refId = $sd->make_new_id();
	my $acyear = $sd->make_new_year();
	my $code = int(rand(10)) . int(rand(10)) . int(rand(10));
	my $shortname = $sd->make_short_name();
	my $longname = $sd->make_long_name($shortname);
	my $subjectid = "$shortname $code";
	my $subjecttype = $sd->make_subject_type();
	my $sth = $dbh->prepare("INSERT INTO TimeTableSubject (RefId,
		SubjectLocalId,AcademicYear,Faculty,SubjectShortName,
		SubjectLongName,SubjectType,SchoolInfo_RefId)
		VALUES (?,?,?,?,?,?,?,?)");
	$sth->execute($refId, $subjectid, $acyear, "Faculty of $longname",
		$shortname, $longname, $subjecttype, $_[0]);
	return $refId;
}







sub validate_school_id {
	my ($school) = @_;

    my $sth = $dbh->prepare("SELECT RefId from SchoolInfo WHERE RefId = \"$school\"");
    $sth->execute();
    my $val = 0;
    while(my $row = $sth->fetchrow_hashref){
      $val++;
    }

	return ($val);
}





=notes
#perl make_schools.pl 10
##make_roominfo.pl
#perl make_staff.pl 25
#perl make_students.pl 100
#perl make_teaching_group.pl 10
#perl make_timetable.pl 10
#
#perl fix_data.pl

=head1 COMMENTS

COMMAND LINE INPUT


	 Generate NSW Time Table Example Database
	 Configuration
	 	Read the YML file as per exsiting make_schools.pl - to get DBI connection details
	 Create new Database OR point to a database (command line parameter)
	 	CREATE DATABASE X
	 	schema/common/*
	 	schema/AU1.3/*
	 Generate and Insert Schools
	 	Command line x..y schools -
			??? What if they already exist
			-create-schools=3 - create 3 MORE schools
			-create-schools=3..7 - random 3 to 7 schools
	 Generate Students
		 Command line x..y students per school
			-create-studnnts=200..400
		 Read SELECT on existing schools
		 For each school
			Check students numbers match request range
			Else create students
	 Generate Staff
		create-staff=5..20
		AS per Students
	 Generate Rooms
		create-rooms=3..5
		Generate some random rooms as per make_roominfo and fix_data
	 Generate Teaching Groups
		create-teaching-group=7..20
		Select Schools
		Select Rooms - if there are no rooms, error
		Randomly select a teacher
		Randomly select some students - theoretically command line option to say how many students in a teaching group - e.g. 10-30
	Generate Time Table
		Read teaching groups
		Assign each one to a TimeTable as per make_timetable

	Update NSW Time Table Example Database
		In theory can just run the code above

	Fix Broken Data
		Old database, where these scripts have been updated or some data in
		the Database (maybe imported manually from somewhere else) has
		missing ifnormaiton
	command line option --fix
		like fix_data.pl
		Iterate over all the known types of tables, and patch missing
		information
		. e.g. Title (Mr/Mrs) is missing from Staff member.
		. e.g. Birtday is missing
=end
