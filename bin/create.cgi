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
$0 = "create.cgi - Start up";

$| = 1;

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

my $config = YAML::LoadFile("/etc/nsip/nsip_sif_data");
my $dbh_hits = DBI->connect(
	$config->{mysql_dsn_hits},
	$config->{mysql_user},
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

eval {
	die "Must provide a name as a parameter\n" if ($name eq "");
	die "Name must be a-z0-9\n" if ($name !~ /^[a-z0-9\-]+$/);

#	"INSERT INTO `database` (account_id, id, name, status, options, `when`) VALUES (?,?,?,'wip', ?, NOW())",

	my $sth = $dbh_hits->prepare("SELECT status FROM `database` WHERE id = ?");
	$sth->execute($name);
	my $d = $sth->fetchrow_hashref;
	if (!$d) {
		die "$name does not exist\n" . "SELECT status FROM `database` WHERE id = ?" . "\n";
	}
	if ($d->{status} ne 'waiting') {
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
	print STDERR "JSON - Create fork\n";
	my  $pid = fork();
	print STDERR "JSON - Create fork - PID = $pid\n";
	if ($pid) {
		$SIG{CHLD} = 'IGNORE';
		print to_json({
			success => 1,
			pid => $pid,
			message => "Started background create",
		});
		print STDERR "Exit\n";
		exit 0;
	}
	elsif ($pid == 0) {
		$0 = "create.cgi: Background process - $name";
		# Continues below
		open STDIN, "</dev/null";
		open STDOUT, ">/dev/null";
		# open STDERR, ">/dev/null";
		# Recommenct in case of fork
		$dbh_hits = DBI->connect(
			$config->{mysql_dsn_hits},
			$config->{mysql_user},
			$config->{mysql_password},
			{RaiseError => 1, AutoCommit => 1}
		);
	}
}


# XXX check name doesn't exist anywhere !
# XXX Otherwise ask for a name !

eval {
	unlink "/tmp/$$.log" if (-f "/tmp/$$.log");
	system ("echo 'Starting: $name' >> /tmp/$$.log 2>/tmp/$$.err");
	my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'wip', message = ? WHERE id = ?");
	$sth->execute("$type being started", $name);
	if ($type eq 'timetable') {
		system ("cd /var/sif/sif-data; ./bin/timetable.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	}
	elsif ($type eq 'basic') {
		system ("cd /var/sif/sif-data; ./bin/basic.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	}
	else {
		system ("cd /var/sif/sif-data; ./bin/empty.sh $name >> /tmp/$$.log 2>/tmp/$$.err");
	}

	my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'wip', message = ? WHERE id = ?");
	$sth->execute("$type being finished, starting permissions", $name);
	system ("cd /var/sif/sif-data; ./bin/create_app.pl $name >> /tmp/$$.log 2>/tmp/$$.err");
	# XXX Still required system ("cd /var/sif/sif-data; ./bin/create_entry.pl $name >> /tmp/$$.log 2>/tmp/$$.err");
	my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'wip', message = ? WHERE id = ?");
	$sth->execute("finsihed permissions", $name);
	print STDERR "Complete Build $name\n";
};
if ($@) {
	print STDERR "FAILED Build for $name = $@\n";
	if ($encode eq 'json') {
		# XXX Just update DB and exit
		open (my $IN, "/tmp/$$.log");
		my $buffer = "";
		while (<$IN>) {
			$buffer .= $_;
		}

		my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'error', message = ? WHERE id = ?");
		$sth->execute(encode_entities($@ . $buffer, "\200-\377"), $name);
		$dbh_hits->commit();
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
print STDERR "Found token = $token\n";

if ($encode eq 'json') {
	print STDERR "Updating DB for $name to complete\n";
	my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'complete', message = ?, token = ? WHERE id = ?");
	$sth->execute(encode_entities($@ . $buffer, "\200-\377"), $token, $name);
	$dbh_hits->commit();
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
