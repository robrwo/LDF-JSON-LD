use utf8;

package SemanticWeb::Schema::ApartmentComplex;

# ABSTRACT: Residence type: Apartment complex.

use Moo;

extends qw/ SemanticWeb::Schema::Residence /;


use MooX::JSON_LD 'ApartmentComplex';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v6.0.2';

=encoding utf8

=head1 DESCRIPTION

Residence type: Apartment complex.




=head1 ATTRIBUTES


=head2 C<number_of_accommodation_units>

C<numberOfAccommodationUnits>

=begin html

<p>Indicates the total (available plus unavailable) number of accommodation
units in an <a class="localLink"
href="http://schema.org/ApartmentComplex">ApartmentComplex</a>, or the
number of accommodation units for a specific <a class="localLink"
href="http://schema.org/FloorPlan">FloorPlan</a> (within its specific <a
class="localLink"
href="http://schema.org/ApartmentComplex">ApartmentComplex</a>). See also
<a class="localLink"
href="http://schema.org/numberOfAvailableAccommodationUnits">numberOfAvaila
bleAccommodationUnits</a>.<p>

=end html


A number_of_accommodation_units should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=head2 C<_has_number_of_accommodation_units>

A predicate for the L</number_of_accommodation_units> attribute.

=cut

has number_of_accommodation_units => (
    is        => 'rw',
    predicate => '_has_number_of_accommodation_units',
    json_ld   => 'numberOfAccommodationUnits',
);


=head2 C<number_of_available_accommodation_units>

C<numberOfAvailableAccommodationUnits>

=begin html

<p>Indicates the number of available accommodation units in an <a
class="localLink"
href="http://schema.org/ApartmentComplex">ApartmentComplex</a>, or the
number of accommodation units for a specific <a class="localLink"
href="http://schema.org/FloorPlan">FloorPlan</a> (within its specific <a
class="localLink"
href="http://schema.org/ApartmentComplex">ApartmentComplex</a>). See also
<a class="localLink"
href="http://schema.org/numberOfAccommodationUnits">numberOfAccommodationUn
its</a>.<p>

=end html


A number_of_available_accommodation_units should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=head2 C<_has_number_of_available_accommodation_units>

A predicate for the L</number_of_available_accommodation_units> attribute.

=cut

has number_of_available_accommodation_units => (
    is        => 'rw',
    predicate => '_has_number_of_available_accommodation_units',
    json_ld   => 'numberOfAvailableAccommodationUnits',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Residence>

=cut

1;
