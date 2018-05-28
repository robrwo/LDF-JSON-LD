package SemanticWeb::Schema::OnDemandEvent;

# ABSTRACT: A publication event e

use Moo;

extends qw/ SemanticWeb::Schema::PublicationEvent /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A publication event e.g. catch-up TV or radio podcast, during which a
program is available on-demand.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'OnDemandEvent' }



=head1 SEE ALSO



L<SemanticWeb::Schema::PublicationEvent>

=cut

1;