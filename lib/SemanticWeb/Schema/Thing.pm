package SemanticWeb::Schema::Thing;

# ABSTRACT: The most generic type of item.

use Moo;

extends qw/ SemanticWeb::Schema /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The most generic type of item.




=head1 ATTRIBUTES


=head2 C<additional_type>

C<additionalType>

An additional type for the item, typically used for adding more specific
types from external vocabularies in microdata syntax. This is a
relationship between something and a class that the thing is in. In RDFa
syntax, it is better to use the native RDFa syntax - the 'typeof' attribute
- for multiple types. Schema.org tools may have only weaker understanding
of extra types, in particular those defined externally.


A additional_type should be one of the following types:

=over

=item C<Str>

=back

=cut

has additional_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'additionalType',
    json_ld_serializer => \&_serialize_additional_type,
);

sub _serialize_additional_type { $_[0]->_serializer('additional_type') }


=head2 C<alternate_name>

C<alternateName>

An alias for the item.


A alternate_name should be one of the following types:

=over

=item C<Str>

=back

=cut

has alternate_name => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'alternateName',
    json_ld_serializer => \&_serialize_alternate_name,
);

sub _serialize_alternate_name { $_[0]->_serializer('alternate_name') }


=head2 C<description>



A description of the item.


A description should be one of the following types:

=over

=item C<Str>

=back

=cut

has description => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'description',
    json_ld_serializer => \&_serialize_description,
);

sub _serialize_description { $_[0]->_serializer('description') }


=head2 C<disambiguating_description>

C<disambiguatingDescription>

A sub property of description. A short description of the item used to
disambiguate from other, similar items. Information from other properties
(in particular, name) may be necessary for the description to be useful for
disambiguation.


A disambiguating_description should be one of the following types:

=over

=item C<Str>

=back

=cut

has disambiguating_description => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'disambiguatingDescription',
    json_ld_serializer => \&_serialize_disambiguating_description,
);

sub _serialize_disambiguating_description { $_[0]->_serializer('disambiguating_description') }


=head2 C<identifier>



=begin html

The identifier property represents any kind of identifier for any kind of
<a class="localLink" href="http://schema.org/Thing">Thing</a>, such as
ISBNs, GTIN codes, UUIDs etc. Schema.org provides dedicated properties for
representing many of these, either as textual strings or as URL (URI)
links. See <a href="/docs/datamodel.html#identifierBg">background notes</a>
for more details.

=end html


A identifier should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::PropertyValue']>

=back

=cut

has identifier => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'identifier',
    json_ld_serializer => \&_serialize_identifier,
);

sub _serialize_identifier { $_[0]->_serializer('identifier') }


=head2 C<image>



=begin html

An image of the item. This can be a <a class="localLink"
href="http://schema.org/URL">URL</a> or a fully described <a
class="localLink" href="http://schema.org/ImageObject">ImageObject</a>.

=end html


A image should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ImageObject']>

=item C<Str>

=back

=cut

has image => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'image',
    json_ld_serializer => \&_serialize_image,
);

sub _serialize_image { $_[0]->_serializer('image') }


=head2 C<main_entity_of_page>

C<mainEntityOfPage>

=begin html

Indicates a page (or other CreativeWork) for which this thing is the main
entity being described. See <a
href="/docs/datamodel.html#mainEntityBackground">background notes</a> for
details.

=end html


A main_entity_of_page should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::CreativeWork']>

=back

=cut

has main_entity_of_page => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'mainEntityOfPage',
    json_ld_serializer => \&_serialize_main_entity_of_page,
);

sub _serialize_main_entity_of_page { $_[0]->_serializer('main_entity_of_page') }


=head2 C<name>



The name of the item.


A name should be one of the following types:

=over

=item C<Str>

=back

=cut

has name => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'name',
    json_ld_serializer => \&_serialize_name,
);

sub _serialize_name { $_[0]->_serializer('name') }


=head2 C<potential_action>

C<potentialAction>

Indicates a potential Action, which describes an idealized action in which
this thing would play an 'object' role.


A potential_action should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Action']>

=back

=cut

has potential_action => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'potentialAction',
    json_ld_serializer => \&_serialize_potential_action,
);

sub _serialize_potential_action { $_[0]->_serializer('potential_action') }


=head2 C<same_as>

C<sameAs>

URL of a reference Web page that unambiguously indicates the item's
identity. E.g. the URL of the item's Wikipedia page, Wikidata entry, or
official website.


A same_as should be one of the following types:

=over

=item C<Str>

=back

=cut

has same_as => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'sameAs',
    json_ld_serializer => \&_serialize_same_as,
);

sub _serialize_same_as { $_[0]->_serializer('same_as') }


=head2 C<url>



URL of the item.


A url should be one of the following types:

=over

=item C<Str>

=back

=cut

has url => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'url',
    json_ld_serializer => \&_serialize_url,
);

sub _serialize_url { $_[0]->_serializer('url') }




around json_ld_type => sub { return 'Thing' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'additionalType' => \&_serialize_additional_type,
       'alternateName' => \&_serialize_alternate_name,
       'description' => \&_serialize_description,
       'disambiguatingDescription' => \&_serialize_disambiguating_description,
       'identifier' => \&_serialize_identifier,
       'image' => \&_serialize_image,
       'mainEntityOfPage' => \&_serialize_main_entity_of_page,
       'name' => \&_serialize_name,
       'potentialAction' => \&_serialize_potential_action,
       'sameAs' => \&_serialize_same_as,
       'url' => \&_serialize_url,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema>

=cut

1;
