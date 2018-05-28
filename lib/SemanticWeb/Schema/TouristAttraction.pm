package SemanticWeb::Schema::TouristAttraction;

# ABSTRACT: A tourist attraction

use Moo;

extends qw/ SemanticWeb::Schema::Place /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

A tourist attraction. In principle any Thing can be a <a class="localLink"
href="http://schema.org/TouristAttraction">TouristAttraction</a>, from a <a
class="localLink" href="http://schema.org/Mountain">Mountain</a> and <a
class="localLink"
href="http://schema.org/LandmarksOrHistoricalBuildings">LandmarksOrHistoric
alBuildings</a> to a <a class="localLink"
href="http://schema.org/LocalBusiness">LocalBusiness</a>. This Type can be
used on its own to describe a general <a class="localLink"
href="http://schema.org/TourstAttraction">TourstAttraction</a>, or be used
as an <a class="localLink"
href="http://schema.org/additionalType">additionalType</a> to add tourist
attraction properties to any other type. (See examples below)

=end html




=head1 ATTRIBUTES


=head2 C<available_language>

C<availableLanguage>

=begin html

A language someone may use with or at the item, service or place. Please
use one of the language codes from the <a
href="http://tools.ietf.org/html/bcp47">IETF BCP 47 standard</a>. See also
<a class="localLink" href="http://schema.org/inLanguage">inLanguage</a>

=end html


A available_language should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::Language']>

=back

=cut

has available_language => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'availableLanguage',
    json_ld_serializer => \&_serialize_available_language,
);

sub _serialize_available_language { $_[0]->_serializer('available_language') }


=head2 C<tourist_type>

C<touristType>

Attraction suitable for type(s) of tourist. eg. Children, visitors from a
particular country, etc.


A tourist_type should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Audience']>

=item C<Str>

=back

=cut

has tourist_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'touristType',
    json_ld_serializer => \&_serialize_tourist_type,
);

sub _serialize_tourist_type { $_[0]->_serializer('tourist_type') }




around json_ld_type => sub { return 'TouristAttraction' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'availableLanguage' => \&_serialize_available_language,
       'touristType' => \&_serialize_tourist_type,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Place>

=cut

1;