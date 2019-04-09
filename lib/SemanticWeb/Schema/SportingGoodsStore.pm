use utf8;

package SemanticWeb::Schema::SportingGoodsStore;

# ABSTRACT: A sporting goods store.

use Moo;

extends qw/ SemanticWeb::Schema::Store /;


use MooX::JSON_LD 'SportingGoodsStore';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.5.0';

=encoding utf8

=head1 DESCRIPTION

A sporting goods store.




=cut


=head1 SEE ALSO



L<SemanticWeb::Schema::Store>

=cut

1;
