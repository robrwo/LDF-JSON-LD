package LDF::Schema::WarrantyScope;

# ABSTRACT: <p>A range of of services that will be provided to a customer free of charge in case of a defect or malfunction of a product

use Moo;

extends qw/ LDF::Schema::Enumeration /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

<p>A range of of services that will be provided to a customer free of
charge in case of a defect or malfunction of a product.</p> <p>Commonly
used values:</p> <ul>
<li>http://purl.org/goodrelations/v1#Labor-BringIn</li>
<li>http://purl.org/goodrelations/v1#PartsAndLabor-BringIn</li>
<li>http://purl.org/goodrelations/v1#PartsAndLabor-PickUp</li> </ul> 

=end html



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'WarrantyScope' }



=head1 SEE ALSO



L<LDF::Schema::Enumeration>

=cut

1;