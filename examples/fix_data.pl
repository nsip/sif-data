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
use Data::Random qw/:all/;


# XXX 
#	- Add missing data to existing entries

my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

my @sex = (qw/Male Female Male Female Male Female Male Female Unknown/);	# XXX no Unkonwn - problem with RAND ?
my @salutation = (qw/Mr Mrs Dr Ms Miss/);
# my @kla = qw/English Mathematics Arts Technology Humanities Sports/;
my @kla = (
	"The Arts",
	"The Arts",
	"Humanities & Social Sciences",
	"Humanities & Social Sciences",
	"Science",
	"Science",
	"History",
	"Geography",
	"Religious Education"
);
my @yearlevel = (qw/P K K3 K4 PS UG 1 2 3 4 5 6 7 8 9 10 11 12/);
my @indigenous = (
	'Aboriginal but not Torres Strait Islander Origin',
	'Torres Strait Islander but Not Aboriginal Origin',
	'Both Torres Strait and Aboriginal Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Neither Aboriginal or Torres Strait Origin',
	'Not Stated/Unknown'
);

# 10% JunPri?, 10% Middle School 20% Secondary 50% Primary and 10% Pri/Sec?
my @campus = (
	'JunPri',
	'Middle',
	'Prim',
	'Prim',
	'Prim',
	'Prim',
	'Prim',
	'Sec',
	'Sec',
	'Pri/Sec',
);

my @full_campus = (
	'Camp',
	'Commty',
	'EarlyCh',
	'JunPri',
	'Kgarten',
	'Kind',
	'Lang',
	'MCH',
	'Middle',
	'Other',
	'PreSch',
	'Pri/Sec',
	'Prim',
	'Sec',
	'Senior',
	'Special',
	'Specif',
	'Supp',
	'Unknown',
);

