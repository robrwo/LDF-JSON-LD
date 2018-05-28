package SemanticWeb::Schema::Order;

# ABSTRACT: An order is a confirmation of a transaction (a receipt)

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An order is a confirmation of a transaction (a receipt), which can contain
multiple line items, each represented by an Offer that has been accepted by
the customer.




=head1 ATTRIBUTES


=head2 C<accepted_offer>

C<acceptedOffer>

The offer(s) -- e.g., product, quantity and price combinations -- included
in the order.


A accepted_offer should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Offer']>

=back

=cut

has accepted_offer => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<billing_address>

C<billingAddress>

The billing address for the order.


A billing_address should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::PostalAddress']>

=back

=cut

has billing_address => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<broker>



An entity that arranges for an exchange between a buyer and a seller. In
most cases a broker never acquires or releases ownership of a product or
service involved in an exchange. If it is not clear whether an entity is a
broker, seller, or buyer, the latter two terms are preferred.


A broker should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has broker => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<confirmation_number>

C<confirmationNumber>

A number that confirms the given order or payment has been received.


A confirmation_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has confirmation_number => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<customer>



Party placing the order or paying the invoice.


A customer should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has customer => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<discount>



Any discount applied (to an Order).


A discount should be one of the following types:

=over

=item C<Num>

=item C<Str>

=back

=cut

has discount => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<discount_code>

C<discountCode>

Code used to redeem a discount.


A discount_code should be one of the following types:

=over

=item C<Str>

=back

=cut

has discount_code => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<discount_currency>

C<discountCurrency>

The currency (in 3-letter ISO 4217 format) of the discount.


A discount_currency should be one of the following types:

=over

=item C<Str>

=back

=cut

has discount_currency => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<is_gift>

C<isGift>

Was the offer accepted as a gift for someone other than the buyer.


A is_gift should be one of the following types:

=over

=item C<Bool>

=back

=cut

has is_gift => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<merchant>



'merchant' is an out-dated term for 'seller'.


A merchant should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has merchant => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<order_date>

C<orderDate>

Date order was placed.


A order_date should be one of the following types:

=over

=item C<Str>

=back

=cut

has order_date => (
    is        => 'rw',
    predicate => 1,
);


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


=head2 C<order_number>

C<orderNumber>

The identifier of the transaction.


A order_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has order_number => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<order_status>

C<orderStatus>

The current status of the order.


A order_status should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::OrderStatus']>

=back

=cut

has order_status => (
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


=head2 C<part_of_invoice>

C<partOfInvoice>

The order is being paid as part of the referenced Invoice.


A part_of_invoice should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Invoice']>

=back

=cut

has part_of_invoice => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<payment_due>

C<paymentDue>

The date that payment is due.


A payment_due should be one of the following types:

=over

=item C<Str>

=back

=cut

has payment_due => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<payment_due_date>

C<paymentDueDate>

The date that payment is due.


A payment_due_date should be one of the following types:

=over

=item C<Str>

=back

=cut

has payment_due_date => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<payment_method>

C<paymentMethod>

The name of the credit card or other method of payment for the order.


A payment_method should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::PaymentMethod']>

=back

=cut

has payment_method => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<payment_method_id>

C<paymentMethodId>

An identifier for the method of payment used (e.g. the last 4 digits of the
credit card).


A payment_method_id should be one of the following types:

=over

=item C<Str>

=back

=cut

has payment_method_id => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<payment_url>

C<paymentUrl>

The URL for sending a payment.


A payment_url should be one of the following types:

=over

=item C<Str>

=back

=cut

has payment_url => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<seller>



An entity which offers (sells / leases / lends / loans) the services /
goods. A seller may also be a provider.


A seller should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has seller => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Order' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'acceptedOffer' => $self->curry::_serializer('accepted_offer'),
       'billingAddress' => $self->curry::_serializer('billing_address'),
       'broker' => $self->curry::_serializer('broker'),
       'confirmationNumber' => $self->curry::_serializer('confirmation_number'),
       'customer' => $self->curry::_serializer('customer'),
       'discount' => $self->curry::_serializer('discount'),
       'discountCode' => $self->curry::_serializer('discount_code'),
       'discountCurrency' => $self->curry::_serializer('discount_currency'),
       'isGift' => $self->curry::_serializer('is_gift'),
       'merchant' => $self->curry::_serializer('merchant'),
       'orderDate' => $self->curry::_serializer('order_date'),
       'orderDelivery' => $self->curry::_serializer('order_delivery'),
       'orderNumber' => $self->curry::_serializer('order_number'),
       'orderStatus' => $self->curry::_serializer('order_status'),
       'orderedItem' => $self->curry::_serializer('ordered_item'),
       'partOfInvoice' => $self->curry::_serializer('part_of_invoice'),
       'paymentDue' => $self->curry::_serializer('payment_due'),
       'paymentDueDate' => $self->curry::_serializer('payment_due_date'),
       'paymentMethod' => $self->curry::_serializer('payment_method'),
       'paymentMethodId' => $self->curry::_serializer('payment_method_id'),
       'paymentUrl' => $self->curry::_serializer('payment_url'),
       'seller' => $self->curry::_serializer('seller'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;