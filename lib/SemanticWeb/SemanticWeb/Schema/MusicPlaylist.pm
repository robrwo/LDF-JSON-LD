package SemanticWeb::Schema::MusicPlaylist;

# ABSTRACT: A collection of music tracks in playlist form.

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A collection of music tracks in playlist form.




=head1 ATTRIBUTES


=head2 C<num_tracks>

C<numTracks>

The number of tracks in this album or playlist.


A num_tracks should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Integer']>

=back

=cut

has num_tracks => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<track>



A music recording (track)&#x2014;usually a single song. If an ItemList is
given, the list should contain items of type MusicRecording.


A track should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MusicRecording']>

=item C<InstanceOf['SemanticWeb::Schema::ItemList']>

=back

=cut

has track => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<tracks>



A music recording (track)&#x2014;usually a single song.


A tracks should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MusicRecording']>

=back

=cut

has tracks => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'MusicPlaylist' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'numTracks' => $self->curry::_serializer('num_tracks'),
       'track' => $self->curry::_serializer('track'),
       'tracks' => $self->curry::_serializer('tracks'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;