my @othercodes = (qw/
	ENe-6B
	ENe-1A
	ENe-8B
	ENe-4A
	ENe-7B
	ENe-9B
	ENe-5A
	ENe-2A
	ENe-3A
	ENe-10C
	ENe-11D
	ENe-12E
	EN1-1A
	EN1-9B
	EN1-10C
	EN1-11D
	ENLS-16D
	ENLS-17E
	EN1-6B
	EN1-8B
	EN1-4A
	EN1-7B
	EN1-5A
	EN1-2A
	EN1-3A
	EN1-12E
	EN2-9B
	EN2-5A
	EN2-2A
	EN2-3A
	EN2-12E
	EN2-6B
	EN2-1A
	EN2-8B
	EN2-4A
	EN2-7B
	EN2-10C
	EN2-11D
	EN3-9E
	EN3-8D
	EN3-4A
	EN3-6B
	EN3-5B
	EN3-1A
	EN3-7C
	EN3-2A
	EN3-3A
	MAe-1WM
	MALS-25MG
	MALS-27MG
	MALS-39SP
	MA5.3-18SP
	MA5.2-1WM
	MA5.1-8MG
	MA5.1-10MG
	MA5.1-5NA
	MA5.2-5NA
	MA5.3-5NA
	MA5.2-12MG
	MA5.3-6NA
	MA5.3-15MG
	MA5.3-16MG
	MA5.3-17MG
	MA5.2-8NA
	MA5.3-8NA
	MA5.3-9NA
	MALS-2WM
	MALS-36SP
	MALS-6NA
	MA3-18SP
	MA3-1WM
	MALS-4NA
	MALS-5NA
	MALS-17NA
	MALS-18NA
	MALS-19NA
	MALS-37SP
	MA4-21SP
	MA4-13MG
	MA4-16MG
	MA4-17MG
	MA4-5NA
	MA4-6NA
	MA4-7NA
	MA4-9NA
	MALS-14NA
	MALS-23MG
	MALS-24MG
	MALS-38SP
	MALS-11NA
	MALS-12NA
	MALS-26MG
	MALS-32MG
	MALS-33MG
	MALS-15NA
	MALS-3WM
	MALS-22MG
	MALS-28MG
	MALS-29MG
	MALS-30MG
	MALS-35SP
	MALS-20MG
	MALS-31MG
	MALS-10NA
	MALS-13NA
	MA4-19SP
	MA4-20SP
	MA4-1WM
	MA4-12MG
	MA4-14MG
	MA4-15MG
	MA4-4NA
	MA4-18MG
	MA4-8NA
	MA4-10NA
	MA4-11NA
	MALS-16NA
	MALS-7NA
	MALS-8NA
	MALS-9NA
	MALS-21MG
	MALS-1WM
	MA5.1-12SP
	MA5.2-15SP
	MA5.2-16SP
	MA5.2-17SP
	MA5.3-19SP
	MA5.1-13SP
	MA5.1-1WM
	MA5.3-1WM
	MA5.1-4NA
	MA5.2-4NA
	MA5.1-9MG
	MA5.3-4NA
	MA5.1-6NA
	MA5.1-11MG
	MA5.2-11MG
	MA5.2-6NA
	MA5.2-13MG
	MA5.2-14MG
	MA5.3-13MG
	MA5.3-14MG
	MA5.1-7NA
	MA5.2-7NA
	MA5.3-7NA
	MA5.2-9NA
	MA5.2-10NA
	MA5.3-10NA
	MA5.3-11NA
	MA5.3-12NA
	MALS-34MG
	STe-1VA
	STe-2VA
	STe-3VA
	ST1-1VA
	ST1-2VA
	SCLS-2VA
	SC5-1VA
	SC5-2VA
	ST1-3VA
	ST2-1VA
	ST2-2VA
	ST2-3VA
	ST3-1VA
	ST3-2VA
	ST3-3VA
	SC4-1VA
	SC4-2VA
	SCLS-1VA
	SC4-15LW
	SC4-3VA
	SC5-3VA
	SC5-15LW
	SCLS-3VA
	ENLS-12C
	ENLS-4A
	ENLS-1A
	ENLS-6A
	ENLS-9A
	ENLS-15D
	EN5-1A
	EN5-4B
	EN5-3B
	EN5-9E
	ENLS-5A
	ENLS-2A
	EN4-4B
	EN4-5C
	EN4-6C
	ENLS-3A
	ENLS-10B
	ENLS-13C
	EN4-1A
	EN4-8D
	EN4-3B
	EN4-2A
	EN4-9E
	EN4-7D
	ENLS-14D
	ENLS-7A
	EN5-2A
	EN5-7D
	EN5-5C
	EN5-8D
	EN5-6C
	ENLS-11B
	ENLS-8A
	MAe-5NA
	MAe-10MG
	MAe-13MG
	MAe-6NA
	MAe-4NA
	MAe-17SP
	MAe-7NA
	MAe-9MG
	MAe-16MG
	MAe-12MG
	MAe-8NA
	MAe-2WM
	MAe-3WM
	MAe-15MG
	MAe-14MG
	MAe-11MG
	MA1-13MG
	MA1-7NA
	MA1-10MG
	MA1-16MG
	MA1-6NA
	MA1-8NA
	MA1-3WM
	MA1-15MG
	MA1-11MG
	MA5.2-2WM
	MA5.3-2WM
	MA5.1-3WM
	MA5.3-3WM
	MA1-5NA
	MA1-1WM
	MA1-9MG
	MA1-12MG
	MA1-18SP
	MA1-17SP
	MA1-4NA
	MA1-2WM
	MA1-14MG
	MA2-5NA
	MA2-10MG
	MA2-19SP
	MA2-17MG
	MA2-12MG
	MA2-6NA
	MA2-8NA
	MA2-4NA
	MA2-2WM
	MA2-3WM
	MA2-7NA
	MA2-14MG
	MA2-16MG
	MA2-18SP
	MA2-9MG
	MA2-1WM
	MA2-15MG
	MA2-13MG
	MA2-11MG
	MA3-13MG
	MA3-11MG
	MA3-6NA
	MA3-7NA
	MA3-4NA
	MA3-19SP
	MA3-14MG
	MA3-5NA
	MA3-16MG
	MA3-10MG
	MA3-8NA
	MA3-9MG
	MA3-17MG
	MA3-12MG
	MA3-2WM
	MA3-15MG
	MA3-3WM
	MA4-2WM
	MA4-3WM
	MA5.1-2WM
	MA5.2-3WM
	STe-10ME
	STe-5WT
	STe-4WS
	STe-8NE
	STe-6NE
	STe-7NE
	STe-9ME
	ST1-16P
	ST1-11LW
	ST1-6PW
	ST1-10LW
	ST1-4WS
	ST1-5WT
	ST1-14BE
	ST1-8ES
	ST1-7PW
	SCLS-17LW
	SCLS-24CW
	SCLS-9WS
	SCLS-19LW
	SCLS-18LW
	SCLS-8WS
	SCLS-11PW
	SC5-17CW
	SC5-8WS
	SC5-7WS
	SC5-9WS
	SC5-16CW
	SC5-4WS
	SCLS-14ES
	ST1-9ES
	ST1-15I
	ST1-12MW
	ST1-13MW
	ST2-14BE
	ST2-8ES
	ST2-7PW
	ST2-6PW
	ST2-11LW
	ST2-15I
	ST2-13MW
	ST2-16P
	ST2-12MW
	ST2-4WS
	ST2-5WT
	ST2-10LW
	ST2-9ES
	ST3-14BE
	ST3-16P
	ST3-13MW
	ST3-9ES
	ST3-6PW
	ST3-7PW
	ST3-11LW
	ST3-15I
	ST3-10LW
	ST3-4WS
	ST3-8ES
	ST3-12MW
	ST3-5WT
	SCLS-13ES
	SCLS-21LW
	SC4-9WS
	SC4-13ES
	SC4-10PW
	SC4-17CW
	SC4-4WS
	SC4-8WS
	SC4-16CW
	SC4-7WS
	SC4-5WS
	SCLS-15ES
	SCLS-4WS
	SCLS-10PW
	SCLS-5WS
	SCLS-6WS
	SC4-14LW
	SC4-12ES
	SC4-11PW
	SC4-6WS
	SCLS-23CW
	SCLS-22CW
	SCLS-20LW
	SCLS-12PW
	SC5-6WS
	SC5-13ES
	SC5-14LW
	SC5-11PW
	SC5-10PW
	SC5-5WS
	SC5-12ES
	SCLS-7WS
	SCLS-16ES
/);

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

