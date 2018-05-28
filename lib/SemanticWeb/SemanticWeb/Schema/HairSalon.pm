package SemanticWeb::Schema::HairSalon;

# ABSTRACT: A hair salon.

use Moo;

extends qw/ SemanticWeb::Schema::HealthAndBeautyBusiness /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A hair salon.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'HairSalon' }



=head1 SEE ALSO



L<SemanticWeb::Schema::HealthAndBeautyBusiness>

=cut

1;