#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use Data::Dumper;
use YAML;
use DBI;
use Data::UUID;
use Data::RandomPerson;

# Helper functions - Put in library?

sub create_student{
# Make a student
my $uuid = Data::UUID->new();
my $r = Data::RandomPerson->new();
my $p = $r->create();
$p->{refid} = $uuid->create_str;
# TODO: Properly randomly generate local addresses
$p->{address} = $uuid->create_str;
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

# Get School Info
my $sth = $dbh->prepare("SELECT * FROM SchoolInfo");
$sth->execute();

while (my $row = $sth->fetchrow_hashref) {
  my $schoolid = $row->{RefId};
  for(my $i = 0; $i < scalar($ARGV[0]); $i++){
    my $student = create_student();
    
    my  $sth0 = $dbh->prepare("INSERT INTO StudentPersonal (RefId, LocalId, 
FamilyName, GivenName, SchoolInfo_RefId, YearLevel) Values(?,?,?,?,?,?)");
    $sth0->execute($student->{refid}, $student->{address}, 
		   $student->{firstname},$student->{lastname},
		   $schoolid, $student->{yearlevel});
  }
}




