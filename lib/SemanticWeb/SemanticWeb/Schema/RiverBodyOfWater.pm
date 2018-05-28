package SemanticWeb::Schema::RiverBodyOfWater;

# ABSTRACT: A river (for example

use Moo;

extends qw/ SemanticWeb::Schema::BodyOfWater /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A river (for example, the broad majestic Shannon).




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'RiverBodyOfWater' }



=head1 SEE ALSO



L<SemanticWeb::Schema::BodyOfWater>

=cut

1;