package SemanticWeb::Schema::FinancialProduct;

# ABSTRACT: A product provided to consumers and businesses by financial institutions such as banks

use Moo;

extends qw/ SemanticWeb::Schema::Service /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A product provided to consumers and businesses by financial institutions
such as banks, insurance companies, brokerage firms, consumer finance
companies, and investment companies which comprise the financial services
industry.




=head1 ATTRIBUTES


=head2 C<annual_percentage_rate>

C<annualPercentageRate>

The annual rate that is charged for borrowing (or made by investing),
expressed as a single percentage number that represents the actual yearly
cost of funds over the term of a loan. This includes any fees or additional
costs associated with the transaction.


A annual_percentage_rate should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=item C<Num>

=back

=cut

has annual_percentage_rate => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<fees_and_commissions_specification>

C<feesAndCommissionsSpecification>

Description of fees, commissions, and other terms applied either to a class
of financial product, or by a financial service organization.


A fees_and_commissions_specification should be one of the following types:

=over

=item C<Str>

=back

=cut

has fees_and_commissions_specification => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<interest_rate>

C<interestRate>

The interest rate, charged or paid, applicable to the financial product.
Note: This is different from the calculated annualPercentageRate.


A interest_rate should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=item C<Num>

=back

=cut

has interest_rate => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'FinancialProduct' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'annualPercentageRate' => $self->curry::_serializer('annual_percentage_rate'),
       'feesAndCommissionsSpecification' => $self->curry::_serializer('fees_and_commissions_specification'),
       'interestRate' => $self->curry::_serializer('interest_rate'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Service>

=cut

1;