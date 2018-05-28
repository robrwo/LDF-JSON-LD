package SemanticWeb::Schema::SellAction;

# ABSTRACT: The act of taking money from a buyer in exchange for goods or services rendered

use Moo;

extends qw/ SemanticWeb::Schema::TradeAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of taking money from a buyer in exchange for goods or services
rendered. An agent sells an object, product, or service to a buyer for a
price. Reciprocal of BuyAction.




=head1 ATTRIBUTES


=head2 C<buyer>



A sub property of participant. The participant/person/organization that
bought the object.


A buyer should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has buyer => (
    is        => 'rw',
    predicate => 1,
);


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
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'SellAction' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'buyer' => $self->curry::_serializer('buyer'),
       'warrantyPromise' => $self->curry::_serializer('warranty_promise'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::TradeAction>

=cut

1;