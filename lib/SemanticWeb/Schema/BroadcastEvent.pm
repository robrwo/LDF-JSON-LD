package SemanticWeb::Schema::BroadcastEvent;

# ABSTRACT: An over the air or online broadcast event.

use Moo;

extends qw/ SemanticWeb::Schema::PublicationEvent /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An over the air or online broadcast event.




=head1 ATTRIBUTES


=head2 C<broadcast_of_event>

C<broadcastOfEvent>

The event being broadcast such as a sporting event or awards ceremony.


A broadcast_of_event should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Event']>

=back

=cut

has broadcast_of_event => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'broadcastOfEvent',
    json_ld_serializer => \&_serialize_broadcast_of_event,
);

sub _serialize_broadcast_of_event { $_[0]->_serializer('broadcast_of_event') }


=head2 C<is_live_broadcast>

C<isLiveBroadcast>

True is the broadcast is of a live event.


A is_live_broadcast should be one of the following types:

=over

=item C<Bool>

=back

=cut

has is_live_broadcast => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'isLiveBroadcast',
    json_ld_serializer => \&_serialize_is_live_broadcast,
);

sub _serialize_is_live_broadcast { $_[0]->_serializer('is_live_broadcast') }


=head2 C<video_format>

C<videoFormat>

The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD,
etc.).


A video_format should be one of the following types:

=over

=item C<Str>

=back

=cut

has video_format => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'videoFormat',
    json_ld_serializer => \&_serialize_video_format,
);

sub _serialize_video_format { $_[0]->_serializer('video_format') }




around json_ld_type => sub { return 'BroadcastEvent' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'broadcastOfEvent' => \&_serialize_broadcast_of_event,
       'isLiveBroadcast' => \&_serialize_is_live_broadcast,
       'videoFormat' => \&_serialize_video_format,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::PublicationEvent>

=cut

1;