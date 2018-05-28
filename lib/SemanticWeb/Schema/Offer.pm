package SemanticWeb::Schema::Offer;

# ABSTRACT: An offer to transfer some rights to an item or to provide a service — for example

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

An offer to transfer some rights to an item or to provide a service — for
example, an offer to sell tickets to an event, to rent the DVD of a movie,
to stream a TV show over the internet, to repair a motorcycle, or to loan a
book.</p> <p>For <a
href="http://www.gs1.org/barcodes/technical/idkeys/gtin">GTIN</a>-related
fields, see <a
href="http://www.gs1.org/barcodes/support/check_digit_calculator">Check
Digit calculator</a> and <a
href="http://www.gs1us.org/resources/standards/gtin-validation-guide">valid
ation guide</a> from <a href="http://www.gs1.org/">GS1</a>.

=end html




=head1 ATTRIBUTES


=head2 C<accepted_payment_method>

C<acceptedPaymentMethod>

The payment method(s) accepted by seller for this offer.


A accepted_payment_method should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::LoanOrCredit']>

=item C<InstanceOf['SemanticWeb::Schema::PaymentMethod']>

=back

=cut

has accepted_payment_method => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'acceptedPaymentMethod',
    json_ld_serializer => \&_serialize_accepted_payment_method,
);

sub _serialize_accepted_payment_method { $_[0]->_serializer('accepted_payment_method') }


=head2 C<add_on>

C<addOn>

An additional offer that can only be obtained in combination with the first
base offer (e.g. supplements and extensions that are available for a
surcharge).


A add_on should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Offer']>

=back

=cut

has add_on => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'addOn',
    json_ld_serializer => \&_serialize_add_on,
);

sub _serialize_add_on { $_[0]->_serializer('add_on') }


=head2 C<advance_booking_requirement>

C<advanceBookingRequirement>

The amount of time that is required between accepting the offer and the
actual usage of the resource or service.


A advance_booking_requirement should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has advance_booking_requirement => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'advanceBookingRequirement',
    json_ld_serializer => \&_serialize_advance_booking_requirement,
);

sub _serialize_advance_booking_requirement { $_[0]->_serializer('advance_booking_requirement') }


=head2 C<aggregate_rating>

C<aggregateRating>

The overall rating, based on a collection of reviews or ratings, of the
item.


A aggregate_rating should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::AggregateRating']>

=back

=cut

has aggregate_rating => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'aggregateRating',
    json_ld_serializer => \&_serialize_aggregate_rating,
);

sub _serialize_aggregate_rating { $_[0]->_serializer('aggregate_rating') }


=head2 C<area_served>

C<areaServed>

The geographic area where a service or offered item is provided.


A area_served should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::GeoShape']>

=item C<InstanceOf['SemanticWeb::Schema::AdministrativeArea']>

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has area_served => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'areaServed',
    json_ld_serializer => \&_serialize_area_served,
);

sub _serialize_area_served { $_[0]->_serializer('area_served') }


=head2 C<availability>



The availability of this item&#x2014;for example In stock, Out of stock,
Pre-order, etc.


A availability should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ItemAvailability']>

=back

=cut

has availability => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'availability',
    json_ld_serializer => \&_serialize_availability,
);

sub _serialize_availability { $_[0]->_serializer('availability') }


=head2 C<availability_ends>

C<availabilityEnds>

The end of the availability of the product or service included in the
offer.


A availability_ends should be one of the following types:

=over

=item C<Str>

=back

=cut

has availability_ends => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'availabilityEnds',
    json_ld_serializer => \&_serialize_availability_ends,
);

sub _serialize_availability_ends { $_[0]->_serializer('availability_ends') }


=head2 C<availability_starts>

C<availabilityStarts>

The beginning of the availability of the product or service included in the
offer.


A availability_starts should be one of the following types:

=over

=item C<Str>

=back

=cut

has availability_starts => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'availabilityStarts',
    json_ld_serializer => \&_serialize_availability_starts,
);

sub _serialize_availability_starts { $_[0]->_serializer('availability_starts') }


=head2 C<available_at_or_from>

C<availableAtOrFrom>

The place(s) from which the offer can be obtained (e.g. store locations).


