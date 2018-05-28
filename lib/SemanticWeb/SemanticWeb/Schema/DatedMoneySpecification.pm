package SemanticWeb::Schema::DatedMoneySpecification;

# ABSTRACT: A DatedMoneySpecification represents monetary values with optional start and end dates

use Moo;

extends qw/ SemanticWeb::Schema::StructuredValue /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

A DatedMoneySpecification represents monetary values with optional start
and end dates. For example, this could represent an employee's salary over
a specific period of time. <strong>Note:</strong> This type has been
superseded by <a class="localLink"
href="http://schema.org/MonetaryAmount">MonetaryAmount</a> use of that type
is recommended

=end html




=head1 ATTRIBUTES


=head2 C<amount>



The amount of money.


A amount should be one of the following types:

=over

=item C<Num>

=item C<InstanceOf['SemanticWeb::Schema::MonetaryAmount']>

=back

=cut

has amount => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<currency>



=begin html

The currency in which the monetary amount is expressed (in 3-letter <a
href="http://en.wikipedia.org/wiki/ISO_4217">ISO 4217</a> format).

=end html


A currency should be one of the following types:

=over

=item C<Str>

=back

=cut

has currency => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<end_date>

C<endDate>

=begin html

The end date and time of the item (in <a
href="http://en.wikipedia.org/wiki/ISO_8601">ISO 8601 date format</a>).

=end html


A end_date should be one of the following types:

=over

=item C<Str>

=back

=cut

has end_date => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<start_date>

C<startDate>

=begin html

The start date and time of the item (in <a
href="http://en.wikipedia.org/wiki/ISO_8601">ISO 8601 date format</a>).

=end html


A start_date should be one of the following types:

=over

=item C<Str>

=back

=cut

has start_date => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'DatedMoneySpecification' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'amount' => $self->curry::_serializer('amount'),
       'currency' => $self->curry::_serializer('currency'),
       'endDate' => $self->curry::_serializer('end_date'),
       'startDate' => $self->curry::_serializer('start_date'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::StructuredValue>

=cut

1;