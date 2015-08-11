#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use Data::Dumper;
use YAML;
use DBI;
use Data::UUID;


my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

# Connect to database
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

my $sth = $dbh->prepare("SELECT * FROM SchoolInfo");
$sth->execute();
while (my $row = $sth->fetchrow_hashref) {
print "RefId: $row->{RefId} LocalId: $row->{LocalId} SchoolName: $row->{SchoolName}\n";
}
