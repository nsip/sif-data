package SIF::Data;

use 5.006;
use strict;
use warnings FATAL => 'all';
use Text::CSV;
use Data::UUID;
use Data::RandomPerson;
use YAML;
use DBI;

=head1 NAME

SIF::Data - The great new SIF::Data!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use SIF::Data;

    my $foo = SIF::Data->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

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
	my $config = YAML::LoadFile($ENV{HOME} . "/.nsip_sif_data");

	# Connect to database
	my $dbh = DBI->connect(
		$config->{mysql_dsn},
		$config->{mysql_user},
		$config->{mysql_password},
		{RaiseError => 1, AutoCommit => 1}
	);

	return ($config, $dbh);
}

=head2 Create a new id

=cut

sub make_new_id {
	my $uuid = Data::UUID->new();
	$uuid->create_str;
}

=head2 Create school name

=cut

sub create_school_name{
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
        return (int(rand(99999)) + 1000);
}

=head2 Create Student     

=cut

sub create_student{
        # Make a student
        my $uuid = Data::UUID->new();
        my $r = Data::RandomPerson->new();
        my $p = $r->create();
        $p->{refid} = $uuid->create_str;
        # TODO: Properly randomly generate local addresses
        $p->{address} = create_address();
        # year levels are between 1 and 12 right?
        $p->{yearlevel} = int(rand(12)) + 1;
        $p;
}


=head2 Create Postcodes   

=cut

sub create_postcodes {
	my @postcodes;
	my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
	  or die "Cannot use CSV: ".Text::CSV->error_diag ();

	open my $fh, "<:encoding(utf8)", "../data/postcodes.csv" or die "../data/postcodes.csv: $!";
	while ( my $row = $csv->getline( $fh ) ) {
        	push @postcodes, $row;
	}
	$csv->eof or $csv->error_diag();
	close $fh;

	return @postcodes;
}

=head2 Create Address     

=cut

sub create_address{
	my (@postcodes) = create_postcodes();

        my $r = Data::RandomPerson->new();
        my $p = $r->create();
        my @roads = ("Road","Street","Court","Crescent","Drive","Avenue",
        "Boulevard", "Lane","Way","Walk","Square");
        my $stnumber = int(rand(300))+1;
        my $index = rand @roads;
        my $road = $roads[$index];
        $index = rand @postcodes;
        my @postbox = $postcodes[$index];
        my $address = "$stnumber $p->{firstname} $road, $postbox[0][1], $postbox[0][2], $postbox[0][0]";
        $address;
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
