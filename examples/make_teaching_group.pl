#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use Data::Dumper;
use YAML;
use DBI;
use Data::UUID;
use Data::RandomPerson;
use Text::CSV;

## make_teaching_group.pl a..b [school_ref_id]
## creates a new teaching group with between a and b students in all schools
## if school_ref_id is specified, only make a teaching group in specified school


sub create_room{
 my $roomnumber = int(rand(1000));
 my $room = "Room $roomnumber";
	# XXX Insert ?
}

my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

# Connect to database
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);


# Column names:
# RefId -- Generate a UUID using a perl library

# Short Name -- Select randomly from a list
my @subjects = ("MAT", "ENG", "PHYS", "BIO", "CHEM", "COMP", "VIS", "ECON", "HIST");
# Long name -- Look up short name in a dictionary, MAT => maths, ENG => English etc.
my %subject_dir = ("MAT" => "Mathematics",
		   "ENG" => "English",
		   "PHYS" => "Physics",
		   "BIO" => "Biology",
		   "CHEM" => "Chemistry",
		   "COMP" => "Computer Science",
		   "VIS" => "Visual Design",
		   "ECON" => "Economics",
		   "HIST" => "History"
		  );

;
# Local Id -- Get address from school,



# School RefID can be provided as second command line argument.
# School_Info_RefID -- Look up a school in database if argument not provided

my $sth_school;
if(defined $ARGV[1]){
  my $stmt = "SELECT RefId,LocalInfo from SchoolInfo WHERE RefId = \"$ARGV[1]\"";
  $sth_school = $dbh->prepare($stmt);
  $sth_school->execute();
  if (defined $sth_school->fetchrow_hashref){
    $sth_school = $dbh->prepare($stmt);
    $sth_school->execute();
  }
  else {
    print "Provided RefId does not exist";
    exit(1)
  }
} else {
  $sth_school = $dbh->prepare("SELECT RefId from SchoolInfo");
  $sth_school->execute();
}

# School Year -- Random Number between 1 and 12

my $sth_tg = $dbh->prepare(q{
	INSERT INTO TeachingGroup
		(RefId, ShortName, LongName, LocalId, SchoolYear, SchoolInfo_RefId)
	VALUES
		(?, ?, ?, ?, ?, ?)
});
my $sth_tg_staff = $dbh->prepare(q{
	INSERT INTO TeachingGroup_Teacher (TeachingGroup_RefId, StaffPersonal_RefId) VALUES (?, ?)
});
my $sth_tg_student = $dbh->prepare(q{
	INSERT INTO TeachingGroup_Student (TeachingGroup_RefId, StudentPersonal_RefId) VALUES (?, ?)
});

my ($lower,$upper) = split(/\.\./, $ARGV[0]);
while (my $school_row = $sth_school->fetchrow_hashref) {
	# Insert TeachingGroupInfo
	my $schoolid = $school_row->{RefId};

	print "SCHOOL = $schoolid\n";

	# ALL students
	my @students;
	my $sth_student = $dbh->prepare('SELECT RefId FROM StudentPersonal WHERE SchoolInfo_RefId = ?');
	$sth_student->execute($schoolid);
	while (my $student_row = $sth_student->fetchrow_hashref) {
		push @students, $student_row->{RefId};
	}

	# ALL Staff
	my @staff;
	my $sth_staff = $dbh->prepare('SELECT RefId FROM StaffPersonal WHERE SchoolInfo_RefId = ?');
	$sth_staff->execute($schoolid);
	while (my $staff_row = $sth_staff->fetchrow_hashref) {
		push @staff, $staff_row->{RefId};
	}

	# ShortName, LongName, LocalId, SchoolYear, SchoolInfo_RefId)
	# Values(?,?,?,?,?,?)");
	# $sth->execute($refid,$short_name,$long_name,$localid,$yearlevel,$schoolid);

	# my $num_students = int(rand($upper - $lower)) + $lower;

	# TABLES
	#	TeachingGroup
	#	TeachingGroup_Student
	#	TeachingGroup_Staff

	# TEACHING GROUPS 1..x
	my $num_groups = int(rand(20 - 3)) + 3;		# XXX Configurable
	for(my $group_num = 0; $group_num < $num_groups; $group_num++){
	
		# Subject Information
		my $uuid = Data::UUID->new();
		my $refid = $uuid->create_str;
		my $i = rand @subjects;
		my $short_name = $subjects[$i];
		my $long_name = $subject_dir{$short_name};
		my $localid = create_room();
		my $yearlevel = int(rand(12)) + 1;
		print "\tTeaching Group = $refid - $short_name, $long_name, $localid, $yearlevel\n";

		$sth_tg->execute(
			$refid, $short_name, $long_name, $localid, $yearlevel, $schoolid
		);

		my $staff = $staff[ int rand($#staff)]; 
		print "\t\tSTAFF = $staff\n";
		$sth_tg_staff->execute(
			$refid, $staff
		);

		# STUDENTS
		@students = sort { int(rand 3)-1 <=> int(rand 3)-1 } @students;

		# XXX lower should be 10 or less if less students !
		my $num_students = int(rand(30 - 10)) + 10;
		for (my $student_num = 0; $student_num < $num_students; $student_num++) {
			print "\t\tSTUDENT = " . $students[$student_num] . "\n";
			$sth_tg_student->execute(
				$refid, $students[$student_num]
			);
		}
	}
}
$dbh->commit();
