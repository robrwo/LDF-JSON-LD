package LDF::Schema::ContactPage;

# ABSTRACT: Web page type: Contact page.

use Moo;

extends qw/ LDF::Schema::WebPage /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Web page type: Contact page.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'ContactPage' }



=head1 SEE ALSO



L<LDF::Schema::WebPage>

=cut

1;
