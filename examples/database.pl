#!/usr/bin/perl
use perl5i::2;
# use Net::Google::Spreadsheets;
use Data::Dumper;
use YAML;
use DBI;

my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

# Example using mysqlPP (Pure Perl mysql driver)
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

my $sth = $dbh->prepare('SHOW TABLES');
$sth->execute();
foreach my $ref ($sth->fetchrow_hashref) {
	say Dumper($ref);
}
