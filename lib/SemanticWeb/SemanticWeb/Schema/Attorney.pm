package SemanticWeb::Schema::Attorney;

# ABSTRACT: Professional service: Attorney

use Moo;

extends qw/ SemanticWeb::Schema::LegalService /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

Professional service: Attorney. </p> <p>This type is deprecated - <a
class="localLink" href="http://schema.org/LegalService">LegalService</a> is
more inclusive and less ambiguous.

=end html




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Attorney' }



=head1 SEE ALSO



L<SemanticWeb::Schema::LegalService>

=cut

1;