package SemanticWeb::Schema::InvestmentOrDeposit;

# ABSTRACT: A type of financial product that typically requires the client to transfer funds to a financial service in return for potential beneficial financial return.

use Moo;

extends qw/ SemanticWeb::Schema::FinancialProduct /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A type of financial product that typically requires the client to transfer
funds to a financial service in return for potential beneficial financial
return.




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
    json_ld   => 'amount',
    json_ld_serializer => \&_serialize_amount,
);

sub _serialize_amount { $_[0]->_serializer('amount') }




around json_ld_type => sub { return 'InvestmentOrDeposit' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'amount' => \&_serialize_amount,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::FinancialProduct>

=cut

1;