#!/usr/bin/perl
use warnings;
use strict;
use DBI;
use YAML;
use Data::UUID;

my $app_id = shift || die("Must provide an APP ID to create for");

my $config = YAML::LoadFile("/etc/nsip/nsip_sif_data");

# DATABASE
my $dbh_hits = DBI->connect(
	$config->{mysql_dsn_hits},
	$config->{mysql_user},
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);
my $dbh_sif = DBI->connect(
	$config->{mysql_dsn_sif},
	$config->{mysql_user},
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

my $sth = $dbh_hits->prepare(q{
	INSERT INTO sis
		(id, sis_type, sis_ref)
	VALUES
		(?, 'hits_database', ?)
});
$sth->execute($app_id, $app_id);

$sth = $dbh_hits->prepare(q{
	INSERT INTO app
		(id, vendor_id, name, title, sis_id)
	VALUES
		(?, ?, ?, ?, ?)
});
# NSIP Testing Vendor ID
$sth->execute($app_id, 'c0123134-5d9d-46f4-bf86-bc1b0d7c6c71', "Name $app_id", "Title $app_id", $app_id);

#$dbh_hits->commit();

print "DONE app_id = $app_id, and sis DB assumed to be $app_id\n";
