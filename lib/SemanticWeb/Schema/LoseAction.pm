package SemanticWeb::Schema::LoseAction;

# ABSTRACT: The act of being defeated in a competitive activity.

use Moo;

extends qw/ SemanticWeb::Schema::AchieveAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of being defeated in a competitive activity.




=head1 ATTRIBUTES


=head2 C<winner>



A sub property of participant. The winner of the action.


A winner should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has winner => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'winner',
    json_ld_serializer => \&_serialize_winner,
);

sub _serialize_winner { $_[0]->_serializer('winner') }




around json_ld_type => sub { return 'LoseAction' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'winner' => \&_serialize_winner,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::AchieveAction>

=cut

1;