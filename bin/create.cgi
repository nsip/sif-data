#!/usr/bin/perl
use perl5i::2;

my $name = shift;

# XXX check name doesn't exist anywhere !

system ("cd ~ubuntu/nsip/sif-data; ./bin/timetable.sh $name");
system ("cd ~ubuntu/nsip/HITS-API; ./create_app.pl $name");
system ("cd ~ubuntu/nsip/HITS-API; ./create_entry.pl $name");
