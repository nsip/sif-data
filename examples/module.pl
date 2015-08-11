#!/usr/bin/perl
use perl5i::2;
use SIF::Data;

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


	- Generate NSW Time Table Example Database
		- Configuration
			- Read the YML file as per exsiting make_schools.pl - to get DBI
			connection details
		- Create new Database OR point to a database (command line parameter)
			- CREATE DATABASE X
			- schema/common/*
			- schema/AU1.3/*
		- Generate and Insert Schools
			- Command line x..y schools -   
					??? What if they already exist
					--create-schools=3 - create 3 MORE schools
					--create-schools=3..7 - random 3 to 7 schools
		- Generate Students
			- Command line x..y students per school
					--create-studnnts=200..400
			­ Read SELECT on existing schools
			- For each school
			  	Check students numbers match request range
				Else create students
		- Generate Staff
		  	--create-staff=5..20
			AS per Students
		- Generate Rooms
		  	--create-rooms=3..5
				Generate some random rooms as per make_roominfo and fix_data
		- Generate Teaching Groups
		  	--create-teaching-group=7..20
			- Select Schools
			- Select Rooms - if there are no rooms, error
			- Randomly select a teacher
			- Randomly select some students - theoretically command line option
			  to say how many students in a teaching group - e.g. 10-30
		- Generate Time Table
		  	- Read teaching groups
		  	- Assign each one to a TimeTable as per make_timetable

 	- Update NSW Time Table Example Database
		- In theory can just run the code above

	- Fix Broken Data
	  	- Old database, where these scripts have been updated or some data in
	  	  the Database (maybe imported manually from somewhere else) has
			missing ifnormaiton
		command line option --fix
			like fix_data.pl
			Iterate over all the known types of tables, and patch missing
			information
		. e.g. Title (Mr/Mrs) is missing from Staff member.
		. e.g. Birtday is missing


ADVANCED OPTIONS

	- Create special overlapping Students and Staff
	  	--multiple-schools-staff-percent=1

=cut


#!/usr/bin/perl

die "DEPRECATE? Might be part of timetable already !";

use strict;
use warnings;
use perl5i::2;
use Data::Dumper;
use YAML;
use DBI;
use Data::UUID;
use Data::RandomPerson;
use Text::CSV;

## make_roominfo.pl 1..3 [school_id] makes a room

my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

# Connect to database
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

my $schoolid;

sub get_school_id{
  if(defined $ARGV[1]){
    my $stmt = "SELECT RefId,LocalInfo from SchoolInfo WHERE RefId = \"$ARGV[1]\"";
    my $sth = $dbh->prepare($stmt);
    $sth->execute();
    my $i = 0;
    my $id;
    while (my $row =  $sth->fetchrow_hashref){
      $id = $row->{RefId};
      $i = 1;
    }
    if($i == 0){
      print "Provided RefId does not exist";
      exit(1)
    } else {
      $schoolid = $id;
    }
  } else {
    my $sth = $dbh->prepare("SELECT RefId from SchoolInfo");
    $sth->execute(); 
    my $row = $sth->fetchrow_hashref;
    if(defined $row){
      $schoolid = $row->{RefId};
    } else {
      print "No Schools Available";
      exit(1);
    }
  }
  return $schoolid;
}

sub make_new_id{
my $uuid = Data::UUID->new();
$uuid->create_str;
}

sub make_new_year{
my $year = int(rand(12)) + 1;
return $year;
}

sub make_days_per_cycle
{
return 10;
}

sub make_periods_per_cycle
{
return 6;
}

sub make_timetable
{

}



sub make_timetable_day
{
  my @days = ("Monday","Tuesday","Wednesday","Thursday","Friday");
  my $dayid = $_[0];
  my $daytitle = $days[$dayid % @days];
  my $ttid = $_[1];
  my $stmt = "INSERT INTO TimeTable_Day ". 
    "(TimeTable_RefId, DayId, DayTitle) Values(?,?,?)";
  my $sth0 = $dbh->prepare($stmt);
  $sth0->execute($ttid, $dayid, $daytitle);
}

sub make_timetable_period
{
  my @times = ("9AM","10AM","11AM","12PM","1PM","2PM","3PM");
  my $sth = $dbh->prepare("INSERT INTO TimeTable_Period (TimeTable_RefId,
DayId, PeriodId, PeriodTitle) Values(?,?,?,?)");
  $sth->execute($_[0],$_[1],$_[2],$times[$_[2] % @times]);
}

sub make_short_name
{
  my @subjects = ("MAT", "ENG", "PHYS", "BIO", "CHEM", "COMP", 
		  "VIS", "ECON", "HIST");
  my $short_name = $subjects[rand @subjects];
  return $short_name;
}

sub make_long_name
{
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
  return $subject_dir{$_[0]};
}

sub make_subject_type
{
  my @types = ("Core","Elective","?");
  my $i = rand @types;
  return $types[$i];
}


sub make_timetable_subject
{
  my $refId = make_new_id();
  my $acyear = make_new_year();
  my $code = int(rand(10)) . int(rand(10)) . int(rand(10));
  my $shortname = make_short_name();
  my $longname = make_long_name($shortname);
  my $subjectid = "$shortname $code";
  my $subjecttype = make_subject_type();
  my $sth = $dbh->prepare("INSERT INTO TimeTableSubject (RefId,
 SubjectLocalId,AcademicYear,Faculty,SubjectShortName,
SubjectLongName,SubjectType,SchoolInfo_RefId) VALUES (?,?,?,?,?,?,?,?)");
  $sth->execute($refId,$subjectid,$acyear,"Faculty of $longname",$shortname,$longname,$subjecttype,$_[0]);
  return $refId;
}

sub create_room{
 my $room = "Room " . int(rand(1000));
 return $room;
}


sub make_teaching_group{
  # Insert TeachinGroupInfo
  my $refid = make_new_id();
  my $short_name = make_short_name();
  my $long_name = make_long_name($short_name);
  my $localid = create_room();
  my $yearlevel = int(rand(12)) + 1;
  my $sth = $dbh->prepare("INSERT INTO TeachingGroup (RefId,
ShortName, LongName, LocalId, SchoolYear, SchoolInfo_RefId)
Values(?,?,?,?,?,?)");
  $sth->execute($refid,$short_name,$long_name,$localid,$yearlevel,$schoolid);
}

sub make_room{
  my $refId = make_new_id();
  my $roomNumber = rand(1000) + 1;
  my $description = "Just another room";
  my $capacity = rand(50) + 10;
  my $sth = $dbh->prepare("INSERT INTO RoomInfo (RefId,
SchoolInfo_RefId, RoomNumber, Description, Capacity)
Values(?,?,?,?,?)");
  $sth->execute($refId,$schoolid,$roomNumber,$description,$capacity);
  return $refId;
}

sub make_cell_type{
  my @celltypes = ("Teaching","Lunch");
}

sub make_new_staff{
  my $staff = create_student();
  my $sth0 = $dbh->prepare("INSERT INTO StaffPersonal (RefId, LocalId,
FamilyName, GivenName, SchoolInfo_RefId) Values(?,?,?,?,?)");
  $sth0->execute($staff->{refid}, $staff->{address}, 
		 $staff->{lastname},$staff->{firstname},
		 $schoolid);
  return $staff->{refid};
}


sub make_timetable_cell{
# RefId
  my $refId = make_new_id();
  my $ttId = $_[0];
  my $ttsId = $_[1];
  my $tgId = make_teaching_group();;
  my $rmId = make_room();
  my $celltype = make_cell_type();
  my $periodid = $_[3];
  my $dayid = $_[2];
  my $staffid = make_new_staff();
  my $sth = $dbh->prepare("INSERT INTO TimeTableCell (RefId,
TimeTable_RefId, TimeTableSubject_RefId, TeachingGroup_RefId, 
RoomInfo_RefId,CellType, PeriodId, DayId, StaffPersonal_RefId)
Values(?,?,?,?,?,?,?,?,?)");
  $sth->execute($refId,$ttId,$ttsId,$tgId,$rmId,$celltype,
		$periodid,$dayid,$staffid);
  return $refId;
}




