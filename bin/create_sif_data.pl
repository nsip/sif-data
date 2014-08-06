#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use SIF::Data;
use Getopt::Long;

# Get and process command line options
my ($limit, $schools, $students, $staff, $rooms, $groups, $fix, $create_db, $db_name) = get_args();

my ($sch_lower, $sch_upper, $num_schools) = create_schools($schools);

my ($stu_lower, $stu_upper, $num_students) = create_students($students);

my ($staff_lower, $staff_upper, $num_staff) = create_staff($staff);

my ($rooms_lower, $rooms_upper, $num_rooms) = create_rooms($rooms);

my ($groups_lower, $groups_upper, $num_groups) = create_groups($groups);

my ($result) = fix_data($fix);

my ($new_db_name) = create_database($create_db);

my ($old_db_name) = get_db_name($db_name);


#--------------------------------------------------
print "Limit = $limit \n" if (defined $limit);

if (defined $schools) {
	$sch_upper = "" if (! defined $sch_upper);
	print " Schools = $schools    lower = $sch_lower .. upper = $sch_upper  number = $num_schools\n";
}

if (defined $students) {
	print " Students = $students   lower = $stu_lower .. upper = $stu_upper  number = $num_students\n"
}


if (defined $staff) {
	print " Staff = $staff   lower = $staff_lower .. upper = $staff_upper  number = $num_staff\n"
}

if (defined $rooms) {
	print " Rooms = $rooms   lower = $rooms_lower .. upper = $rooms_upper  number = $num_rooms\n"
}

if (defined $groups) {
	print " Groups = $groups   lower = $groups_lower .. upper = $groups_upper  number = $num_groups\n"
}

if ( $fix) {
	print " Data Fix = $fix - Result is $result\n";
}

if (defined $new_db_name) {
	print " create new db - named $new_db_name\n";
}

if (defined $old_db_name) {
	print " use database -  named $old_db_name\n";
}

#-------------------------------------------------


exit 0;


sub get_args {
	my $all   = 0;
	my $help  = 0;
	my $limit = undef;

	my $schools   = undef;
	my $students  = undef;
	my $staff     = undef;
	my $rooms     = undef;
	my $groups    = undef;
	my $fix       = 0;
	my $create_db = undef;
        my $db_name   = undef;

	my $result = GetOptions (
		"limit=i" => \$limit,
		"help"    => \$help,
		"create-schools=s"            => \$schools,
		"create-students=s"           => \$students,
		"create-staff=s"              => \$staff,
		"create-rooms=s"              => \$rooms,
		"create-teaching-groups=s"    => \$groups,
		"fix"                         => \$fix,
		"create-database=s"           => \$create_db,
                "database=s"                  => \$db_name,
	);

	if ($help) {
		usage_exit();
	}

	return ($limit, $schools, $students, $staff, $rooms, $groups, $fix, $create_db, $db_name);
}

sub usage_exit {
	print <<'EOT';

Sample usage is:

  ./create_sif_data.pl		# Create/Update default database and
				# populate with dummy data

  ./create_sif_data.pl -l 5	# Limit number of rows of data generated

  ./create_sif_data.pl -create-schools=16	# Create 16 schools
  ./create_sif_data.pl -create-schools=6..14	# Create random 6-14 schools

  ./create_sif_data.pl -create-students=8..21	# Create random 8-21 students

  ./create_sif_data.pl -create-staff=5..20	# Create random 5-20 staff

  ./create_sif_data.pl -create-rooms=3..5	# Create random 3-5 rooms

  ./create_sif_data.pl -create-teaching-groups=7..20
						# Create random 7-20 groups
  
  ./create_sif_data.pl -fix              	# Update missing data  

  ./create_sif_data.pl -create-database=name	# Create new database  

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

	}

	return ($sch_lower, $sch_upper, $num_schools);
}

sub create_students {
	my ($students) = @_;

	my ($stu_lower, $stu_upper, $num_students);
	if (defined $students) {
		($stu_lower, $stu_upper) = split(/\.\./, $students);
		if (! defined $stu_upper) {
                	$stu_upper = $stu_lower;
                	$stu_lower = 1;
        	}

		$num_students = int(rand($stu_upper - $stu_lower)) + $stu_lower;

		# Process student creation for $num_students

	}

	return ($stu_lower, $stu_upper, $num_students);
}

sub create_staff {
	my ($staff) = @_;

	my ($staff_lower, $staff_upper, $num_staff);
	if (defined $staff) {
		($staff_lower, $staff_upper) = split(/\.\./, $staff);
		if (! defined $staff_upper) {
                	$staff_upper = $staff_lower;
                	$staff_lower = 1;
        	}

		$num_staff = int(rand($staff_upper - $staff_lower)) + $staff_lower;
		# Process staff creation for $num_staff

	}

	return ($staff_lower, $staff_upper, $num_staff);
}

sub create_rooms {
	my ($rooms) = @_;

	my ($rooms_lower, $rooms_upper, $num_rooms);
	if (defined $rooms) {
		($rooms_lower, $rooms_upper) = split(/\.\./, $rooms);
		if (! defined $rooms_upper) {
                	$rooms_upper = $rooms_lower;
                	$rooms_lower = 1;
        	}

		$num_rooms = int(rand($rooms_upper - $rooms_lower)) + $rooms_lower;
		# Process rooms creation for $num_rooms

	}

	return ($rooms_lower, $rooms_upper, $num_rooms);
}

sub create_groups {
	my ($groups) = @_;

	my ($groups_lower, $groups_upper, $num_groups);
	if (defined $groups) {
		($groups_lower, $groups_upper) = split(/\.\./, $groups);
		if (! defined $groups_upper) {
                	$groups_upper = $groups_lower;
                	$groups_lower = 1;
        	}

		$num_groups = int(rand($groups_upper - $groups_lower)) + $groups_lower;
		# Process groups creation for $num_groups

	}

	return ($groups_lower, $groups_upper, $num_groups);
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
	my ($create_db) = @_;

	my $name;

        $name = $create_db if (defined $create_db);

	return ($name);

}


sub get_db_name {
	my ($db_name) = @_;

	my $name;

        $name = $db_name if (defined $db_name);

	return ($name);
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
