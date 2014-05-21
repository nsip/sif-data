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

# XXX 
#	- Add missing data to existing entries

my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

my @sex = (qw/Male Female Unknown/);	# XXX no Unkonwn - problem with RAND ?

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

sub create_address {
	my $r = Data::RandomPerson->new();
	my $p = $r->create();
	my @roads = ("Road","Street","Court","Crescent","Drive","Avenue","Boulevard", "Lane","Way","Walk","Square");
	my $stnumber = int(rand(300))+1;
	my $index = rand @roads;
	my $road = $roads[$index];
	$index = rand @postcodes;
	my @postbox = $postcodes[$index];
	my $address = "$stnumber $p->{firstname} $road, $postbox[0][1], $postbox[0][2], $postbox[0][0]";
	return $address;
}

sub create_yearlevel {
	return int(rand(12)) + 1;
}

my @domains = qw/mail.edu.au/;
sub create_email {
	# Random address ?
	# Random domain ?
	# NO duplicates !
}

sub update {
	my ($table, $fields, $match, $id) = @_;
	my $SQL = ''
		. qq{UPDATE $table SET }
		. join(", ", map { "$_ = ?" } sort keys %$fields)
		. " $match = ?"
	;
	print $SQL . ", " . join(", ", ( map { $fields->{$_} } sort keys %$fields) , $id) . "\n";
	# $sth->prepare($SQL);
	#$sth->execute( (map { $fields->{$_} } sort keys %$fields), $id);
}

# ==============================================================================
# SchoolInfo
# ==============================================================================
my $sth = $dbh->prepare("SELECT * FROM SchoolInfo");
$sth->execute();
while (my $row = $sth->fetchrow_hashref) {
	my $change = {};
	if (! $row->{Sex}) {
		$change->{Sex} = $sex[int rand($#sex)]; 
	}
	
	if (keys %$change) {
		print Dumper($change);
		update('StudentPersonal', $change, 'RefId', $row->{RefId});
	}
}

