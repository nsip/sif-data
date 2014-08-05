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
use SIF::Data;

my @postcodes;
my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute
  or die "Cannot use CSV: ".Text::CSV->error_diag ();

open my $fh, "<:encoding(utf8)", "../data/postcodes.csv" or die "../data/postcodes.csv: $!";
while ( my $row = $csv->getline( $fh ) ) {
	push @postcodes, $row;
}
$csv->eof or $csv->error_diag();
close $fh;

my $sd = SIF::Data->new();

sub create_localid {
	return (int(rand(99999)) + 1000);
}

my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

# Connect to database
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

# Make some schools

for (my $i = 0; $i < $ARGV[0] ; $i++){
	my $local_id = create_localid();
	my $uuid = $sd->make_new_id();
	my $school_name = $sd->create_school_name();
	my $sth = $dbh->prepare("INSERT INTO SchoolInfo (RefId, LocalId, SchoolName) Values(?,?,?)");
	$sth->execute($uuid,$local_id,$school_name)
}
