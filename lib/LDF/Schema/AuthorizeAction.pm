package LDF::Schema::AuthorizeAction;

# ABSTRACT: The act of granting permission to an object.

use Moo;

extends qw/ LDF::Schema::AllocateAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of granting permission to an object.




=head1 ATTRIBUTES


=head2 C<recipient>



A sub property of participant. The participant who is at the receiving end
of the action.


A recipient should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::ContactPoint']>

=item C<InstanceOf['LDF::Schema::Organization']>

=item C<InstanceOf['LDF::Schema::Audience']>

=item C<InstanceOf['LDF::Schema::Person']>

=back

=cut

has recipient => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'AuthorizeAction' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'recipient' => $self->curry::_serializer('recipient'),
    } ]
};




=head1 SEE ALSO



L<LDF::Schema::AllocateAction>

=cut

1;
