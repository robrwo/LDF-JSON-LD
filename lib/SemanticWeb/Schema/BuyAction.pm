package SemanticWeb::Schema::BuyAction;

# ABSTRACT: The act of giving money to a seller in exchange for goods or services rendered

use Moo;

extends qw/ SemanticWeb::Schema::TradeAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of giving money to a seller in exchange for goods or services
rendered. An agent buys an object, product, or service from a seller for a
price. Reciprocal of SellAction.




=head1 ATTRIBUTES


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


=head2 C<vendor>



'vendor' is an earlier term for 'seller'.


A vendor should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has vendor => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'vendor',
    json_ld_serializer => \&_serialize_vendor,
);

sub _serialize_vendor { $_[0]->_serializer('vendor') }


=head2 C<warranty_promise>

C<warrantyPromise>

The warranty promise(s) included in the offer.


A warranty_promise should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WarrantyPromise']>

=back

=cut

has warranty_promise => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'warrantyPromise',
    json_ld_serializer => \&_serialize_warranty_promise,
);

sub _serialize_warranty_promise { $_[0]->_serializer('warranty_promise') }




around json_ld_type => sub { return 'BuyAction' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'seller' => \&_serialize_seller,
       'vendor' => \&_serialize_vendor,
       'warrantyPromise' => \&_serialize_warranty_promise,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::TradeAction>

=cut

1;
