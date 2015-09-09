#!perl -T
use v5.10;
use strict;
use warnings FATAL => 'all';
use Test::More;
use lib './lib';

plan tests => 4;

BEGIN {
    use_ok( 'SIF::Data' ) || print "Bail out!\n";
}

diag( "Testing SIF::Data $SIF::Data::VERSION, Perl $], $^X" );

can_ok('SIF::Data', qw/create_phone_number/);

my $sd = SIF::Data->new();

# Generate a number with no area code

my $phone_number = $sd->create_phone_number();
like ($phone_number, qr/^\d+ \d+/, "Test that $phone_number looks like a phone number");

# Generate a number with an area code

$phone_number = $sd->create_phone_number(1);
like ($phone_number, qr/^0[23478] \d+ \d+/, "Test that $phone_number looks like an area code phone number");
