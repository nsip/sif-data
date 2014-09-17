package SIF::Data;

use 5.006;
use strict;
use warnings FATAL => 'all';
use Text::CSV;
use Data::UUID;
use Data::RandomPerson;
use Data::Random qw/:all/;
use YAML;
use DBI;

=head1 NAME

SIF::Data - Create school info (Students, Staff, Schools, Timetables, etc)

=head1 VERSION

Version 1.03

=cut

our $VERSION = '1.03';


=head1 SYNOPSIS

Create National Schools Interoperability Program schema data (Students, Staff, Schools, Timetables, etc)

    use SIF::Data;

    my $sd = SIF::Data->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 new

=cut

sub new {
	my ($class, %opts) = @_;
 
	my $self = bless {}, ref($class) || $class;
 
#	$self->{template_path} = $opts{template_path} // $INCLUDE_PATH;
 
	return $self;
}

=head2 Connect to database 

=cut

sub db_connect {
	my ($self, $db_name) = @_;

	my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

	if (! defined $db_name) {
		$db_name = $config->{mysql_database};
	}

	my $dsn = $config->{mysql_driver} . ':';
	$dsn .= 'database=' . $db_name;
	$dsn .= ';host='    . $config->{mysql_host} if (defined $config->{mysql_host});
	$dsn .= ';port='    . $config->{mysql_port} if (defined $config->{mysql_port});

	my $dbh = DBI->connect(
		$dsn,
		$config->{mysql_user},
		$config->{mysql_password},
		{RaiseError => 1, AutoCommit => 1}
	);

	$self->{config} = $config;

	return ($config, $dbh, $dsn);
}

=head2 Create a new Database

=cut

sub create_database {
	my ($self, $db_name) = @_;

	die "Bad db name" if ($db_name =~ m/[\/|\.|;|\s]+/);

	my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

	my $dsn = $config->{mysql_driver} . ':';
	$dsn .= ';host='    . $config->{mysql_host} if (defined $config->{mysql_host});
	$dsn .= ';port='    . $config->{mysql_port} if (defined $config->{mysql_port});

	my $dbh = DBI->connect(
		$dsn, 
		$config->{mysql_user}, 
		$config->{mysql_password},
	 	{RaiseError => 1}
	);
	$dbh->do("CREATE DATABASE $db_name");
	$dbh->do("USE $db_name");

	my $schema_dir = './schema/AU1.3';
	$schema_dir = "$config->{schema_dir}"  if (defined $config->{schema_dir});

	# TODO - be good to get line numbers if one of these fail
	my $raw;
	open (my $SQL, "$schema_dir/example.sql") or die "Can't open file $schema_dir/example.sql $!";
	while (<$SQL>) {
		$raw .= $_;
	}
	close $SQL;
	
	foreach my $row (split(/;/, $raw)) {
		$row =~ s/^\s+//gs;	 $row =~ s/\s+$//gs;
		next if (!$row);
		eval {
			$dbh->do($row);
		};
		if ($@) {
			die "$@ with $row";
		}
	}
	$dbh->disconnect;

	$self->{config} = $config;

	return ($db_name);
}

=head2 Create a new id

    use SIF::Data;

    my $sd = SIF::Data->new();
    my $id = $sd->make_new_id();

=cut

sub make_new_id {
	my ($self) = @_;

	my $uuid = Data::UUID->new();
	my $id = $uuid->create_str;

	# Old SIF AU 1.3 (v2 infrastructure)
	# was create_str() before #78
	# my $id = $uuid->create_hex;
	# $id =~ s/^0x//;

	return $id;
}

=head2 Create school name

=cut

sub create_school_name{
	my ($self) = @_;

	my $r = Data::RandomPerson->new();
	my $p = $r->create();
	my @school_types = ("Academy", "Grammar", "College");
	my $school_type = $school_types[rand @school_types];
	my $school_name = "$p->{lastname} $school_type";
	return $school_name
}

