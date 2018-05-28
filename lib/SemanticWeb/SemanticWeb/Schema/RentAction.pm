package SemanticWeb::Schema::RentAction;

# ABSTRACT: The act of giving money in return for temporary use

use Moo;

extends qw/ SemanticWeb::Schema::TradeAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of giving money in return for temporary use, but not ownership, of
an object such as a vehicle or property. For example, an agent rents a
property from a landlord in exchange for a periodic payment.




=head1 ATTRIBUTES


=head2 C<landlord>



A sub property of participant. The owner of the real estate property.


A landlord should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has landlord => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<real_estate_agent>

C<realEstateAgent>

A sub property of participant. The real estate agent involved in the
action.


A real_estate_agent should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::RealEstateAgent']>

=back

=cut

has real_estate_agent => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'RentAction' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'landlord' => $self->curry::_serializer('landlord'),
       'realEstateAgent' => $self->curry::_serializer('real_estate_agent'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::TradeAction>

=cut

1;