A available_at_or_from should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has available_at_or_from => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'availableAtOrFrom',
    json_ld_serializer => \&_serialize_available_at_or_from,
);

sub _serialize_available_at_or_from { $_[0]->_serializer('available_at_or_from') }


=head2 C<available_delivery_method>

C<availableDeliveryMethod>

The delivery method(s) available for this offer.


A available_delivery_method should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DeliveryMethod']>

=back

=cut

has available_delivery_method => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'availableDeliveryMethod',
    json_ld_serializer => \&_serialize_available_delivery_method,
);

sub _serialize_available_delivery_method { $_[0]->_serializer('available_delivery_method') }


=head2 C<business_function>

C<businessFunction>

The business function (e.g. sell, lease, repair, dispose) of the offer or
component of a bundle (TypeAndQuantityNode). The default is
http://purl.org/goodrelations/v1#Sell.


A business_function should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::BusinessFunction']>

=back

=cut

has business_function => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'businessFunction',
    json_ld_serializer => \&_serialize_business_function,
);

sub _serialize_business_function { $_[0]->_serializer('business_function') }


=head2 C<category>



A category for the item. Greater signs or slashes can be used to informally
indicate a category hierarchy.


A category should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::Thing']>

=back

=cut

has category => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'category',
    json_ld_serializer => \&_serialize_category,
);

sub _serialize_category { $_[0]->_serializer('category') }


=head2 C<delivery_lead_time>

C<deliveryLeadTime>

The typical delay between the receipt of the order and the goods either
leaving the warehouse or being prepared for pickup, in case the delivery
method is on site pickup.


A delivery_lead_time should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has delivery_lead_time => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'deliveryLeadTime',
    json_ld_serializer => \&_serialize_delivery_lead_time,
);

sub _serialize_delivery_lead_time { $_[0]->_serializer('delivery_lead_time') }


=head2 C<eligible_customer_type>

C<eligibleCustomerType>

The type(s) of customers for which the given offer is valid.


A eligible_customer_type should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::BusinessEntityType']>

=back

=cut

has eligible_customer_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'eligibleCustomerType',
    json_ld_serializer => \&_serialize_eligible_customer_type,
);

sub _serialize_eligible_customer_type { $_[0]->_serializer('eligible_customer_type') }


=head2 C<eligible_duration>

C<eligibleDuration>

The duration for which the given offer is valid.


A eligible_duration should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has eligible_duration => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'eligibleDuration',
    json_ld_serializer => \&_serialize_eligible_duration,
);

sub _serialize_eligible_duration { $_[0]->_serializer('eligible_duration') }


=head2 C<eligible_quantity>

C<eligibleQuantity>

The interval and unit of measurement of ordering quantities for which the
offer or price specification is valid. This allows e.g. specifying that a
certain freight charge is valid only for a certain quantity.


A eligible_quantity should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has eligible_quantity => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'eligibleQuantity',
    json_ld_serializer => \&_serialize_eligible_quantity,
);

sub _serialize_eligible_quantity { $_[0]->_serializer('eligible_quantity') }


=head2 C<eligible_region>

C<eligibleRegion>

=begin html

The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the
GeoShape for the geo-political region(s) for which the offer or delivery
charge specification is valid.</p> <p>See also <a class="localLink"
href="http://schema.org/ineligibleRegion">ineligibleRegion</a>.

=end html


A eligible_region should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::GeoShape']>

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has eligible_region => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'eligibleRegion',
    json_ld_serializer => \&_serialize_eligible_region,
);

sub _serialize_eligible_region { $_[0]->_serializer('eligible_region') }


=head2 C<eligible_transaction_volume>

C<eligibleTransactionVolume>

The transaction volume, in a monetary unit, for which the offer or price
specification is valid, e.g. for indicating a minimal purchasing volume, to
express free shipping above a certain order volume, or to limit the
acceptance of credit cards to purchases to a certain minimal amount.


A eligible_transaction_volume should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::PriceSpecification']>

=back

=cut

has eligible_transaction_volume => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'eligibleTransactionVolume',
    json_ld_serializer => \&_serialize_eligible_transaction_volume,
);

sub _serialize_eligible_transaction_volume { $_[0]->_serializer('eligible_transaction_volume') }


=head2 C<gtin12>



=begin html

