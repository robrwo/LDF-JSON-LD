package SemanticWeb::Schema::OrderAction;

# ABSTRACT: An agent orders an object/product/service to be delivered/sent.

use Moo;

extends qw/ SemanticWeb::Schema::TradeAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An agent orders an object/product/service to be delivered/sent.




=head1 ATTRIBUTES


=head2 C<delivery_method>

C<deliveryMethod>

A sub property of instrument. The method of delivery.


A delivery_method should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DeliveryMethod']>

=back

=cut

has delivery_method => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'OrderAction' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'deliveryMethod' => $self->curry::_serializer('delivery_method'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::TradeAction>

=cut

1;