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
	$db_name, $school_id) = get_args();

if (defined $create_db) {
	$db_name = create_database($create_db);
}

print "db_name = $db_name\n" if (defined $db_name);;

my($config, $dbh) = $sd->db_connect($db_name);

if (defined $school_id) {
	my $val = validate_school_id($school_id);
	if (! $val) {
		print "$school_id is not a valid school reference/n";
		usage_exit();
	}
}

my $num_schools = create_schools($schools);

my $num_students = create_students($students);

my $num_staff = create_staff($staff);

my $num_rooms = create_rooms($rooms);

my ($num_groups) = create_groups($groups);

my $result = fix_data($fix);


#--------------------------------------------------

print "\n";
if (defined $schools) {
	print " Schools = $num_schools\n";
}

if (defined $students) {
	print " Students = $students   \n"
}


if (defined $staff) {
	print " Staff = $staff  \n"
}

if (defined $rooms) {
	print " Rooms = $num_rooms\n"
}

if (defined $groups) {
	print " Groups = $num_groups\n"
}

if ( $fix) {
	print " Data Fix = $fix - Result is $result\n";
}

#-------------------------------------------------


exit 0;


sub get_args {
	my $all   = 0;
	my $help  = 0;

	my $schools   = undef;
	my $students  = undef;
	my $staff     = undef;
	my $rooms     = undef;
	my $groups    = undef;
	my $fix       = 0;
	my $create_db = undef;
	my $db_name   = undef;
	my $school_id = undef;

	my $result = GetOptions (
		"help"    => \$help,
		"create-schools=s"            => \$schools,
		"create-students=s"           => \$students,
		"create-staff=s"              => \$staff,
		"create-rooms=s"              => \$rooms,
		"create-teaching-groups=s"    => \$groups,
		"fix"                         => \$fix,
		"create-database=s"           => \$create_db,
		"database=s"                  => \$db_name,
		"school-id=s"                 => \$school_id,
	);

	if ($help) {
		usage_exit();
	}

	if ($create_db && $db_name) {
		print "Cannot specify both --create-database and --database in one command\n";
		usage_exit();
	}
	if ($create_db && $school_id) {
		print "Cannot specify both --create-database and --school_id in the same command\n";
		usage_exit();
	}

	return ($schools, $students, $staff, $rooms, $groups, $fix, $create_db, $db_name, $school_id);
}

sub usage_exit {
	print <<'EOT';

Sample usage is:

  ./create_sif_data.pl --create-schools=16	# Create 16 schools
  ./create_sif_data.pl --create-schools=6..14	# Create random 6-14 schools

	Following commands affect all schools in the database unless a school
	RefId is specified as follows
	   --school-id=4002EF5E-22A8-11E4-B112-958031DE1888    

  ./create_sif_data.pl --create-students=8..21	# Create random 8-21 students

  ./create_sif_data.pl --create-staff=5..20	# Create random 5-20 staff

  ./create_sif_data.pl --create-rooms=3..5	# Create random 3-5 rooms

  ./create_sif_data.pl --create-teaching-groups=7..20
						# Create random 7-20 groups
  
  ./create_sif_data.pl --fix           		# Update missing data  

  ./create_sif_data.pl --create-database=name	# Create new database  

  ./create_sif_data.pl -database=name_of_db	# Use the named database


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
	my ($students) = @_;

	if (defined $students) {

		my ($done) = make_students($students);

		print "\n $done students created \n";
	}
	return ($students);
}

sub create_staff {
	my ($staff) = @_;

	if (defined $staff) {

		my ($done) = make_staff($staff);

		print "\n $done staff created \n";
	}
	return ($staff);
}

sub create_rooms {
	my ($rooms) = @_;

	if (defined $rooms) {

		my ($done) = make_rooms($rooms);

		print "\n $done rooms created \n";
	}
	return ($rooms);
}

sub create_groups {
	my ($groups) = @_;

	if (defined $groups) {

		my ($done) = make_groups($groups);

		print "\n $done groups created \n";
	}
	return ($groups);
}

sub fix_data {
	my ($fix) = @_;

	my $result = '';
	if ($fix) {
		$result = 'ok';

	}

	return ($result);
}

sub create_database {
	my ($db_name) = @_;

	die "Bad db name" if ($db_name =~ m/[\/|\.|;|\s]+/);

	my $dbh = DBI->connect("dbi:mysql:", undef, undef);
	$dbh->do("CREATE DATABASE $db_name");

	system("/usr/bin/mysql $db_name < ../schema/common/create.sql") == 0
		or die "system call to create.sql failed\n";

	system("/usr/bin/mysql $db_name < ../schema/AU1.3/example.sql") == 0
		or die "system call to example.sql failed\n";
	
	return ($db_name);
}

sub get_range {
	my ($data) = @_;
	my $number;

	my ($lower, $upper) = split(/\.\./, $data);
	if (! defined $upper) {
		$upper = $lower;
		$lower = 1;
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

		++$cnt;
	}
	return ($cnt);
}

sub make_students {
	my ($students) = @_;

	my $cnt = 0;

	# Get School Info
	my $sth = $dbh->prepare("SELECT * FROM SchoolInfo");
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
	my ($staff) = @_;

	my $cnt = 0;

	# Get School Info
	my $sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	$sth->execute();

	# Insert staff into table
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

			++$cnt;
		}
	}
	return ($cnt);
}

sub make_rooms {
	my ($rooms) = @_;

	my $cnt = 0;

	# Get School Info
	my $sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	$sth->execute();

	# Insert rooms into table
	while (my $row = $sth->fetchrow_hashref) {
		my $schoolid = $row->{RefId};

		my ($num_rooms) = get_range($rooms);

		for(my $i = 0; $i < $num_rooms; $i++){
			my $refId = $sd->make_new_id();
			my $roomNumber = int(rand(1000) + 1);
			my $description = "Just another room";
			my $capacity = int(rand(50) + 10);
			my $sth = $dbh->prepare("INSERT INTO RoomInfo (RefId,
				SchoolInfo_RefId, RoomNumber, Description, Capacity)
				Values(?,?,?,?,?)");
			$sth->execute($refId,$schoolid,$roomNumber,$description,$capacity);
			++$cnt;
		}
	}
	return ($cnt);
}

sub make_groups {
	my ($groups) = @_;

	my $cnt = 0;

	# Get School Info
	my $sth = $dbh->prepare("SELECT * FROM SchoolInfo");
	$sth->execute();

	# Insert groups into table

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
