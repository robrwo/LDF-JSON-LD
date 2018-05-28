package SemanticWeb::Schema::Resort;

# ABSTRACT: A resort is a place used for relaxation or recreation

use Moo;

extends qw/ SemanticWeb::Schema::LodgingBusiness /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

A resort is a place used for relaxation or recreation, attracting visitors
for holidays or vacations. Resorts are places, towns or sometimes
commercial establishment operated by a single company (Source: Wikipedia,
the free encyclopedia, see <a
href="http://en.wikipedia.org/wiki/Resort">http://en.wikipedia.org/wiki/Res
ort</a>). <br /><br /> See also the <a href="/docs/hotels.html">dedicated
document on the use of schema.org for marking up hotels and other forms of
accommodations</a>.

=end html




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Resort' }



=head1 SEE ALSO



L<SemanticWeb::Schema::LodgingBusiness>

=cut

1;