# TODO - see alos @yearlevel
sub create_yearlevel {
	return int(rand(12)) + 1;
}

sub create_birthdate {
	my ($min, $max) = @_;
	return rand_date( min => $min, max => $max ) . '';
}

my @domains = qw/mail.edu.au/;
sub create_email {
	# Random address ?
	# Random domain ?
	# NO duplicates !

	my @part1 = qw/red green orange blue yellow purple orange banana apple mellon/;
	my @domain = qw/mail.vic.edu.au people.vic.edu.au vic.edu.au dashboard.vic.edu.au/;
	return ''
		. $part1[int rand($#part1 + 1)]
		. int(rand(999))
		. '@'
		. $domain[int rand($#domain + 1)]
}

sub update {
	my ($table, $fields, $match, $id) = @_;
	my $SQL = ''
		. qq{UPDATE $table SET }
		. join(", ", map { "$_ = ?" } sort keys %$fields)
		. " WHERE $match = ?"
	;
	print $SQL . ", " . join(", ", ( map { $fields->{$_} } sort keys %$fields) , $id) . "\n";
	my $sth = $dbh->prepare($SQL);
	$sth->execute( (map { $fields->{$_} } sort keys %$fields), $id);
}

sub insert {
	my ($table, $fields) = @_;
	my $SQL = ''
		. qq{INSERT INTO $table (}
		. join(", ", map { "$_" } sort keys %$fields)
		. ") VALUES (" . join(",", map {"?"} sort keys %$fields)
		. ")"
	;
	print $SQL . ", " . join(", ", ( map { $fields->{$_} } sort keys %$fields) ) . "\n";
	my $sth = $dbh->prepare($SQL);
	$sth->execute( (map { $fields->{$_} } sort keys %$fields));
}

sub make_new_id{
	my $uuid = Data::UUID->new();
	return $uuid->create_str;
}

my $sth;
my $sth_bit;

# ==============================================================================
# SchoolInfo
# ==============================================================================
$sth = $dbh->prepare("SELECT * FROM SchoolInfo");
$sth->execute();
while (my $row = $sth->fetchrow_hashref) {
	my $change = {};
	
	if (! $row->{CampusSchoolCampusId}) {
		$change->{CampusSchoolCampusId} = int(rand(4))+1;
	}
	if (! $row->{CampusAdminStatus}) {
		$change->{CampusAdminStatus} = rand(10) > 8 ? 'N' : 'Y';
	}
	if (! $row->{CampusCampusType}) {
		$change->{CampusCampusType} = $campus[int rand($#campus + 1)]
	}
	if (keys %$change) {
		print Dumper($change);
		update('SchoolInfo', $change, 'RefId', $row->{RefId});
	}
}


# ==============================================================================
# StaffPersonal
# ==============================================================================
$sth = $dbh->prepare("SELECT * FROM StaffPersonal");
$sth->execute();
$sth_bit = $dbh->prepare("SELECT * FROM StaffAssignment WHERE StaffPersonal_RefId = ?");
while (my $row = $sth->fetchrow_hashref) {
	my $change = {};
	if (! $row->{Sex}) {
		$change->{Sex} = $sex[int rand($#sex + 1)]; 
	}
	if (! $row->{Email}) {
		$change->{Email} = create_email();
	}
	if (! $row->{Salutation}) {
		$change->{Salutation} = $salutation[int rand($#salutation + 1)]; 
	}
	
	if (keys %$change) {
		print Dumper($change);
		update('StaffPersonal', $change, 'RefId', $row->{RefId});
	}

	$sth_bit->execute($row->{RefId});
	if (! $sth_bit->fetchrow_hashref) {
		insert('StaffAssignment', {
			RefId => make_new_id(),
			SchoolInfo_RefId => $row->{SchoolInfo_RefId},
			SchoolYear => '2014',
			StaffPersonal_RefId => $row->{RefId},
			Description => '',
			PrimaryAssignment => 'U',
		});
	}
}


# ==============================================================================
# TeachingGroup
# ==============================================================================
$sth = $dbh->prepare("SELECT * FROM TeachingGroup");
$sth->execute();
while (my $row = $sth->fetchrow_hashref) {
	my $change = {};
	if (! $row->{KLA}) {
		$change->{KLA} = $kla[int rand($#kla + 1)]; 
	}
	
	if (keys %$change) {
		print Dumper($change);
		update('TeachingGroup', $change, 'RefId', $row->{RefId});
	}
}

# ==============================================================================
# TimeTable_Period
# ==============================================================================
$sth = $dbh->prepare("SELECT * FROM TimeTable_Period");
$sth->execute();
while (my $row = $sth->fetchrow_hashref) {
	my $change = {};
	# TODO
	if (keys %$change) {
		print Dumper($change);
		update('TimeTable_Period', $change, 'RefId', $row->{RefId});
	}
}

# ==============================================================================
# RoomInfo
# ==============================================================================
$sth = $dbh->prepare("SELECT * FROM RoomInfo");
$sth->execute();
while (my $row = $sth->fetchrow_hashref) {
	my $change = {};
	if (! $row->{RoomSize}) {
		$change->{RoomSize} = int(rand(5) + 2);
	}
	if (! $row->{RoomType}) {
		my @types = ("Classroom", "Classroom", "Classroom", "Classroom", "Classroom", "Classroom", "Art", "Basketball court");
		$change->{RoomType} = $types[rand @types];
	}
	
	if (keys %$change) {
		print Dumper($change);
		update('RoomInfo', $change, 'RefId', $row->{RefId});
	}
}

# ==============================================================================
# StudentPersonal
# ==============================================================================
$sth = $dbh->prepare("SELECT * FROM StudentPersonal");
$sth->execute();
$sth_bit = $dbh->prepare("SELECT * FROM StudentSchoolEnrollment WHERE StudentPersonal_RefId = ?");
while (my $row = $sth->fetchrow_hashref) {
	my $change = {};
	if (! $row->{Sex}) {
		$change->{Sex} = $sex[int rand($#sex + 1)]; 
	}
	if (! $row->{Email}) {
		$change->{Email} = create_email();
	}
	if (! $row->{YearLevel}) {
		$change->{YearLevel} = $yearlevel[int rand($#yearlevel + 1)]; 
	}
	if (! $row->{IndigenousStatus}) {
		$change->{IndigenousStatus} = $indigenous[int rand($#indigenous + 1)]; 
	}
	if (! $row->{BirthDate}) {
		$change->{BirthDate} = create_birthdate('1994-01-01', '2009-01-01');
	}
	
	if (keys %$change) {
		print Dumper($change);
		update('StudentPersonal', $change, 'RefId', $row->{RefId});
	}

	$sth_bit->execute($row->{RefId});
	if (! $sth_bit->fetchrow_hashref) {
		insert('StudentSchoolEnrollment', {
			RefId => make_new_id(),
			StudentPersonal_RefId => $row->{RefId},
			SchoolInfo_RefId => $row->{SchoolInfo_RefId},
			MembershipType => '01',
			SchoolYear => '2014',
			TimeFrame => 'C',
			YearLevel => int(rand(12) + 1),	# XXX primary vs secondary
			FTE => '1.0',
			EntryDate => '2014-01-25',
		});
	}
}

