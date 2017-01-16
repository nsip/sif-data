#!/usr/bin/env perl
use perl5i::2;
use CGI qw{ :standard };
use CGI::Carp qw{ fatalsToBrowser };
use HTML::Entities;
use DBI;
use YAML;
use JSON;

$ENV{HOME} = "/var/sif/";

param('form_field');

my $name = param('name') || shift;
my $type = param('type') || 'timetable';
my $encode = param('encode') || 'html';

if ($encode eq 'json') {
	print "Content-type: text/json\n\n";
}
else {
	print "Content-type: text/html\n\n";
	print "<html><body><h1>DB Creator</h1>";
	print "<h1>Creating/Checking = $name</h1>";
}

eval {
	die "Must provide a name as a parameter\n" if ($name eq "");
	die "Name must be a-z0-9\n" if ($name !~ /^[a-z0-9\-]+$/);
	$name =~ s/\-//g;
	my $config = YAML::LoadFile("/etc/nsip/nsip_sif_data");
	my $dbh_hits = DBI->connect(
		$config->{mysql_dsn_hits},
		$config->{mysql_user},
		$config->{mysql_password},
		{RaiseError => 1, AutoCommit => 1}
	);

#	"INSERT INTO `database` (account_id, id, name, status, options, `when`) VALUES (?,?,?,'building', ?, NOW())",


	my $sth = $dbh_hits->prepare("SELECT status FROM `database` WHERE id = ?");
	$sth->execute($name);
	my $d = $sth->fetchrow_hashref;
	if (!$d) {
		die "$name does not exist\n";
	}
	if ($d->{status} != 'building') {
		die "$name is not ready for building\n";
	}

	my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'preparing' WHERE id = ?");
	$sth->execute($name);
	# XXX app
	#$sth = $dbh_hits->prepare("SELECT * FROM app WHERE id = ?");
	#$sth->execute($name);
	#die "$name already exists as an app\n" if ($sth->fetchrow_hashref);
};
if ($@) {
	if ($encode eq 'json') {
		print to_json({
			success => 0,
			error => $@ . "",
		});
		exit 0;
	}
	else {
		die $@;
		print "</body></html>";
	}
}

# Fork now and work in background
if ($encode eq 'json') {
	my  $pid = fork();
	if ($pid) {
		print to_json({
			success => 1,
			pid => $pid,
			error => "Started background create",
		});
		exit 0;
	}
	elsif ($pid == 0) {
		# Continues below
	}
	else {
		print to_json({
			success => 0,
			error => " Unable to fork process - $!",
		});
		exit 0;
	}
}

# XXX check name doesn't exist anywhere !
# XXX Otherwise ask for a name !

eval {
	unlink "/tmp/$$.log" if (-f "/tmp/$$.log");
	if ($type eq 'timetable') {
		system ("cd /var/sif/sif-data; ./bin/timetable.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	}
	elsif ($type eq 'basic') {
		system ("cd /var/sif/sif-data; ./bin/basic.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	}
	elsif ($type eq 'empty') {
		system ("cd /var/sif/sif-data; ./bin/empty.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	}
	else {
		die "Type must be 'basic' or 'timetable' or 'empty'\n";
	}

	system ("cd /var/sif/sif-data; ./bin/create_app.pl $name >> /tmp/$$.log 2>/tmp/$$.err");
	system ("cd /var/sif/sif-data; ./bin/create_entry.pl $name >> /tmp/$$.log 2>/tmp/$$.err");
};
if ($@) {
	if ($encode eq 'json') {
		# XXX Just update DB and exit
		open (my $IN, "/tmp/$$.log");
		my $buffer = "";
		while (<$IN>) {
			$buffer .= $_;
		}

		my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'error', message = ? WHERE id = ?");
		$sth->execute(encode_entities($@ . $buffer, "\200-\377"), $name);
		exit 0;
	}
	else {
		print "<h2>ERRORS</h2>";
		print "<pre>";
		print encode_entities($@, "\200-\377");
		print "</pre>";
	}
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

if ($encode eq 'json') {
	my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'complete', message = ?, token = ? WHERE id = ?");
	$sth->execute(encode_entities($@ . $buffer, "\200-\377"), $token, $name);
	exit 0;
}
else {
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
}
