package SemanticWeb::Schema::Church;

# ABSTRACT: A church.

use Moo;

extends qw/ SemanticWeb::Schema::PlaceOfWorship /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A church.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Church' }



=head1 SEE ALSO



L<SemanticWeb::Schema::PlaceOfWorship>

=cut

1;