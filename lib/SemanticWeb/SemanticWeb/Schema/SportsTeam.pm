package SemanticWeb::Schema::SportsTeam;

# ABSTRACT: Organization: Sports team.

use Moo;

extends qw/ SemanticWeb::Schema::SportsOrganization /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Organization: Sports team.




=head1 ATTRIBUTES


=head2 C<athlete>



A person that acts as performing member of a sports team; a player as
opposed to a coach.


A athlete should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has athlete => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<coach>



A person that acts in a coaching role for a sports team.


A coach should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has coach => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'SportsTeam' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'athlete' => $self->curry::_serializer('athlete'),
       'coach' => $self->curry::_serializer('coach'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::SportsOrganization>

=cut

1;