#!/usr/bin/perl
use perl5i::2;
use Data::RandomPerson;
use Data::Dumper;

my $r = Data::RandomPerson->new();
my $p = $r->create();
say Dumper($p);

