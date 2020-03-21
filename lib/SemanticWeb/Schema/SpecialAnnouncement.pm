use utf8;

package SemanticWeb::Schema::SpecialAnnouncement;

# ABSTRACT: A SpecialAnnouncement combines a simple date-stamped textual information update with contextualized Web links and other structured data

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork /;


use MooX::JSON_LD 'SpecialAnnouncement';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v7.0.0';

=encoding utf8

=head1 DESCRIPTION

=begin html

<p>A SpecialAnnouncement combines a simple date-stamped textual information
update with contextualized Web links and other structured data. It
represents an information update made by a locally-oriented organization,
for example schools, pharmacies, healthcare providers, community groups,
police, local government.<br/><br/> The motivating scenario for
SpecialAnnouncement is the <a
href="https://en.wikipedia.org/wiki/2019%E2%80%9320_coronavirus_pandemic">C
oronavirus pandemic</a>, and the initial vocabulary is oriented to this
urgent situation. Schema.org expect to improve the markup iteratively as it
is deployed and as feedback emerges from use. In addition to our usual <a
href="https://github.com/schemaorg/schemaorg/issues/2490">Github entry</a>,
feedback comments can also be provided in <a
href="https://docs.google.com/document/d/1fpdFFxk8s87CWwACs53SGkYv3aafSxz_D
TtOQxMrBJQ/edit#">this document</a>.<br/><br/> While this schema is
designed to communicate urgent crisis-related information, it is not the
same as an emergency warning technology like <a
href="https://en.wikipedia.org/wiki/Common_Alerting_Protocol">CAP</a>,
although there may be overlaps. The intent is to cover the kinds of
everyday practical information being posted to existing websites during an
emergency situation.<br/><br/> Several kinds of information can be
provided:<br/><br/> We encourage the provision of "name", "text",
"datePosted", "expires" (if appropriate) and "url" as a simple baseline. It
is important to provide a value for "category" where possible, most ideally
as a well known URL from Wikipedia or Wikidata. In the case of the
2019-2020 Coronavirus pandemic, this should be
"https://en.wikipedia.org/w/index.php?title=2019-20_coronavirus_pandemic"
or "https://www.wikidata.org/wiki/Q81068910".<br/><br/> For many of the
possible properties, values can either be simple links or an inline
description, depending on whether a summary is available. For a link,
provide just the URL of the appropriate page as the property's value. For
an inline description, use a <a class="localLink"
href="http://schema.org/WebContent">WebContent</a> type, and provide the
url as a property of that, alongside at least a simple "<a
class="localLink" href="http://schema.org/text">text</a>" summary of the
page. It is unlikely that a single SpecialAnnouncement will need all of the
possible properties simultaneously. More options may be added later
if<br/><br/> We expect that in many cases the page referenced might contain
more specialized structured data, e.g. contact info, <a class="localLink"
href="http://schema.org/openingHours">openingHours</a>, <a
class="localLink" href="http://schema.org/Event">Event</a>, <a
class="localLink" href="http://schema.org/FAQPage">FAQPage</a> etc. By
linking to those pages from a <a class="localLink"
href="http://schema.org/SpecialAnnouncement">SpecialAnnouncement</a> you
can help make it clearer that the events are related to the situation (e.g.
Coronavirus) indicated by the <a class="localLink"
href="http://schema.org/category">category</a> property of the <a
class="localLink"
href="http://schema.org/SpecialAnnouncement">SpecialAnnouncement</a>.<br/><
br/> The basic content of <a class="localLink"
href="http://schema.org/SpecialAnnouncement">SpecialAnnouncement</a> is
similar to that of an <a href="https://en.wikipedia.org/wiki/RSS">RSS</a>
or <a href="https://en.wikipedia.org/wiki/Atom_(Web_standard)">Atom</a>
feed. For publishers without such feeds, basic feed-like information can be
shared by posting <a class="localLink"
href="http://schema.org/SpecialAnnouncement">SpecialAnnouncement</a>
updates in a page, e.g. using JSON-LD. For sites with Atom/RSS
functionality, you can point to a feed with the <a class="localLink"
href="http://schema.org/webFeed">webFeed</a> property. This can be a simple
URL, or an inline <a class="localLink"
href="http://schema.org/DataFeed">DataFeed</a> object, with <a
class="localLink"
href="http://schema.org/encodingFormat">encodingFormat</a> providing media
type information e.g. "application/rss+xml" or
"application/atom+xml".<br/><br/> For an announcement that is about a
place, you can use <a class="localLink"
href="http://schema.org/about">about</a> (or <a class="localLink"
href="http://schema.org/mainEntity">mainEntity</a>) to make that
relationship explicit. For example, the announcement could be "about" a new
<a class="localLink"
href="http://schema.org/CovidTestingFacility">CovidTestingFacility</a>, and
provide contact information, <a class="localLink"
href="http://schema.org/location">location</a>, <a class="localLink"
href="http://schema.org/geo">geo</a>, <a class="localLink"
href="http://schema.org/openingHours">openingHours</a> etc.<p>

=end html




=head1 ATTRIBUTES


