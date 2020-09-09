use utf8;

package SemanticWeb::Schema::TouristAttraction;

# ABSTRACT: A tourist attraction

use Moo;

extends qw/ SemanticWeb::Schema::Place /;


use MooX::JSON_LD 'TouristAttraction';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v10.0.1';

=encoding utf8

=head1 DESCRIPTION

=begin html

<p>A tourist attraction. In principle any Thing can be a <a
class="localLink"
href="http://schema.org/TouristAttraction">TouristAttraction</a>, from a <a
class="localLink" href="http://schema.org/Mountain">Mountain</a> and <a
class="localLink"
href="http://schema.org/LandmarksOrHistoricalBuildings">LandmarksOrHistoric
alBuildings</a> to a <a class="localLink"
href="http://schema.org/LocalBusiness">LocalBusiness</a>. This Type can be
used on its own to describe a general <a class="localLink"
href="http://schema.org/TouristAttraction">TouristAttraction</a>, or be
used as an <a class="localLink"
href="http://schema.org/additionalType">additionalType</a> to add tourist
attraction properties to any other type. (See examples below)<p>

=end html




=head1 ATTRIBUTES


=head2 C<available_language>

C<availableLanguage>

=begin html

<p>A language someone may use with or at the item, service or place. Please
use one of the language codes from the <a
href="http://tools.ietf.org/html/bcp47">IETF BCP 47 standard</a>. See also
<a class="localLink" href="http://schema.org/inLanguage">inLanguage</a><p>

=end html


A available_language should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Language']>

=item C<Str>

=back

=head2 C<_has_available_language>

A predicate for the L</available_language> attribute.

=cut

has available_language => (
    is        => 'rw',
    predicate => '_has_available_language',
    json_ld   => 'availableLanguage',
);


=head2 C<tourist_type>

C<touristType>

Attraction suitable for type(s) of tourist. eg. Children, visitors from a
particular country, etc.


A tourist_type should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Audience']>

=item C<Str>

=back

=head2 C<_has_tourist_type>

A predicate for the L</tourist_type> attribute.

=cut

has tourist_type => (
    is        => 'rw',
    predicate => '_has_tourist_type',
    json_ld   => 'touristType',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Place>

=cut

1;
