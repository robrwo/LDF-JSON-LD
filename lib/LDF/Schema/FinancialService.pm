package LDF::Schema::FinancialService;

# ABSTRACT: Financial services business.

use Moo;

extends qw/ LDF::Schema::LocalBusiness /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Financial services business.




=head1 ATTRIBUTES


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




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'FinancialService' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'feesAndCommissionsSpecification' => $self->curry::_serializer('fees_and_commissions_specification'),
    } ]
};




=head1 SEE ALSO



L<LDF::Schema::LocalBusiness>

=cut

1;