=head2 C<category>



A category for the item. Greater signs or slashes can be used to informally
indicate a category hierarchy.


A category should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::PhysicalActivityCategory']>

=item C<InstanceOf['SemanticWeb::Schema::Thing']>

=item C<Str>

=back

=head2 C<_has_category>

A predicate for the L</category> attribute.

=cut

has category => (
    is        => 'rw',
    predicate => '_has_category',
    json_ld   => 'category',
);


=head2 C<disease_prevention_info>

C<diseasePreventionInfo>

Information about disease prevention.


A disease_prevention_info should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WebContent']>

=item C<Str>

=back

=head2 C<_has_disease_prevention_info>

A predicate for the L</disease_prevention_info> attribute.

=cut

has disease_prevention_info => (
    is        => 'rw',
    predicate => '_has_disease_prevention_info',
    json_ld   => 'diseasePreventionInfo',
);


=head2 C<disease_spread_statistics>

C<diseaseSpreadStatistics>

=begin html

<p>Statistical information about the spread of a disease, either as <a
class="localLink" href="http://schema.org/WebContent">WebContent</a>, or
described directly as a <a class="localLink"
href="http://schema.org/Dataset">Dataset</a>, or the specific <a
class="localLink" href="http://schema.org/Observation">Observation</a>s in
the dataset. When a <a class="localLink"
href="http://schema.org/WebContent">WebContent</a> URL is provided, the
page indicated might also contain more such markup.<p>

=end html


A disease_spread_statistics should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Dataset']>

=item C<InstanceOf['SemanticWeb::Schema::Observation']>

=item C<InstanceOf['SemanticWeb::Schema::WebContent']>

=item C<Str>

=back

=head2 C<_has_disease_spread_statistics>

A predicate for the L</disease_spread_statistics> attribute.

=cut

has disease_spread_statistics => (
    is        => 'rw',
    predicate => '_has_disease_spread_statistics',
    json_ld   => 'diseaseSpreadStatistics',
);


=head2 C<getting_tested_info>

C<gettingTestedInfo>

=begin html

<p>Information about getting tested (for a <a class="localLink"
href="http://schema.org/MedicalCondition">MedicalCondition</a>), e.g. in
the context of a pandemic.<p>

=end html


A getting_tested_info should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WebContent']>

=item C<Str>

=back

=head2 C<_has_getting_tested_info>

A predicate for the L</getting_tested_info> attribute.

=cut

has getting_tested_info => (
    is        => 'rw',
    predicate => '_has_getting_tested_info',
    json_ld   => 'gettingTestedInfo',
);


=head2 C<news_updates_and_guidelines>

C<newsUpdatesAndGuidelines>

=begin html

<p>Indicates a page with news updates and guidelines. This could often be
(but is not required to be) the main page containing <a class="localLink"
href="http://schema.org/SpecialAnnouncement">SpecialAnnouncement</a> markup
on a site.<p>

=end html


A news_updates_and_guidelines should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WebContent']>

=item C<Str>

=back

=head2 C<_has_news_updates_and_guidelines>

A predicate for the L</news_updates_and_guidelines> attribute.

=cut

has news_updates_and_guidelines => (
    is        => 'rw',
    predicate => '_has_news_updates_and_guidelines',
    json_ld   => 'newsUpdatesAndGuidelines',
);


=head2 C<public_transport_closures_info>

C<publicTransportClosuresInfo>

Information about public transport closures.


A public_transport_closures_info should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WebContent']>

=item C<Str>

=back

=head2 C<_has_public_transport_closures_info>

A predicate for the L</public_transport_closures_info> attribute.

=cut

has public_transport_closures_info => (
    is        => 'rw',
    predicate => '_has_public_transport_closures_info',
    json_ld   => 'publicTransportClosuresInfo',
);


=head2 C<quarantine_guidelines>

C<quarantineGuidelines>

Guidelines about quarantine rules, e.g. in the context of a pandemic.


A quarantine_guidelines should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WebContent']>

=item C<Str>

=back

=head2 C<_has_quarantine_guidelines>

A predicate for the L</quarantine_guidelines> attribute.

=cut

has quarantine_guidelines => (
    is        => 'rw',
    predicate => '_has_quarantine_guidelines',
    json_ld   => 'quarantineGuidelines',
);


=head2 C<school_closures_info>

C<schoolClosuresInfo>

Information about school closures.


A school_closures_info should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WebContent']>

=item C<Str>

=back

=head2 C<_has_school_closures_info>

A predicate for the L</school_closures_info> attribute.

=cut

has school_closures_info => (
    is        => 'rw',
    predicate => '_has_school_closures_info',
    json_ld   => 'schoolClosuresInfo',
);


=head2 C<travel_bans>

C<travelBans>

Information about travel bans, e.g. in the context of a pandemic.


A travel_bans should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::WebContent']>

=item C<Str>

=back

=head2 C<_has_travel_bans>

A predicate for the L</travel_bans> attribute.

=cut

has travel_bans => (
    is        => 'rw',
    predicate => '_has_travel_bans',
    json_ld   => 'travelBans',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;
