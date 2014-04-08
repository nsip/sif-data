#!/usr/bin/perl
use strict;
use warnings;
use perl5i::2;
use Data::Dumper;
use YAML;
use DBI;
use Data::UUID;
use Data::RandomPerson;
use Text::CSV;


my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

# Connect to database
my $dbh = DBI->connect(
	$config->{mysql_dsn}, 
	$config->{mysql_user}, 
	$config->{mysql_password},
	{RaiseError => 1, AutoCommit => 1}
);

# Column names:
# RefId -- Generate a UUID using a perl library
# Short Name -- Select randomly from (MAT, ENG, SCI, IT, VIS, HIST, PE)
# Long name -- Look up short name in a dictionary, MAT => maths, VIS => visual design, etc.
# Local Id -- Get address from school
# School Year -- Random Number between 1 and 12
# School_Info_RefID -- Look up a school in database
# Also Update:
#TeachingGroup_Student                        
#TeachingGroup_Student.StudentPersonal_RefId  
#TeachingGroup_Student.TeachingGroup_RefId    
#TeachingGroup_Teacher                        
#TeachingGroup_Teacher.StaffPersonal_RefId    
#TeachingGroup_Teacher.TeachingGroup_RefId    