=head2 Create Local Id    

=cut

sub create_localid {
	my ($self) = @_;

	return (int(rand(99999)) + 1000);
}

=head2 Create Student     

=cut

sub create_StudentPersonal {
	my ($self, $data) = @_;

	my $sex;

	my @indigenous = (
		'Aboriginal but not Torres Strait Islander Origin',
		'Torres Strait Islander but Not Aboriginal Origin',
		'Both Torres Strait and Aboriginal Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Neither Aboriginal or Torres Strait Origin',
		'Not Stated/Unknown'
	);
	my @non_school_ed = ( 0,5,6,7,8 );
	my @empl_type     = ( 1,2,3,4,8,9 );

	my $r = Data::RandomPerson->new();
	my @p;

	$p[0] = $r->create();
	$data->{FamilyName} = $p[0]->{lastname};
	$data->{GivenName}  = $p[0]->{firstname}; 

	if ($p[0]->{gender} eq 'f') {
		$sex = 'Female';
		$p[1] = Data::RandomPerson::Names::Female->new();
		$data->{MiddleName} = $p[1]->get();
	} else {
		$sex = 'Male';
		$p[1] = Data::RandomPerson::Names::Male->new();
		$data->{MiddleName} = $p[1]->get();
	}
	if (int rand(10) == 1) {
		$sex = 'Not Stated/Inadequately Described';
	}

	$data->{refid} = $self->make_new_id;
	# TODO: Properly randomly generate local addresses
	# $p[0]->{address} = create_address();

	# year levels are between 1 and 12 right?
	$data->{yearlevel}                            = int(rand(12)) + 1;
	$data->{StateProvinceId}             		  = int(rand(99999999)) + 1;		# TODO Unique to each Student
	$data->{Sex}                = $self->map_codeset_value('Sex Code', $sex);
	$data->{BirthDate}                            = create_birthdate($data->{yearlevel});
	$data->{IndigenousStatus}                     = $self->map_codeset_value('Indigenous Status', $indigenous[int rand($#indigenous + 1)]); 
	$data->{CountryofBirth}                       = '1101';
	$data->{MostRecent_YearLevel}                 = $data->{yearlevel};
	$data->{MostRecent_Parent1Language}           = '1201';
	$data->{MostRecent_Parent2Language}           = '1201';
	$data->{MostRecent_Parent1SchoolEducation}    = int(rand(5));
	$data->{MostRecent_Parent2SchoolEducation}    = int(rand(5));
	$data->{MostRecent_Parent1NonSchoolEducation} = $non_school_ed[int rand($#non_school_ed + 1)];
	$data->{MostRecent_Parent2NonSchoolEducation} = $non_school_ed[int rand($#non_school_ed + 1)];
	$data->{MostRecent_Parent1EmploymentType}     = $empl_type[int rand($#empl_type + 1)];
	$data->{MostRecent_Parent2EmploymentType}     = $empl_type[int rand($#empl_type + 1)];
	$data->{Email}                                = create_email(
		$data->{GivenName}, 
		$data->{MiddleName}, 
		$data->{FamilyName}
	);

	return $data;
}

sub create_StudentSchoolEnrollment {
	my ($self, $yearlevel) = @_;

	# TODO: Replace fixed years with calculated year
	my $data;
	$data->{refid}          = $self->make_new_id;
	$data->{MembershipType} = '01';
	$data->{SchoolYear}     = '2014';
	$data->{TimeFrame}      = 'C';
	$data->{YearLevel}      = $yearlevel;
	$data->{FTE}            = '1.0';
	$data->{EntryDate}      = '2014-01-25';

	return $data;
}

sub create_StaffPersonal {
	my ($self, $data) = @_;

	my $sex;

	my $r = Data::RandomPerson->new();
	my @p;

	$p[0] = $r->create();
	$data->{FamilyName} = $p[0]->{lastname};
	$data->{GivenName}  = $p[0]->{firstname}; 

	if ($p[0]->{gender} eq 'f') {
		$sex = 'Female';
		$p[1] = Data::RandomPerson::Names::Female->new();
		$data->{MiddleName} = $p[1]->get();
		$data->{Salutation} = create_salutation($sex);

	} else {
		$sex = 'Male';
		$p[1] = Data::RandomPerson::Names::Male->new();
		$data->{MiddleName} = $p[1]->get();
		$data->{Salutation} = create_salutation($sex);
	}

	$data->{refid} = $self->make_new_id;
	# TODO: Properly randomly generate local addresses
	# $p[0]->{address} = create_address();

	$data->{PreferredGivenName} = $data->{GivenName};
	$data->{Sex}                = $self->map_codeset_value('Sex Code', $sex);
	$data->{StateProvinceId}    = int(rand(99999999)) + 1;		# TODO Unique to each Staff
	$data->{EmploymentStatus}   = 'A';
	$data->{PhoneNumber}        = '';
	$data->{Email}              = create_email(
		$data->{GivenName}, 
		$data->{MiddleName}, 
		$data->{FamilyName}
	);

	return $data;
}

sub create_StaffAssignment {
	my ($self, $data) = @_;

	# TODO: Replace fixed years with calculated year
	$data->{refid} = $self->make_new_id;
	$data->{SchoolYear}         = '2014';
	$data->{Description}        = '';
	$data->{PrimaryAssignment}  = 'U';
	$data->{JobStartDate}       = '1990-01-01';
	$data->{JobEndDate}         = '';
	$data->{JobFunction}        = 'teacher';
	$data->{StaffActivity_Code} = $self->random_codeset_key('Staff Activity');

	return $data;
}

sub create_birthdate {
	my ($yearlevel) = @_;

	# TODO: Replace fixed years with calculated year
	my $min = int(2009 - $yearlevel) . '-01-01';
	my $max = int(2011 - $yearlevel) . '-01-01';

	return rand_date( min => $min, max => $max ) . '';
}

sub create_salutation {
	my ($sex) = @_;

	my @salutation;

	if ($sex eq 'Male') {
		@salutation = qw( Mr Dr Mr );		
	}

	if ($sex eq 'Female') {
		@salutation = qw( Mrs Dr Ms Miss );		
	}

	return ($salutation[int rand($#salutation + 1)]);
}

sub create_email {
	my ($GivenName,  $MiddleName, $FamilyName) = @_;

	# Random address ?
	# Random domain ?
	# NO duplicates !

	my @domain = qw/mail.vic.edu.au people.vic.edu.au vic.edu.au dashboard.vic.edu.au distance.vic.edu.au/;
	return ''
		. $FamilyName . '.' . $GivenName . '.' . substr($MiddleName, 0, 1)
		#TODO . int(rand(10))
		. '@'
		. $domain[int rand($#domain + 1)]
}

=head2 Create Postcodes   

=cut

sub create_postcodes {
	my ($self) = @_;

	my @postcodes;
	my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
	  or die "Cannot use CSV: ".Text::CSV->error_diag ();

	my $data_dir = './data';
	$data_dir = "$self->{config}->{data_dir}"  if (defined $self->{config}->{data_dir});

	open my $fh, "<:encoding(utf8)", "$data_dir/postcodes.csv" or die "$data_dir/postcodes.csv: $!";
	while ( my $row = $csv->getline( $fh ) ) {
        	push @postcodes, $row;
	}
	$csv->eof or $csv->error_diag();
	close $fh;

	return @postcodes;
}

=head2 Load Codeset

=cut

sub load_codeset {
	my ($self) = @_;

	if (! $self->{CodeSetKey}) {
		$self->{CodeSetKey} = {};
		$self->{CodeSetValue} = {};
		my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
		  or die "Cannot use CSV: ".Text::CSV->error_diag ();

		my $data_dir = './data';
		$data_dir = "$self->{config}->{data_dir}"  if (defined $self->{config}->{data_dir});

		open my $fh, "<:encoding(utf8)", "$data_dir/codeset.csv" or die "$data_dir/codeset.csv: $!";
		# NOTE Skip first row - assume fields?
		$csv->getline( $fh );
		my $last_codeset;
		while ( my $row = $csv->getline( $fh ) ) {
			$last_codeset = $row->[1] || $last_codeset;
			$self->{CodeSetKey}{$last_codeset}{$row->[2]} = $row->[3];
			$self->{CodeSetValue}{$last_codeset}{$row->[3]} = $row->[2];
		}
		$csv->eof or $csv->error_diag();
		close $fh;

	}
	return $self->{CodeSetKey};
}

sub map_codeset_value {
	my ($self, $set, $value) = @_;
	$self->load_codeset;
	my $ret = $self->{CodeSetValue}{$set}{$value} // '';
	if ($ret eq '') {
		warn "Unable to map codeset value = $set, $value";
	}
	return $ret;
}

sub map_codeset_key {
	my ($self, $set, $key) = @_;
	$self->load_codeset;
	my $ret = $self->{CodeSetKey}{$set}{$key} // '';
	if ($ret eq '') {
		warn "Unable to map codeset key = $set, $key";
	}
	return $ret;
}

# Get a random entry from a set - use map to turn it into a value
sub random_codeset_key {
	my ($self, $set) = @_;
	$self->load_codeset;
	my @vals = keys %{$self->{CodeSetKey}{$set}};
	return $vals[rand @vals];
}

=head2 Create Address     

=cut

sub create_address{
	my ($self) = @_;

	my (@postcodes) = create_postcodes();

	my $address = ();
	my $r = Data::RandomPerson->new();
	my $p = $r->create();
	my @road_types = (
		"Avenue", 
		"Boulevard", 
		"Cove", "Court", "Crescent",
		"Drive",
		"Esplanade",
		"Lane",
		"Place",
		"Road",
		"Square", "Street",
		"Terrace",
		"Walk", "Way",
	);
	my $stnumber = int(rand(300))+1;
	my $index = rand @road_types;
	my $road_type = $road_types[$index];
	$index = rand @postcodes;
	my @postbox = $postcodes[$index];

	$address->{StreetNumber}  = $stnumber;
	$address->{StreetName}    = $p->{firstname} . ' ' . $road_type;
	$address->{City}          = $postbox[0][1];
	$address->{StateProvince} = $postbox[0][2];
	$address->{PostalCode}    = $postbox[0][0];

	return $address;
}

=head2 Create Room elements

=cut
sub make_room_size {
	my ($self) = @_;

	return (int(rand(5) + 2));
}

sub make_room_type {
	my ($self) = @_;

	my @types = ("Classroom", "Classroom", "Classroom", "Classroom", 
	"Classroom", "Classroom", "Art", "Basketball court");
	return $types[rand @types];
}


=head2 Create TimeTable elements

=cut

sub make_new_year{
	my ($self) = @_;

	my $year = int(rand(12)) + 1;
	return $year;
}

sub make_days_per_cycle {
	my ($self) = @_;

	return 10;
}

sub make_periods_per_cycle {
	my ($self) = @_;

	return 6;
}


sub make_short_name {
	my ($self) = @_;

	my @subjects = ("MAT", "ENG", "PHYS", "BIO", "CHEM", "COMP",
          "VIS", "ECON", "HIST");
	my $short_name = $subjects[rand @subjects];
	return $short_name;
}

sub make_long_name {
	my ($self, $short_name) = @_;

	my %subject_dir = (
		"MAT" => "Mathematics",
		"ENG" => "English",
		"PHYS" => "Physics",
		"BIO" => "Biology",
		"CHEM" => "Chemistry",
		"COMP" => "Computer Science",
		"VIS" => "Visual Design",
		"ECON" => "Economics",
		"HIST" => "History"
	);
	return $subject_dir{$short_name};
}

sub make_subject_type {
	my ($self) = @_;

	my @types = ("Core","Elective","?");
	my $i = rand @types;
	return $types[$i];
}

sub make_cell_type{
	my ($self) = @_;

	my @celltypes = ("Teaching","Lunch");
	my $i = rand @celltypes;
	return $celltypes[$i];
}

sub make_kla {
	my ($self) = @_;

	my @kla = (
		"The Arts",
		"The Arts",
		"Humanities & Social Sciences",
		"Humanities & Social Sciences",
		"Science",
		"Science",
		"History",
		"Geography",
		"Religious Education"
	);

	return $kla[int rand($#kla + 1)];
}

sub create_TeachingGroup {
	my ($self, $data) = @_;

	$data->{refid}      = $self->make_new_id();
	$data->{short_name} = $self->make_short_name();
	$data->{long_name}  = $self->make_long_name($data->{short_name});
	$data->{localid}    = $data->{roomid};
	$data->{yearlevel}  = int(rand(12)) + 1;
	$data->{kla}        = $self->make_kla();

	return $data;
}

sub create_SchoolInfo {
	my ($self, $data) = @_;

	# 10% JunPri?, 10% Middle School 20% Secondary 50% Primary and 10% Pri/Sec?
	my @campus = (
		'JunPri',
		'Middle',
		'Prim',
		'Prim',
		'Prim',
		'Prim',
		'Prim',
		'Sec',
		'Sec',
		'Pri/Sec',
	);

	my $address = $self->create_address();

	$data->{CampusSchoolCampusId}        = int(rand(4)) + 1;
	$data->{CampusAdminStatus}           = rand(10) > 8 ? 'N' : 'Y';
	$data->{CampusCampusType}            = $campus[int rand($#campus + 1)];
	$data->{StateProvinceId}             = int(rand(4)) + 1;		# TODO Unique to each school
	$data->{CommonwealthId}              = '8';
	$data->{SchoolSector}                = 'Gov';
	$data->{OperationalStatus}           = 'O';
	$data->{IndependentSchool}           = 'No';
	$data->{SchoolType}                  = $data->{CampusCampusType},
	$data->{Address_ARIA}                = '1.0';
	$data->{Entity_Open}                 = '1990-01-01';

	$data->{Address_Street_StreetNumber} = $address->{StreetNumber};
	$data->{Address_Street_StreetName}   = $address->{StreetName};
	$data->{Address_City}                = $address->{City};
	$data->{Address_StateProvince}       = $address->{StateProvince};
	$data->{Address_PostalCode}          = $address->{PostalCode};

	return $data;
}

sub create_OtherCode {
	my ($self) = @_;

	my @othercodes;
	my $csv = Text::CSV->new ( { binary => 1 } ) 
	  or die "Cannot use CSV: ".Text::CSV->error_diag ();

	my $data_dir  = './data';
	my $data_file = 'TimeTableSubject_OtherCodeList.csv';

	$data_dir = "$self->{config}->{data_dir}"  if (defined $self->{config}->{data_dir});

	open my $fh, "<:encoding(utf8)", "$data_dir/$data_file" or die "$data_dir/$data_file.csv: $!";
	while ( my $row = $csv->getline( $fh ) ) {
        	push @othercodes, $row;
	}
	$csv->eof or $csv->error_diag();
	close $fh;

	my $index = rand @othercodes;
	my @code = $othercodes[$index];
	my $code0 = $code[0] [0];
	my $code1 = $code[0] [1];

	return ($code0, $code1);
}


=head1 AUTHOR

john, C<< <john at unisolve.com.au> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-sif-data at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SIF-Data>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SIF::Data


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SIF-Data>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SIF-Data>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SIF-Data>

=item * Search CPAN

L<http://search.cpan.org/dist/SIF-Data/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 john.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of SIF::Data
