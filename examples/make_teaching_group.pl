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


sub create_student{
# Make a student
my $uuid = Data::UUID->new();
my $r = Data::RandomPerson->new();
my $p = $r->create();
$p->{refid} = $uuid->create_str;
$p->{address} = create_address();
# year levels are between 1 and 12 right?
$p->{yearlevel} = int(rand(12)) + 1;
$p;
}




sub create_address{
  my $r = Data::RandomPerson->new();
  my $p = $r->create();
  my @roads = ("Road","Street","Court","Crescent","Drive","Avenue","Boulevard",
"Lane","Way","Walk","Square");
  my $stnumber = int(rand(300))+1;
  my $index = rand @roads;
  my $road = $roads[$index];
  $index = rand @postcodes;
  my @postbox = $postcodes[$index];
  my $address = "$stnumber $p->{firstname} $road, $postbox[0][1], $postbox[0][2], $postbox[0][0]";
  $address;
}

sub create_room{
 $roomnumber = int(rand(1000));
 my $room = "Room $roomnumber";

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
my $subjects = ("MAT", "ENG", "PHYS", "BIO", "CHEM", "COMP", "VIS", "ECON", "HIST");
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

if(defined $ARGV[1]){
  my $stmt = "SELECT RefId,LocalInfo from SchoolInfo WHERE RefId = \"$ARGV[1]\""
  my $sth = $dbh->prepare($stmt);
  $sth->execute();
  if (defined $sth->fetchrow_hashref){
    $sth = $dbh->prepare($stmt);
    $sth->execute();
  }
  else {
    print "Provided RefId does not exist";
    exit(1)
  }
} else {
  my $sth = $dbh->prepare("SELECT RefId,LocalInfo from SchoolInfo");
  $sth->execute();
}

# School Year -- Random Number between 1 and 12

while (my $row = $sth->fetchrow_hashref) {
  # Insert TeachinGroupInfo
  my $schoolid = $row->{RefId};
  my $uuid = Data::UUID->new();
  my $refid = $uuid->create_str;
  my $i = rand @subjects;
  my $short_name = $subjects[$i];
  my $long_name = $subject_dir{$short_name};
  my $localid = create_room();
  my $yearlevel = int(rand(12)) + 1;
  
  my $sth = $dbh->prepare("INSERT INTO StudentPersonal (RefId,
ShortName, LongName, LocalId, SchoolYear, SchoolInfo_RefId)
Values(?,?,?,?,?,?)");
  $sth->execute($refid,$short_name,$long_name,$localid,$yearlevel,$schoolid);

  # Start inserting students and staff

  #Handle range specified in command line
  my ($lower,$upper) = split(/\.\./, $ARGV[0]);
  my $num_students = int(rand($upper - $lower)) + $lower;
  # Add students to teaching group
  for(my $i = 0; $i < $num_students; $i++){
    my $student = create_student();
    my $sth0 = $dbh->prepare("INSERT INTO StudentPersonal (RefId, LocalId, 
FamilyName, GivenName, SchoolInfo_RefId, YearLevel) Values(?,?,?,?,?,?)");
    $sth0->execute($student->{refid}, $student->{address}, 
		   $student->{firstname},$student->{lastname},
		   $schoolid, $yearlevel);
    my $sth1 = $dbh->prepare("INSERT INTO TeachingGroup_Student (
TeachingGroup_RefId, StudentPersonal_RefId) Values(?,?)");
    $sth1->execute($refid,$student->{refid});
  };
  # Add staff to teaching group
  my $staff = create_student();
  my $sth0 = $dbh->prepare("INSERT INTO StaffPersonal (RefId, LocalId, 
FamilyName, GivenName, SchoolInfo_RefId) Values(?,?,?,?,?)");
  $sth0->execute($staff->{refid}, $staff->{address}, 
		 $staff->{firstname},$staff->{lastname},
		 $schoolid);
  my $sth1 = $dbh->prepare("INSERT INTO TeachingGroup_Teacher (
TeachingGroup_RefId, StaffPersonal_RefId) Values(?,?)");
  $sth1->execute($refid,$staff->{refid});
}
