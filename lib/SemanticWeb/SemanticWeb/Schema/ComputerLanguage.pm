package SemanticWeb::Schema::ComputerLanguage;

# ABSTRACT: This type covers computer programming languages such as Scheme and Lisp

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

This type covers computer programming languages such as Scheme and Lisp, as
well as other language-like computer representations. Natural languages are
best represented with the <a class="localLink"
href="http://schema.org/Language">Language</a> type.

=end html




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'ComputerLanguage' }



=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;