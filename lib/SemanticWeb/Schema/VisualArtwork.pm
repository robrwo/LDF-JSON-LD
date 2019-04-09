use utf8;

package SemanticWeb::Schema::VisualArtwork;

# ABSTRACT: A work of art that is primarily visual in character.

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork /;


use MooX::JSON_LD 'VisualArtwork';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.1.0';

=encoding utf8

=head1 DESCRIPTION

A work of art that is primarily visual in character.




=head1 ATTRIBUTES


=head2 C<art_edition>

C<artEdition>

The number of copies when multiple copies of a piece of artwork are
produced - e.g. for a limited edition of 20 prints, 'artEdition' refers to
the total number of copies (in this example "20").


A art_edition should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::Integer']>

=back

=cut

has art_edition => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'artEdition',
);


=head2 C<art_medium>

C<artMedium>

The material used. (e.g. Oil, Watercolour, Acrylic, Linoprint, Marble,
Cyanotype, Digital, Lithograph, DryPoint, Intaglio, Pastel, Woodcut,
Pencil, Mixed Media, etc.)


A art_medium should be one of the following types:

=over

=item C<Str>

=back

=cut

has art_medium => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'artMedium',
);


=head2 C<artform>



e.g. Painting, Drawing, Sculpture, Print, Photograph, Assemblage, Collage,
etc.


A artform should be one of the following types:

=over

=item C<Str>

=back

=cut

has artform => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'artform',
);


=head2 C<artwork_surface>

C<artworkSurface>

The supporting materials for the artwork, e.g. Canvas, Paper, Wood, Board,
etc.


A artwork_surface should be one of the following types:

=over

=item C<Str>

=back

=cut

has artwork_surface => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'artworkSurface',
);


=head2 C<depth>



The depth of the item.


A depth should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Distance']>

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has depth => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'depth',
);


=head2 C<height>



The height of the item.


A height should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=item C<InstanceOf['SemanticWeb::Schema::Distance']>

=back

=cut

has height => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'height',
);


=head2 C<surface>



A material used as a surface in some artwork, e.g. Canvas, Paper, Wood,
Board, etc.


A surface should be one of the following types:

=over

=item C<Str>

=back

=cut

has surface => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'surface',
);


=head2 C<width>



The width of the item.


A width should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=item C<InstanceOf['SemanticWeb::Schema::Distance']>

=back

=cut

has width => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'width',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;
