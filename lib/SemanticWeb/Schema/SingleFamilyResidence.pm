use utf8;

package SemanticWeb::Schema::SingleFamilyResidence;

# ABSTRACT: Residence type: Single-family home.

use Moo;

extends qw/ SemanticWeb::Schema::House /;


use MooX::JSON_LD 'SingleFamilyResidence';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.8.0';

=encoding utf8

=head1 DESCRIPTION

Residence type: Single-family home.




=head1 ATTRIBUTES


=head2 C<number_of_rooms>

C<numberOfRooms>

The number of rooms (excluding bathrooms and closets) of the accommodation
or lodging business. Typical unit code(s): ROM for room or C62 for no unit.
The type of room can be put in the unitText property of the
QuantitativeValue.


A number_of_rooms should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=item C<Num>

=back

=cut

has number_of_rooms => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'numberOfRooms',
);


=head2 C<occupancy>



The allowed total occupancy for the accommodation in persons (including
infants etc). For individual accommodations, this is not necessarily the
legal maximum but defines the permitted usage as per the contractual
agreement (e.g. a double room used by a single person). Typical unit
code(s): C62 for person


A occupancy should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has occupancy => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'occupancy',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::House>

=cut

1;
