package SemanticWeb::Schema::DrawAction;

# ABSTRACT: The act of producing a visual/graphical representation of an object

use Moo;

extends qw/ SemanticWeb::Schema::CreateAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of producing a visual/graphical representation of an object,
typically with a pen/pencil and paper as instruments.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'DrawAction' }



=head1 SEE ALSO



L<SemanticWeb::Schema::CreateAction>

=cut

1;