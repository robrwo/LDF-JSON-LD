package SemanticWeb::Schema::RsvpAction;

# ABSTRACT: The act of notifying an event organizer as to whether you expect to attend the event.

use Moo;

extends qw/ SemanticWeb::Schema::InformAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of notifying an event organizer as to whether you expect to attend
the event.




=head1 ATTRIBUTES


=head2 C<additional_number_of_guests>

C<additionalNumberOfGuests>

If responding yes, the number of guests who will attend in addition to the
invitee.


A additional_number_of_guests should be one of the following types:

=over

=item C<Num>

=back

=cut

has additional_number_of_guests => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'additionalNumberOfGuests',
    json_ld_serializer => \&_serialize_additional_number_of_guests,
);

sub _serialize_additional_number_of_guests { $_[0]->_serializer('additional_number_of_guests') }


=head2 C<comment>



Comments, typically from users.


A comment should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Comment']>

=back

=cut

has comment => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'comment',
    json_ld_serializer => \&_serialize_comment,
);

sub _serialize_comment { $_[0]->_serializer('comment') }


=head2 C<rsvp_response>

C<rsvpResponse>

The response (yes, no, maybe) to the RSVP.


A rsvp_response should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::RsvpResponseType']>

=back

=cut

has rsvp_response => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'rsvpResponse',
    json_ld_serializer => \&_serialize_rsvp_response,
);

sub _serialize_rsvp_response { $_[0]->_serializer('rsvp_response') }




around json_ld_type => sub { return 'RsvpAction' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'additionalNumberOfGuests' => \&_serialize_additional_number_of_guests,
       'comment' => \&_serialize_comment,
       'rsvpResponse' => \&_serialize_rsvp_response,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::InformAction>

=cut

1;
