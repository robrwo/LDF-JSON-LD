use utf8;

package SemanticWeb::Schema::Restaurant;

# ABSTRACT: A restaurant.

use Moo;

extends qw/ SemanticWeb::Schema::FoodEstablishment /;


use MooX::JSON_LD 'Restaurant';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.9.0';

=encoding utf8

=head1 DESCRIPTION

A restaurant.




=cut


=head1 SEE ALSO



L<SemanticWeb::Schema::FoodEstablishment>

=cut

1;
