use utf8;

package SemanticWeb::Schema::Order;

# ABSTRACT: An order is a confirmation of a transaction (a receipt)

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use MooX::JSON_LD 'Order';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.9.1';

=encoding utf8

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
    json_ld   => 'acceptedOffer',
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
    json_ld   => 'billingAddress',
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
    json_ld   => 'broker',
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
    json_ld   => 'confirmationNumber',
);


=head2 C<customer>



Party placing the order or paying the invoice.


A customer should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has customer => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'customer',
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
    json_ld   => 'discount',
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
    json_ld   => 'discountCode',
);


=head2 C<discount_currency>

C<discountCurrency>

=begin html

The currency of the discount.<br/><br/> Use standard formats: <a
href="http://en.wikipedia.org/wiki/ISO_4217">ISO 4217 currency format</a>
e.g. "USD"; <a
href="https://en.wikipedia.org/wiki/List_of_cryptocurrencies">Ticker
symbol</a> for cryptocurrencies e.g. "BTC"; well known names for <a
href="https://en.wikipedia.org/wiki/Local_exchange_trading_system">Local
Exchange Tradings Systems</a> (LETS) and other currency types e.g. "Ithaca
HOUR".

=end html


A discount_currency should be one of the following types:

=over

=item C<Str>

=back

=cut

has discount_currency => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'discountCurrency',
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
    json_ld   => 'isGift',
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
    json_ld   => 'merchant',
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
    json_ld   => 'orderDate',
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
    json_ld   => 'orderDelivery',
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
    json_ld   => 'orderNumber',
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
    json_ld   => 'orderStatus',
);


=head2 C<ordered_item>

C<orderedItem>

The item ordered.


A ordered_item should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::OrderItem']>

=item C<InstanceOf['SemanticWeb::Schema::Product']>

=item C<InstanceOf['SemanticWeb::Schema::Service']>

=back

=cut

has ordered_item => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'orderedItem',
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
    json_ld   => 'partOfInvoice',
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
    json_ld   => 'paymentDue',
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
    json_ld   => 'paymentDueDate',
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
    json_ld   => 'paymentMethod',
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
    json_ld   => 'paymentMethodId',
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
    json_ld   => 'paymentUrl',
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
    json_ld   => 'seller',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;
