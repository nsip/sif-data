#!/usr/bin/env perl
use perl5i::2;
use CGI qw{ :standard };
use CGI::Carp qw{ fatalsToBrowser };
use HTML::Entities;
use DBI;
use YAML;
use JSON;

$ENV{HOME} = "/home/scottp/";

param('form_field');

my $name = param('name') || shift;

print "Content-type: text/json\n\n";

eval {
	die "Must provide a name as a parameter\n" if ($name eq "");
	die "Name must be a-z0-9\n" if ($name !~ /^[a-z0-9]+$/);
	my $config = YAML::LoadFile("../../../.nsip_sif_data");
	my $dbh_hits = DBI->connect(
		$config->{mysql_dsn_hits}, 
		$config->{mysql_user}, 
		$config->{mysql_password},
		{RaiseError => 1, AutoCommit => 1}
	);
	my $sth = $dbh_hits->prepare("SELECT * FROM sis WHERE id = ? OR sis_ref = ?");
	$sth->execute($name, $name);
	die "$name already exists as a sis\n" if ($sth->fetchrow_hashref);
	
	$sth = $dbh_hits->prepare("SELECT * FROM app WHERE id = ?");
	$sth->execute($name);
	die "$name already exists as an app\n" if ($sth->fetchrow_hashref);
};
if ($@) {
	print to_json({
		success => 0,
		error => $@ . "",
	});
	exit 0;
}

# XXX check name doesn't exist anywhere !
# XXX Otherwise ask for a name !

eval {
	unlink "/tmp/$$.log" if (-f "/tmp/$$.log");
	system ("cd ~scottp/nsip/sif-data; ./bin/empty.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	system ("cd ~scottp/nsip/HITS-API; ./create_app.pl $name >> /tmp/$$.log 2>/tmp/$$.err");
	system ("cd ~scottp/nsip/HITS-API; ./create_entry.pl $name >> /tmp/$$.log 2>/tmp/$$.err");
};
if ($@) {
	open (my $IN, "/tmp/$$.log");
	my $buffer = "";
	while (<$IN>) {
		$buffer .= $_;
	}

	print to_json({
		success => 0,
		error => encode_entities($@, "\200-\377") . "\n" . $buffer,
	});
	exit 0;
}

open (my $IN, "/tmp/$$.log");
my $buffer = "";
my $token;
while (<$IN>) {
	$buffer .= $_;
	if (/User Token = (.+)$/) {
		$token = $1;
	}
}

print to_json({
	success => 1,
	error => "",
	data => encode_entities($buffer, "\200-\377"),
	token => $token,
	href => "http://hits.dev.nsip.edu.au/devdash/index.html?token=$token",
});
