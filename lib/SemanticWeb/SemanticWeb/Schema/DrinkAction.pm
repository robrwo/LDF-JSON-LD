package SemanticWeb::Schema::DrinkAction;

# ABSTRACT: The act of swallowing liquids.

use Moo;

extends qw/ SemanticWeb::Schema::ConsumeAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of swallowing liquids.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'DrinkAction' }



=head1 SEE ALSO



L<SemanticWeb::Schema::ConsumeAction>

=cut

1;