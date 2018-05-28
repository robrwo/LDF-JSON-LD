package SemanticWeb::Schema::ActivateAction;

# ABSTRACT: The act of starting or activating a device or application (e

use Moo;

extends qw/ SemanticWeb::Schema::ControlAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of starting or activating a device or application (e.g. starting a
timer or turning on a flashlight).




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'ActivateAction' }



=head1 SEE ALSO



L<SemanticWeb::Schema::ControlAction>

=cut

1;