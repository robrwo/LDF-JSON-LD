package SemanticWeb::Schema::RadioChannel;

# ABSTRACT: A unique instance of a radio BroadcastService on a CableOrSatelliteService lineup.

use Moo;

extends qw/ SemanticWeb::Schema::BroadcastChannel /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A unique instance of a radio BroadcastService on a CableOrSatelliteService
lineup.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'RadioChannel' }



=head1 SEE ALSO



L<SemanticWeb::Schema::BroadcastChannel>

=cut

1;