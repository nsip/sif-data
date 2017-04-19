use strict;

use Data::RandomPerson;
use Data::Random qw/:all/;
print Data::RandomPerson->new() . "\n";
#print Data::RandomPerson->new()->get() . "\n";

$| = 1;
print "starting: ";
my %names = {};
my $p = Data::RandomPerson::Names::Male->new();
for (my $i = 0; $i < 10000; $i++) {
  #print $p . "\n";
  my $x = $p->get() . "\n";
  my $y = $p->get() . "\n";
  my $z = $p->get() . "\n";

  $names{$x} = 1;
  $names{$y} = 1;
  $names{$z} = 1;

  print "." if ( ($i % 100) == 0);
}
print "\n";
print "done\n";
print scalar(keys %names) . "\n";
#my $r = Data::RandomPerson->new();
#$p[1] = Data::RandomPerson::Names::Female->new();
