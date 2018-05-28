package SemanticWeb::Schema::TransferAction;

# ABSTRACT: The act of transferring/moving (abstract or concrete) animate or inanimate objects from one place to another.

use Moo;

extends qw/ SemanticWeb::Schema::Action /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of transferring/moving (abstract or concrete) animate or inanimate
objects from one place to another.




=head1 ATTRIBUTES


=head2 C<from_location>

C<fromLocation>

A sub property of location. The original location of the object or the
agent before the action.


A from_location should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has from_location => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<to_location>

C<toLocation>

A sub property of location. The final location of the object or the agent
after the action.


A to_location should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has to_location => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'TransferAction' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'fromLocation' => $self->curry::_serializer('from_location'),
       'toLocation' => $self->curry::_serializer('to_location'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Action>

=cut

1;