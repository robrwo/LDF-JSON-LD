package SemanticWeb::Schema::PaymentChargeSpecification;

# ABSTRACT: The costs of settling the payment using a particular payment method.

use Moo;

extends qw/ SemanticWeb::Schema::PriceSpecification /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The costs of settling the payment using a particular payment method.




=head1 ATTRIBUTES


=head2 C<applies_to_delivery_method>

C<appliesToDeliveryMethod>

The delivery method(s) to which the delivery charge or payment charge
specification applies.


A applies_to_delivery_method should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DeliveryMethod']>

=back

=cut

has applies_to_delivery_method => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'appliesToDeliveryMethod',
    json_ld_serializer => \&_serialize_applies_to_delivery_method,
);

sub _serialize_applies_to_delivery_method { $_[0]->_serializer('applies_to_delivery_method') }


=head2 C<applies_to_payment_method>

C<appliesToPaymentMethod>

The payment method(s) to which the payment charge specification applies.


A applies_to_payment_method should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::PaymentMethod']>

=back

=cut

has applies_to_payment_method => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'appliesToPaymentMethod',
    json_ld_serializer => \&_serialize_applies_to_payment_method,
);

sub _serialize_applies_to_payment_method { $_[0]->_serializer('applies_to_payment_method') }




around json_ld_type => sub { return 'PaymentChargeSpecification' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'appliesToDeliveryMethod' => \&_serialize_applies_to_delivery_method,
       'appliesToPaymentMethod' => \&_serialize_applies_to_payment_method,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::PriceSpecification>

=cut

1;