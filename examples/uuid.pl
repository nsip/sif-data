#!/usr/bin/perl
use perl5i::2;
use Data::UUID;

my $uuid = Data::UUID->new();
say $uuid->create_str();
