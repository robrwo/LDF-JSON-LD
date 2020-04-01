use utf8;

package SemanticWeb::Schema::SpeakableSpecification;

# ABSTRACT: A SpeakableSpecification indicates (typically via xpath or cssSelector ) sections of a document that are highlighted as particularly speakable 

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use MooX::JSON_LD 'SpeakableSpecification';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v7.0.2';

=encoding utf8

=head1 DESCRIPTION

=begin html

<p>A SpeakableSpecification indicates (typically via <a class="localLink"
href="http://schema.org/xpath">xpath</a> or <a class="localLink"
href="http://schema.org/cssSelector">cssSelector</a>) sections of a
document that are highlighted as particularly <a class="localLink"
href="http://schema.org/speakable">speakable</a>. Instances of this type
are expected to be used primarily as values of the <a class="localLink"
href="http://schema.org/speakable">speakable</a> property.<p>

=end html




=head1 ATTRIBUTES


=head2 C<css_selector>

C<cssSelector>

=begin html

<p>A CSS selector, e.g. of a <a class="localLink"
href="http://schema.org/SpeakableSpecification">SpeakableSpecification</a>
or <a class="localLink"
href="http://schema.org/WebPageElement">WebPageElement</a>. In the latter
case, multiple matches within a page can constitute a single conceptual
"Web page element".<p>

=end html


A css_selector should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::CssSelectorType']>

=back

=head2 C<_has_css_selector>

A predicate for the L</css_selector> attribute.

=cut

has css_selector => (
    is        => 'rw',
    predicate => '_has_css_selector',
    json_ld   => 'cssSelector',
);


=head2 C<xpath>



=begin html

<p>An XPath, e.g. of a <a class="localLink"
href="http://schema.org/SpeakableSpecification">SpeakableSpecification</a>
or <a class="localLink"
href="http://schema.org/WebPageElement">WebPageElement</a>. In the latter
case, multiple matches within a page can constitute a single conceptual
"Web page element".<p>

=end html


A xpath should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::XPathType']>

=back

=head2 C<_has_xpath>

A predicate for the L</xpath> attribute.

=cut

has xpath => (
    is        => 'rw',
    predicate => '_has_xpath',
    json_ld   => 'xpath',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;
