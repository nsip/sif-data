#!/usr/bin/env perl
use perl5i::2;
use CGI qw{ :standard };
use CGI::Carp qw{ fatalsToBrowser };
use HTML::Entities;
use DBI;
use YAML;
use JSON;
use Cwd;


$ENV{HOME} = "/var/sif/";
my $root = "/var/sif/sif-data";
use lib "/var/sif/sif-data/lib";
use lib "/home/ubuntu/perl5/lib/perl5";

if (! -d "/tmp/sifdata") {
    mkdir "/tmp/sifdata";
}
system ("echo 'Begin' >> /tmp/sifdata/$$.log 2>/tmp/sifdata/$$.err");

param('form_field');
$0 = "create.cgi - Start up";

$| = 1;

my $name = param('name') || shift;
my $encode = param('encode') || 'html';
my $type = param('type') || 'empty';
system ("echo 'Name=$name, Type=$type' >> /tmp/sifdata/$$.log 2>/tmp/sifdata/$$.err");

if ($encode eq 'json') {
	print "Content-type: text/json\n\n";
}
else {
	print "Content-type: text/html\n\n";
	print "<html><body><h1>DB Creator</h1>";
	print "<h1>Creating/Checking = $name</h1>";
}

my $config = YAML::LoadFile($ENV{NSIP_SIF_DATA}||"/etc/nsip/nsip_sif_data");
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

my $options = "";
my $optiondata = {};

eval {
	die "Must provide a name as a parameter\n" if ($name eq "");
	die "Name must be a-z0-9\n" if ($name !~ /^[a-z0-9\-]+$/);

#	"INSERT INTO `database` (account_id, id, name, status, options, `when`) VALUES (?,?,?,'wip', ?, NOW())",

	my $sth = $dbh_hits->prepare("SELECT status, options, optiondata FROM `database` WHERE id = ?");
	$sth->execute($name);
	my $d = $sth->fetchrow_hashref;
	if (!$d) {
		die "$name does not exist\n" . "SELECT status FROM `database` WHERE id = ?" . "\n";
	}
	if ($d->{status} ne 'waiting') {
		die "$name is not ready for building\n";
	}

	$sth = $dbh_hits->prepare("UPDATE `database` SET status = 'preparing' WHERE id = ?");
	$sth->execute($name);
	# XXX app
	#$sth = $dbh_hits->prepare("SELECT * FROM app WHERE id = ?");
	#$sth->execute($name);
	#die "$name already exists as an app\n" if ($sth->fetchrow_hashref);

	# Keep otpions and optiondata - decoded for use below
	$options = $d->{options};
	if ($d->{optiondata}) {
		$optiondata = from_json($d->{optiondata});
	}
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
		$dbh_sif = DBI->connect(
			$config->{mysql_dsn_sif},
			$config->{mysql_user},
			$config->{mysql_password},
			{RaiseError => 1, AutoCommit => 1}
		);
	}
}


# XXX check name doesn't exist anywhere !
# XXX Otherwise ask for a name !

