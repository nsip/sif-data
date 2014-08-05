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

sub create_address{
 	#Creates an address

	my $r = Data::RandomPerson->new();
	my $p = $r->create();
	my @roads = ("Road","Street","Court","Crescent","Drive","Avenue",
	"Boulevard","Lane","Way","Walk","Square");
	my $stnumber = int(rand(300))+1;
	my $index = rand @roads;
	my $road = $roads[$index];
	$index = rand @postcodes;
	my @postbox = $postcodes[$index];
	my $address = "$stnumber $p->{firstname} $road, $postbox[0][1], $postbox[0][2], $postbox[0][0]";
	$address;
}


sub create_school_name{
	my $r = Data::RandomPerson->new();
	my $p = $r->create();
	my @school_types = ("Academy", "Grammar", "College");
	my $school_type = $school_types[rand @school_types];
	my $school_name = "$p->{lastname} $school_type"; 
	return $school_name
}


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

# Generate a UUID
my $uuid1 = Data::UUID->new();
my $uuid2 = Data::UUID->new();

# Make some schools

for (my $i = 0; $i < $ARGV[0] ; $i++){
	my $local_id = create_localid();
	my $uuid = $sd->make_new_id();
	my $school_name = create_school_name();
	my $sth = $dbh->prepare("INSERT INTO SchoolInfo (RefId, LocalId, SchoolName) Values(?,?,?)");
	$sth->execute($uuid,$local_id,$school_name)
}
