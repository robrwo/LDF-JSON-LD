package SemanticWeb::Schema::Ticket;

# ABSTRACT: Used to describe a ticket to an event

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Used to describe a ticket to an event, a flight, a bus ride, etc.




=head1 ATTRIBUTES


=head2 C<date_issued>

C<dateIssued>

The date the ticket was issued.


A date_issued should be one of the following types:

=over

=item C<Str>

=back

=cut

has date_issued => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<issued_by>

C<issuedBy>

The organization issuing the ticket or permit.


A issued_by should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has issued_by => (
    is        => 'rw',
    predicate => 1,
);


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
);


=head2 C<ticket_number>

C<ticketNumber>

The unique identifier for the ticket.


A ticket_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has ticket_number => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<ticket_token>

C<ticketToken>

Reference to an asset (e.g., Barcode, QR code image or PDF) usable for
entrance.


A ticket_token should be one of the following types:

=over

=item C<Str>

=back

=cut

has ticket_token => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<ticketed_seat>

C<ticketedSeat>

The seat associated with the ticket.


A ticketed_seat should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Seat']>

=back

=cut

has ticketed_seat => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<total_price>

C<totalPrice>

The total price for the reservation or ticket, including applicable taxes,
shipping, etc.


A total_price should be one of the following types:

=over

=item C<Num>

=item C<InstanceOf['SemanticWeb::Schema::PriceSpecification']>

=item C<Str>

=back

=cut

has total_price => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<under_name>

C<underName>

The person or organization the reservation or ticket is for.


A under_name should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has under_name => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Ticket' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'dateIssued' => $self->curry::_serializer('date_issued'),
       'issuedBy' => $self->curry::_serializer('issued_by'),
       'priceCurrency' => $self->curry::_serializer('price_currency'),
       'ticketNumber' => $self->curry::_serializer('ticket_number'),
       'ticketToken' => $self->curry::_serializer('ticket_token'),
       'ticketedSeat' => $self->curry::_serializer('ticketed_seat'),
       'totalPrice' => $self->curry::_serializer('total_price'),
       'underName' => $self->curry::_serializer('under_name'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;