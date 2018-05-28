package SemanticWeb::Schema::OrderItem;

# ABSTRACT: An order item is a line of an order

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An order item is a line of an order. It includes the quantity and shipping
details of a bought offer.




=head1 ATTRIBUTES


=head2 C<order_delivery>

C<orderDelivery>

The delivery of the parcel related to this order or order item.


A order_delivery should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ParcelDelivery']>

=back

=cut

has order_delivery => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<order_item_number>

C<orderItemNumber>

The identifier of the order item.


A order_item_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has order_item_number => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<order_item_status>

C<orderItemStatus>

The current status of the order item.


A order_item_status should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::OrderStatus']>

=back

=cut

has order_item_status => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<order_quantity>

C<orderQuantity>

The number of the item ordered. If the property is not set, assume the
quantity is one.


A order_quantity should be one of the following types:

=over

=item C<Num>

=back

=cut

has order_quantity => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<ordered_item>

C<orderedItem>

The item ordered.


A ordered_item should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Product']>

=item C<InstanceOf['SemanticWeb::Schema::OrderItem']>

=back

=cut

has ordered_item => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'OrderItem' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'orderDelivery' => $self->curry::_serializer('order_delivery'),
       'orderItemNumber' => $self->curry::_serializer('order_item_number'),
       'orderItemStatus' => $self->curry::_serializer('order_item_status'),
       'orderQuantity' => $self->curry::_serializer('order_quantity'),
       'orderedItem' => $self->curry::_serializer('ordered_item'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;