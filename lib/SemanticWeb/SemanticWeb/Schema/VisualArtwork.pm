package SemanticWeb::Schema::VisualArtwork;

# ABSTRACT: A work of art that is primarily visual in character.

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

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

=item C<InstanceOf['SemanticWeb::Schema::Integer']>

=item C<Str>

=back

=cut

has art_edition => (
    is        => 'rw',
    predicate => 1,
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
);


=head2 C<depth>



The depth of the item.


A depth should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=item C<InstanceOf['SemanticWeb::Schema::Distance']>

=back

=cut

has depth => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<height>



The height of the item.


A height should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Distance']>

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has height => (
    is        => 'rw',
    predicate => 1,
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
);


=head2 C<width>



The width of the item.


A width should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Distance']>

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=back

=cut

has width => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'VisualArtwork' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'artEdition' => $self->curry::_serializer('art_edition'),
       'artMedium' => $self->curry::_serializer('art_medium'),
       'artform' => $self->curry::_serializer('artform'),
       'artworkSurface' => $self->curry::_serializer('artwork_surface'),
       'depth' => $self->curry::_serializer('depth'),
       'height' => $self->curry::_serializer('height'),
       'surface' => $self->curry::_serializer('surface'),
       'width' => $self->curry::_serializer('width'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;