eval {
	# unlink "/tmp/sifdata/$$.log" if (-f "/tmp/sifdata/$$.log");
	system ("echo 'Starting: $name' >> /tmp/sifdata/$$.log 2>/tmp/sifdata/$$.err");
	my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'wip', message = ? WHERE id = ?");
	$sth->execute("started", $name);

	# TODO export PERL5LIB=lib

	my $schools = $optiondata->{schools} || 0;
	my $students = ($optiondata->{students}[0] || 0). ".." . ($optiondata->{students}[1] || 0);
	my $teachers = ($optiondata->{teachers}[0] || 0) . ".." . ($optiondata->{teachers}[1] || 0);
	my $rooms = ($optiondata->{classrooms}[0] || 0) . ".." . ($optiondata->{classrooms}[1] || 0);
	my $scheduledactivities = ($optiondata->{scheduledactivities}[0] || 0) . ".." . ($optiondata->{scheduledactivities}[1] || 0);

    my $teachinggroups = "";
	if ($optiondata->{teachinggroups}) {
        $teachinggroups = "--create-teaching-groups ";
    }

	# XXX Check all the values above so I can throw sensible errors !

    chdir $root;
    print STDERR "ROOT=$root, CWD=" .  getcwd . "\n";

	# XXX Rather than redirect to file - just capture here !
	system ("echo 'CREATE DB $name' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
	# system ("echo 'perl bin/create_sif_data.pl --create-database=$name' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
	system ("perl bin/create_sif_data.pl --create-database=sif$name >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");

    # Static Data Create
    if ($type eq "ag_collection") {
        system ("echo 'CREATE ag_collection' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
        system (
            "perl bin/create_sif_data.pl "
            . "--database=sif$name "
            . "--create-static=ag_collection "
            . ">> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err"
        );
    }

    # Standard Create
    else {
        system ("echo 'CREATE SCHOOLS, STUDENTS, STAFF, ROOMS' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
        system (
            "perl bin/create_sif_data.pl "
            . "--database=sif$name "
            . "--create-schools=$schools "
            . "--create-students=$students "
            . "--create-staff=$teachers "
            . "--create-rooms=$rooms "
            . "--create-scheduled-activities=$scheduledactivities "
            . $teachinggroups
            . ">> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err"
        );

        if ($optiondata->{timetable}) {
            #perl $root/bin/create_sif_data.pl --database="$1" --create-time-table=first
            system ("echo 'CREATE TIMETABLE' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
            system (
                "perl bin/create_sif_data.pl "
                . "--database=sif$name "
                . "--create-time-table=first "
                . ">> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err"
            );
        }

        if ($optiondata->{grading}) {
            #perl $root/bin/create_sif_data.pl --database="$1" --create-grading
            system ("echo 'CREATE GRADING' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
            system (
                "perl bin/create_sif_data.pl "
                . "--database=sif$name "
                . "--create-grading "
                . ">> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err"
            );
        }

        if ($optiondata->{contacts}) {
            #perl $root/bin/create_sif_data.pl --database="$1" --create-student-contacts
            system ("echo 'CREATE STUDENT CONTACTS' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
            system (
                "perl bin/create_sif_data.pl "
                . "--database=sif$name "
                . "--create-student-contacts "
                . ">> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err"
            );
        }

        if ($optiondata->{accounts}) {
            #perl $root/bin/create_sif_data.pl --database="$1" --create-accounts=8..16 --create-vendors=8..16 --create-debtors=8..16
            system ("echo 'CREATE ACCOUNTS' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
            system (
                "perl bin/create_sif_data.pl "
                . "--database=sif$name "
                . "--create-student-contacts "
                . "--create-accounts=8..16 "
                . "--create-vendors=8..16 "
                . "--create-debtors=8..16 "
                . ">> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err"
            );
        }

        if ($optiondata->{naplan}) {
            # TODO nothing to do here yet? NAPLAN is extenal XML input?
        }

        if ($optiondata->{hmac}) {
            # XXX Not done yet
        }
    }

	system ("echo 'Update status = wip - starting permissions' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
	$sth = $dbh_hits->prepare("UPDATE `database` SET status = 'wip', message = ? WHERE id = ?");
	$sth->execute("finished, starting permissions", $name);

	# Create SIF Authentication Entry
    my $auth_method = 'Basic';
    if ($optiondata->{hmac}) {
        $auth_method = "SIF_HMACSHA256";
    }
	system ("echo 'Inserting SIF3_APP_TEMPLATE' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
	$sth = $dbh_sif->prepare("INSERT INTO SIF3_APP_TEMPLATE (SOLUTION_ID, APPLICATION_KEY, PASSWORD, USER_TOKEN, AUTH_METHOD, ENV_TEMPLATE_ID, INFRA_VERSION) VALUES ('HITS', ?, ?, ?, ?, 'HITS', '3.2.1')");
	$sth->execute($name, $name, $name, $auth_method);

	system ("echo 'Inserting APPKEY_DB_URL_MAPPER' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
	$sth = $dbh_sif->prepare("INSERT INTO APPKEY_DB_URL_MAPPER (applicationKey, databaseUrl) VALUES (?, ?)");
	$sth->execute($name, "sif$name");
	$dbh_sif->commit();


	system ("echo 'Update status = wip - finished permissions' >> /tmp/sifdata/$$.log 2>>/tmp/sifdata/$$.err");
	$sth = $dbh_hits->prepare("UPDATE `database` SET status = 'wip', message = ? WHERE id = ?");
	$sth->execute("finsihed permissions", $name);
	print STDERR "Complete Build $name\n";
};
if ($@) {
	print STDERR "FAILED Build for $name = $@\n";
	if ($encode eq 'json') {
		# XXX Just update DB and exit
		open (my $IN, "/tmp/sifdata/$$.log");
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
		exit 0;
	}
}

open (my $IN, "/tmp/sifdata/$$.log");
my $buffer = "";
while (<$IN>) {
	$buffer .= $_;
}
my $token = $name;
print STDERR "Found token = $token\n";

my $sth = $dbh_hits->prepare("UPDATE `database` SET status = 'complete', message = ?, token = ? WHERE id = ?");
$sth->execute(encode_entities($@ . $buffer, "\200-\377"), $token, $name);
$dbh_hits->commit();

if ($encode eq 'json') {
	print STDERR "Updating DB for $name to complete\n";
	exit 0;
}
else {
	print "<h2>Created.</h2>";
	print qq{<a
		href="http://hits.dev.nsip.edu.au/devdash/index.html?token=$token"
	>http://hits.dev.nsip.edu.au/devdash/index.html?token=$token
	</a>};

	print "<pre>LOG START\n";
	print encode_entities($buffer, "\200-\377");
	print "LOG END</pre>\n";

	print "</body></html>\n";
	exit 0;
}
