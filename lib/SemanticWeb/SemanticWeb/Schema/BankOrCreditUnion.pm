package SemanticWeb::Schema::BankOrCreditUnion;

# ABSTRACT: Bank or credit union.

use Moo;

extends qw/ SemanticWeb::Schema::FinancialService /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Bank or credit union.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'BankOrCreditUnion' }



=head1 SEE ALSO



L<SemanticWeb::Schema::FinancialService>

=cut

1;