The <a
href="http://apps.gs1.org/GDD/glossary/Pages/GTIN-12.aspx">GTIN-12</a> code
of the product, or the product to which the offer refers. The GTIN-12 is
the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix,
Item Reference, and Check Digit used to identify trade items. See <a
href="http://www.gs1.org/barcodes/technical/idkeys/gtin">GS1 GTIN
Summary</a> for more details.

=end html


A gtin12 should be one of the following types:

=over

=item C<Str>

=back

=cut

has gtin12 => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'gtin12',
    json_ld_serializer => \&_serialize_gtin12,
);

sub _serialize_gtin12 { $_[0]->_serializer('gtin12') }


=head2 C<gtin13>



=begin html

The <a
href="http://apps.gs1.org/GDD/glossary/Pages/GTIN-13.aspx">GTIN-13</a> code
of the product, or the product to which the offer refers. This is
equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes
can be converted into a GTIN-13 code by simply adding a preceeding zero.
See <a href="http://www.gs1.org/barcodes/technical/idkeys/gtin">GS1 GTIN
Summary</a> for more details.

=end html


A gtin13 should be one of the following types:

=over

=item C<Str>

=back

=cut

has gtin13 => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'gtin13',
    json_ld_serializer => \&_serialize_gtin13,
);

sub _serialize_gtin13 { $_[0]->_serializer('gtin13') }


=head2 C<gtin14>



=begin html

The <a
href="http://apps.gs1.org/GDD/glossary/Pages/GTIN-14.aspx">GTIN-14</a> code
of the product, or the product to which the offer refers. See <a
href="http://www.gs1.org/barcodes/technical/idkeys/gtin">GS1 GTIN
Summary</a> for more details.

=end html


A gtin14 should be one of the following types:

=over

=item C<Str>

=back

=cut

has gtin14 => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'gtin14',
    json_ld_serializer => \&_serialize_gtin14,
);

sub _serialize_gtin14 { $_[0]->_serializer('gtin14') }


=head2 C<gtin8>



=begin html

The <a href="http://apps.gs1.org/GDD/glossary/Pages/GTIN-8.aspx">GTIN-8</a>
code of the product, or the product to which the offer refers. This code is
also known as EAN/UCC-8 or 8-digit EAN. See <a
href="http://www.gs1.org/barcodes/technical/idkeys/gtin">GS1 GTIN
Summary</a> for more details.

=end html


A gtin8 should be one of the following types:

=over

=item C<Str>

=back

=cut

has gtin8 => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'gtin8',
    json_ld_serializer => \&_serialize_gtin8,
);

sub _serialize_gtin8 { $_[0]->_serializer('gtin8') }


=head2 C<includes_object>

C<includesObject>

This links to a node or nodes indicating the exact quantity of the products
included in the offer.


A includes_object should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::TypeAndQuantityNode']>

=back

=cut

has includes_object => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'includesObject',
    json_ld_serializer => \&_serialize_includes_object,
);

sub _serialize_includes_object { $_[0]->_serializer('includes_object') }


=head2 C<ineligible_region>

C<ineligibleRegion>

=begin html

The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the
GeoShape for the geo-political region(s) for which the offer or delivery
charge specification is not valid, e.g. a region where the transaction is
not allowed.</p> <p>See also <a class="localLink"
href="http://schema.org/eligibleRegion">eligibleRegion</a>.

=end html


A ineligible_region should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=item C<InstanceOf['SemanticWeb::Schema::GeoShape']>

=back

=cut

has ineligible_region => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'ineligibleRegion',
    json_ld_serializer => \&_serialize_ineligible_region,
);

sub _serialize_ineligible_region { $_[0]->_serializer('ineligible_region') }


=head2 C<inventory_level>

C<inventoryLevel>

The current approximate inventory level for the item or items.


A inventory_level should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has inventory_level => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'inventoryLevel',
    json_ld_serializer => \&_serialize_inventory_level,
);

sub _serialize_inventory_level { $_[0]->_serializer('inventory_level') }


=head2 C<item_condition>

C<itemCondition>

A predefined value from OfferItemCondition or a textual description of the
condition of the product or service, or the products or services included
in the offer.


A item_condition should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::OfferItemCondition']>

=back

=cut

