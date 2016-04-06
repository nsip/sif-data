#!/usr/bin/env perl
use perl5i::2;
use CGI qw{ :standard };
use CGI::Carp qw{ fatalsToBrowser };
use HTML::Entities;
use DBI;
use YAML;

$ENV{HOME} = "/home/scottp/";

param('form_field');
print "Content-type: text/html\n\n";
print "<html><body><h1>DB Creator</h1>";

my $name = param('name') || shift;
my $type = param('type') || 'timetable';
print "<h1>Creating/Checking = $name</h1>";

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
	die $@;
	print "</body></html>";
}

# XXX check name doesn't exist anywhere !
# XXX Otherwise ask for a name !

eval {
	unlink "/tmp/$$.log" if (-f "/tmp/$$.log");
	if ($type eq 'timetable') {
		system ("cd ~scottp/nsip/sif-data; ./bin/timetable.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	}
	elsif ($type eq 'basic') {
		system ("cd ~scottp/nsip/sif-data; ./bin/basic.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	}
	else {
		die "Type must be 'basic' or 'timetable'\n";
	}

	system ("cd ~scottp/nsip/HITS-API; ./create_app.pl $name >> /tmp/$$.log 2>/tmp/$$.err");
	system ("cd ~scottp/nsip/HITS-API; ./create_entry.pl $name >> /tmp/$$.log 2>/tmp/$$.err");
};
if ($@) {
	print "<h2>ERRORS</h2>";
	print "<pre>";
	print encode_entities($@, "\200-\377");
	print "</pre>";
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

print "<p>TYPE = $type</p>\n";

print "<h2>Created.</h2>";
print qq{<a 
	href="http://hits.dev.nsip.edu.au/devdash/index.html?token=$token"
>http://hits.dev.nsip.edu.au/devdash/index.html?token=$token
</a>};

print "<pre>LOG START\n";
print encode_entities($buffer, "\200-\377");
print "LOG END</pre>\n";

print "</body></html>\n";
