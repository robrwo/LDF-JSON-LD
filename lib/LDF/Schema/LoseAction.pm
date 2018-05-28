package LDF::Schema::LoseAction;

# ABSTRACT: The act of being defeated in a competitive activity.

use Moo;

extends qw/ LDF::Schema::AchieveAction /;


use curry;
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

=item C<InstanceOf['LDF::Schema::Person']>

=back

=cut

has winner => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'LoseAction' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'winner' => $self->curry::_serializer('winner'),
    } ]
};




=head1 SEE ALSO



L<LDF::Schema::AchieveAction>

=cut

1;
