#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use SIF::Data;
use Getopt::Long;

# Get and process command line options
my ($limit, $schools, $students) = get_args();

my ($sch_lower, $sch_upper, $num_schools) = create_schools($schools);

my ($stu_lower, $stu_upper, $num_students) = create_students($students);

#--------------------------------------------------
print "Limit = $limit \n" if (defined $limit);

if (defined $schools) {
	$sch_upper = "" if (! defined $sch_upper);
	print " Schools = $schools    lower = $sch_lower .. upper = $sch_upper  number = $num_schools\n";
}

if (defined $students) {
	print " Students = $students   lower = $stu_lower .. upper = $stu_upper  number = $num_students\n"
}


#-------------------------------------------------


exit 0;


sub get_args {
	my $all   = 0;
	my $help  = 0;
	my $limit = undef;

	my $schools  = undef;
	my $students = undef;

	my $result = GetOptions (
		"limit=i" => \$limit,
		"help"    => \$help,
		"create-schools=s"   => \$schools,
		"create-students=s"  => \$students,
	);

	if ($help) {
		usage_exit();
	}

	return ($limit, $schools, $students);
}

sub usage_exit {
	print <<'EOT';

Sample usage is:

  ./create_sif_data.pl		# Create/Update default database and
				# populate with dummy data

  ./create_sif_data.pl -l 5	# Limit number of rows of data generated

  ./create_sif_data.pl -create-schools=16	# Create 16 schools
  ./create_sif_data.pl -create-schools=6..14	# Create random 6-14 schools

  ./create_sif_data.pl -create-studentss=8..21	# Create random 8-21 students

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

	}

	# Process school creation for $num_schools

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
	}

	# Process student creation for $num_students

	return ($stu_lower, $stu_upper, $num_students);
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
