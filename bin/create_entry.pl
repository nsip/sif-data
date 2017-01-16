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

# PREPARE - Create the SIS & APP first
#	sis_vendor_edval - Database name (data created)
#	SIS ID = 'vendor_edvaĺ' (TODO)
#	APP ID = '???' (TODO)

# TEST - app_id exists
my $app;
{
	my $sth = $dbh_hits->prepare(q{
		SELECT
			*
		FROM
			app
		WHERE
			id = ?
	});
	$sth->execute($app_id);
	$app = $sth->fetchrow_hashref || die("No valid app for $app_id");
}

# TEST - app_id has a SIS
my $sis;
{
	my $sth = $dbh_hits->prepare(q{
		SELECT
			*
		FROM
			sis
		WHERE
			id = ?
	});
	$sth->execute($app->{sis_id});
	$sis = $sth->fetchrow_hashref || die("No valid SIS from $app_id " . $app->{sis_id});
}

# TEST - SIS is valid data entry
if ($sis->{sis_type} ne 'hits_database') {
	die "SIS of type hits_database only supported";
}

# DBH - Connect to the SIS Database
my $dbh_sis;
{
	my $dsn = $config->{mysql_dsn_template};
	my $db = $sis->{sis_ref};
	$dsn =~ s/TEMPLATE/$db/;
	$dbh_sis = DBI->connect(
		$dsn,
		$config->{mysql_user},
		$config->{mysql_password},
		{RaiseError => 1, AutoCommit => 1}
	);
	if (!$dbh_sis) {
		die "No valid SIS Databse from DB Name = ";
	}
}

# TEST - SIS database exists and has data (schools)

# GENERATE - Identifiers to be used
my $app_key = uuid();	# App key can be anything unique
my $password = uuid();	# Password - make it a hash of UUID or similar
my $user_token = uuid();	# UUID for User token, also equals zone.

# MAKE - sif.SIF3_APP_TEMPLATE entry - generate Token & Password
my $sif_template;
{
	my $sth = $dbh_sif->prepare(q{SELECT max(APP_TEMPLATE_ID) as max FROM SIF3_APP_TEMPLATE});
	$sth->execute();
	my $max = $sth->fetchrow_hashref;
	my $id = $max->{max} + 1;
	print "GENERATING APP TEMPLATE - $app_key, $password, $user_token = $id\n";
	$sth = $dbh_sif->prepare(q{
		INSERT INTO SIF3_APP_TEMPLATE
			(APP_TEMPLATE_ID, SOLUTION_ID, APPLICATION_KEY, PASSWORD, USER_TOKEN, AUTH_METHOD, ENV_TEMPLATE_ID)
		VALUES
			(?, 'HITS', ?, ?, ?, 'Basic', 'HITS')
	});
	$sth->execute($id, $app_key, $password, $user_token);
	$sth = $dbh_sif->prepare(q{
		SELECT * FROM SIF3_APP_TEMPLATE WHERE APPLICATION_KEY = ?
	});
	$sth->execute($app_key);
	$sif_template = $sth->fetchrow_hashref;
}

# MAKE - sif.Zone using (Token?)
my $zone;
{
	my $sth = $dbh_sif->prepare(q{
		INSERT INTO Zone
			(zoneId, databaseUrl)
		VALUES
			(?, ?)
	});
	$sth->execute($user_token, $sis->{sis_ref});	 # TODO Check sis_ref is same format
	$sth = $dbh_sif->prepare(q{SELECT * FROM Zone WHERE zoneId = ?});
	$sth->execute($user_token);
	$zone = $sth->fetchrow_hashref();
}

# MAKE - sif.Zone_School - map all schools from the SIS
{
	my $sth = $dbh_sis->prepare('SELECT RefId FROM SchoolInfo');
	$sth->execute();
	my $ins = $dbh_sif->prepare(q{
		INSERT IGNORE INTO Zone_School (zone_id, SchoolInfo_RefId) VALUES (?, ?)
	});
	while (my $ref = $sth->fetchrow_hashref) {
		$ins->execute($zone->{id}, $ref->{RefId});
	}
}

# MAKE - hits.app_login entry (copy previous ID)
{
	my $sth = $dbh_hits->prepare(q{
		INSERT INTO app_login
			(app_id, app_template_id)
		VALUES
			(?, ?)
	});
	$sth->execute($app_id, $sif_template->{APP_TEMPLATE_ID});
}

print "\n\nCREATE\n";
print " Vendor = " . $app->{vendor_id} . "\n";
print " APP ID = " . $app->{id} . "\n";
print " Database = " . $sis->{sis_ref} . "\n";
print " Solution ID = " . $sif_template->{SOLUTION_ID} . "\n";
print " APP Key = " . $sif_template->{APPLICATION_KEY} . "\n";
print " Password = " . $sif_template->{PASSWORD} . "\n";
print " User Token = " . $sif_template->{USER_TOKEN} . "\n";
print " Access to all schools in DB\n";

exit 0;


sub uuid {
	my $ug = Data::UUID->new;
	return $ug->create_str();
}
