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

## make_staff.pl a..b [school_id]
## Inserts between a and b staff members into all schools.
## if school_id is provide, only inserts staff into selected school.

## Copy of make_students.pl, adapted to put data in the StaffPersonal table.


# Helper functions - Put in library?
my @postcodes;
my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
  or die "Cannot use CSV: ".Text::CSV->error_diag ();

open my $fh, "<:encoding(utf8)", "../data/postcodes.csv" or die "../data/postcodes.csv: $!";
while ( my $row = $csv->getline( $fh ) ) {
  push @postcodes, $row;
}
$csv->eof or $csv->error_diag();
close $fh;

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

sub create_student{
# Make a student
my $uuid = Data::UUID->new();
my $r = Data::RandomPerson->new();
my $p = $r->create();
$p->{refid} = $uuid->create_str;
# TODO: Properly randomly generate local addresses
$p->{address} = create_address();
# year levels are between 1 and 12 right?
$p->{yearlevel} = int(rand(12)) + 1;
$p;
}




my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

# Connect to database
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

# Check second command line argument
if(defined $ARGV[1]){
# Check to see if school exists
  my $sth = $dbh->prepare("SELECT RefId from SchoolInfo WHERE RefId = \"$ARGV[1]\"");
  $sth->execute();
  my $i = 0;
  while(my $row = $sth->fetchrow_hashref){
    $i++;
  }
  if ($i == 0){
    print "Provided RefId does not exist";
    exit(1);
  }
  # Insert students into specified school
  my ($lower,$upper) = split(/\.\./, $ARGV[0]);
  my $num_students = int(rand($upper - $lower)) + $lower;
  for(my $i = 0; $i < $num_students; $i++){
    my $student = create_student();
    my  $sth0 = $dbh->prepare("INSERT INTO StaffPersonal (RefId, LocalId,
FamilyName, GivenName, SchoolInfo_RefId) Values(?,?,?,?,?)");
    $sth0->execute($student->{refid}, $student->{address}, 
		   $student->{lastname},$student->{firstname},
		   $ARGV[1]);
  }
exit(0);
}


# Get School Info
my $sth = $dbh->prepare("SELECT * FROM SchoolInfo");
$sth->execute();

# Insert staff into table
while (my $row = $sth->fetchrow_hashref) {
  my $schoolid = $row->{RefId};
  #Handle range specified in command line
  my ($lower,$upper) = split(/\.\./, $ARGV[0]);
  my $num_students = int(rand($upper - $lower)) + $lower;
  for(my $i = 0; $i < $num_students; $i++){
    my $student = create_student();
    
    my  $sth0 = $dbh->prepare("INSERT INTO StaffPersonal (RefId, LocalId, 
FamilyName, GivenName, SchoolInfo_RefId) Values(?,?,?,?,?)");
    $sth0->execute($student->{refid}, $student->{address}, 
		   $student->{lastname},$student->{firstname},
		   $schoolid);
  }
}
