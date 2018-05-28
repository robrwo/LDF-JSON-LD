package SemanticWeb::Schema::AssignAction;

# ABSTRACT: The act of allocating an action/event/task to some destination (someone or something).

use Moo;

extends qw/ SemanticWeb::Schema::AllocateAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of allocating an action/event/task to some destination (someone or
something).




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'AssignAction' }



=head1 SEE ALSO



L<SemanticWeb::Schema::AllocateAction>

=cut

1;