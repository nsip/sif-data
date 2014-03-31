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

# Generate a UUID
my $uuid1 = Data::UUID->new();
my $uuid2 = Data::UUID->new();

# Make some schools

my $sth = $dbh->prepare("INSERT INTO SchoolInfo (RefId, LocalId, SchoolName) Values(?,?,?)");
$sth->bind_param_array(1,[$uuid1->create_str(), $uuid2->create_str()]);
$sth->bind_param_array(2, ['60 Oxford St', '/usr/bin/perl']);
$sth->bind_param_array(3, [ 'Trinity College', 'Perlhacker Primary']);
$sth->execute_array({ ArrayTupleStatus => \my @tuple_status } );
