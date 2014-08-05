#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use Data::Dumper;
use SIF::Data;

my $sd = SIF::Data->new();

my($config, $dbh) = $sd->db_connect();

# Make some schools

for (my $i = 0; $i < $ARGV[0] ; $i++){
	my $local_id = $sd->create_localid();
	my $uuid = $sd->make_new_id();
	my $school_name = $sd->create_school_name();
	my $sth = $dbh->prepare("INSERT INTO SchoolInfo (RefId, LocalId, SchoolName) Values(?,?,?)");
	$sth->execute($uuid,$local_id,$school_name)
}
