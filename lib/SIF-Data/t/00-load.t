#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'SIF::Data' ) || print "Bail out!\n";
}

diag( "Testing SIF::Data $SIF::Data::VERSION, Perl $], $^X" );
