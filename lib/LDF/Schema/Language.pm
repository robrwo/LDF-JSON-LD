package LDF::Schema::Language;

# ABSTRACT: Natural languages such as Spanish

use Moo;

extends qw/ LDF::Schema::Intangible /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

Natural languages such as Spanish, Tamil, Hindi, English, etc. Formal
language code tags expressed in <a
href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP 47</a> can be
used via the <a class="localLink"
href="http://schema.org/alternateName">alternateName</a> property. The
Language type previously also covered programming languages such as Scheme
and Lisp, which are now best represented using <a class="localLink"
href="http://schema.org/ComputerLanguage">ComputerLanguage</a>.

=end html



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Language' }



=head1 SEE ALSO



L<LDF::Schema::Intangible>

=cut

1;