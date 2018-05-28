package SemanticWeb::Schema::WearAction;

# ABSTRACT: The act of dressing oneself in clothing.

use Moo;

extends qw/ SemanticWeb::Schema::UseAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of dressing oneself in clothing.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'WearAction' }



=head1 SEE ALSO



L<SemanticWeb::Schema::UseAction>

=cut

1;