package SemanticWeb::Schema::ShareAction;

# ABSTRACT: The act of distributing content to people for their amusement or edification.

use Moo;

extends qw/ SemanticWeb::Schema::CommunicateAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of distributing content to people for their amusement or
edification.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'ShareAction' }



=head1 SEE ALSO



L<SemanticWeb::Schema::CommunicateAction>

=cut

1;