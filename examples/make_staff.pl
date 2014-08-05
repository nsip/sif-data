#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use Data::Dumper;
use SIF::Data;

## make_staff.pl a..b [school_id]
## Inserts between a and b staff members into all schools.
## if school_id is provide, only inserts staff into selected school.

## Copy of make_students.pl, adapted to put data in the StaffPersonal table.

my $sd = SIF::Data->new();

my ($config, $dbh) = $sd->db_connect();


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
        if (! defined $upper) {
		$upper = $lower;
		$lower = 1;
	}
	my $num_students = int(rand($upper - $lower)) + $lower;
	for(my $i = 0; $i < $num_students; $i++){
		my $student = $sd->create_student();
		my $local_id = $sd->create_localid();
		my  $sth0 = $dbh->prepare("INSERT INTO StaffPersonal (RefId, 
		LocalId, FamilyName, GivenName, SchoolInfo_RefId) 
		Values(?,?,?,?,?)");
		$sth0->execute($student->{refid}, $local_id, 
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
        if (! defined $upper) {
		$upper = $lower;
		$lower = 1;
	}
	my $num_students = int(rand($upper - $lower)) + $lower;
	for(my $i = 0; $i < $num_students; $i++){
		my $student = $sd->create_student();
		my $local_id = $sd->create_localid();
		
		my  $sth0 = $dbh->prepare("INSERT INTO StaffPersonal (RefId, 
		LocalId, FamilyName, GivenName, SchoolInfo_RefId) 
		Values(?,?,?,?,?)");
	  $sth0->execute($student->{refid}, $local_id, 
		 $student->{lastname},$student->{firstname},
		 $schoolid);
	}
}