has item_condition => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'itemCondition',
    json_ld_serializer => \&_serialize_item_condition,
);

sub _serialize_item_condition { $_[0]->_serializer('item_condition') }


=head2 C<item_offered>

C<itemOffered>

The item being offered.


A item_offered should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Service']>

=item C<InstanceOf['SemanticWeb::Schema::Product']>

=back

=cut

has item_offered => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'itemOffered',
    json_ld_serializer => \&_serialize_item_offered,
);

sub _serialize_item_offered { $_[0]->_serializer('item_offered') }


=head2 C<mpn>



The Manufacturer Part Number (MPN) of the product, or the product to which
the offer refers.


A mpn should be one of the following types:

=over

=item C<Str>

=back

=cut

has mpn => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'mpn',
    json_ld_serializer => \&_serialize_mpn,
);

sub _serialize_mpn { $_[0]->_serializer('mpn') }


=head2 C<offered_by>

C<offeredBy>

A pointer to the organization or person making the offer.


A offered_by should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has offered_by => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'offeredBy',
    json_ld_serializer => \&_serialize_offered_by,
);

sub _serialize_offered_by { $_[0]->_serializer('offered_by') }


=head2 C<price>



=begin html

<p>The offer price of a product, or of a price component when attached to
PriceSpecification and its subtypes.</p> <p>Usage guidelines:</p> <ul>
<li>Use the <a class="localLink"
href="http://schema.org/priceCurrency">priceCurrency</a> property (with <a
href="http://en.wikipedia.org/wiki/ISO_4217#Active_codes">ISO 4217
codes</a> e.g. "USD") instead of including <a
href="http://en.wikipedia.org/wiki/Dollar_sign#Currencies_that_use_the_doll
ar_or_peso_sign">ambiguous symbols</a> such as '$' in the value.</li>
<li>Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a
decimal point. Avoid using these symbols as a readability separator.</li>
<li>Note that both <a
href="http://www.w3.org/TR/xhtml-rdfa-primer/#using-the-content-attribute">
RDFa</a> and Microdata syntax allow the use of a "content=" attribute for
publishing simple machine-readable values alongside more human-friendly
formatting.</li> <li>Use values from 0123456789 (Unicode 'DIGIT ZERO'
(U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar
Unicode symbols.</li> </ul> 

=end html


A price should be one of the following types:

=over

=item C<Num>

=item C<Str>

=back

=cut

has price => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'price',
    json_ld_serializer => \&_serialize_price,
);

sub _serialize_price { $_[0]->_serializer('price') }


=head2 C<price_currency>

C<priceCurrency>

=begin html

The currency (in 3-letter ISO 4217 format) of the price or a price
component, when attached to <a class="localLink"
href="http://schema.org/PriceSpecification">PriceSpecification</a> and its
subtypes.

=end html


A price_currency should be one of the following types:

=over

=item C<Str>

=back

=cut

has price_currency => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'priceCurrency',
    json_ld_serializer => \&_serialize_price_currency,
);

sub _serialize_price_currency { $_[0]->_serializer('price_currency') }


=head2 C<price_specification>

C<priceSpecification>

One or more detailed price specifications, indicating the unit price and
delivery or payment charges.


A price_specification should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::PriceSpecification']>

=back

=cut

has price_specification => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'priceSpecification',
    json_ld_serializer => \&_serialize_price_specification,
);

sub _serialize_price_specification { $_[0]->_serializer('price_specification') }


=head2 C<price_valid_until>

C<priceValidUntil>

The date after which the price is no longer available.


A price_valid_until should be one of the following types:

=over

=item C<Str>

=back

=cut

has price_valid_until => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'priceValidUntil',
    json_ld_serializer => \&_serialize_price_valid_until,
);

sub _serialize_price_valid_until { $_[0]->_serializer('price_valid_until') }


=head2 C<review>



A review of the item.


A review should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Review']>

=back

=cut

has review => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'review',
    json_ld_serializer => \&_serialize_review,
);

sub _serialize_review { $_[0]->_serializer('review') }


=head2 C<reviews>



Review of the item.


A reviews should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Review']>

=back

=cut

has reviews => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'reviews',
    json_ld_serializer => \&_serialize_reviews,
);

sub _serialize_reviews { $_[0]->_serializer('reviews') }


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
    json_ld_serializer => \&_serialize_seller,
);

sub _serialize_seller { $_[0]->_serializer('seller') }


=head2 C<serial_number>

C<serialNumber>

The serial number or any alphanumeric identifier of a particular product.
When attached to an offer, it is a shortcut for the serial number of the
product included in the offer.


A serial_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has serial_number => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'serialNumber',
    json_ld_serializer => \&_serialize_serial_number,
);

sub _serialize_serial_number { $_[0]->_serializer('serial_number') }


=head2 C<sku>



The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a
product or service, or the product to which the offer refers.


A sku should be one of the following types:

=over

=item C<Str>

=back

=cut

has sku => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'sku',
    json_ld_serializer => \&_serialize_sku,
);

sub _serialize_sku { $_[0]->_serializer('sku') }


=head2 C<valid_from>

C<validFrom>

The date when the item becomes valid.


A valid_from should be one of the following types:

=over

=item C<Str>

=back

=cut

has valid_from => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'validFrom',
    json_ld_serializer => \&_serialize_valid_from,
);

sub _serialize_valid_from { $_[0]->_serializer('valid_from') }


=head2 C<valid_through>

C<validThrough>

The date after when the item is not valid. For example the end of an offer,
salary period, or a period of opening hours.


A valid_through should be one of the following types:

=over

=item C<Str>

=back

=cut

has valid_through => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'validThrough',
    json_ld_serializer => \&_serialize_valid_through,
);

sub _serialize_valid_through { $_[0]->_serializer('valid_through') }


=head2 C<warranty>



The warranty promise(s) included in the offer.


A warranty should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WarrantyPromise']>

=back

=cut

has warranty => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'warranty',
    json_ld_serializer => \&_serialize_warranty,
);

sub _serialize_warranty { $_[0]->_serializer('warranty') }




around json_ld_type => sub { return 'Offer' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'acceptedPaymentMethod' => \&_serialize_accepted_payment_method,
       'addOn' => \&_serialize_add_on,
       'advanceBookingRequirement' => \&_serialize_advance_booking_requirement,
       'aggregateRating' => \&_serialize_aggregate_rating,
       'areaServed' => \&_serialize_area_served,
       'availability' => \&_serialize_availability,
       'availabilityEnds' => \&_serialize_availability_ends,
       'availabilityStarts' => \&_serialize_availability_starts,
       'availableAtOrFrom' => \&_serialize_available_at_or_from,
       'availableDeliveryMethod' => \&_serialize_available_delivery_method,
       'businessFunction' => \&_serialize_business_function,
       'category' => \&_serialize_category,
       'deliveryLeadTime' => \&_serialize_delivery_lead_time,
       'eligibleCustomerType' => \&_serialize_eligible_customer_type,
       'eligibleDuration' => \&_serialize_eligible_duration,
       'eligibleQuantity' => \&_serialize_eligible_quantity,
       'eligibleRegion' => \&_serialize_eligible_region,
       'eligibleTransactionVolume' => \&_serialize_eligible_transaction_volume,
       'gtin12' => \&_serialize_gtin12,
       'gtin13' => \&_serialize_gtin13,
       'gtin14' => \&_serialize_gtin14,
       'gtin8' => \&_serialize_gtin8,
       'includesObject' => \&_serialize_includes_object,
       'ineligibleRegion' => \&_serialize_ineligible_region,
       'inventoryLevel' => \&_serialize_inventory_level,
       'itemCondition' => \&_serialize_item_condition,
       'itemOffered' => \&_serialize_item_offered,
       'mpn' => \&_serialize_mpn,
       'offeredBy' => \&_serialize_offered_by,
       'price' => \&_serialize_price,
       'priceCurrency' => \&_serialize_price_currency,
       'priceSpecification' => \&_serialize_price_specification,
       'priceValidUntil' => \&_serialize_price_valid_until,
       'review' => \&_serialize_review,
       'reviews' => \&_serialize_reviews,
       'seller' => \&_serialize_seller,
       'serialNumber' => \&_serialize_serial_number,
       'sku' => \&_serialize_sku,
       'validFrom' => \&_serialize_valid_from,
       'validThrough' => \&_serialize_valid_through,
       'warranty' => \&_serialize_warranty,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;
