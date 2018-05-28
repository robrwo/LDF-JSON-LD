package SemanticWeb::Schema::ProgramMembership;

# ABSTRACT: Used to describe membership in a loyalty programs (e

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Used to describe membership in a loyalty programs (e.g. "StarAliance"),
traveler clubs (e.g. "AAA"), purchase clubs ("Safeway Club"), etc.




=head1 ATTRIBUTES


=head2 C<hosting_organization>

C<hostingOrganization>

The organization (airline, travelers' club, etc.) the membership is made
with.


A hosting_organization should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has hosting_organization => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<member>



A member of an Organization or a ProgramMembership. Organizations can be
members of organizations; ProgramMembership is typically for individuals.


A member should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has member => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<members>



A member of this organization.


A members should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has members => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<membership_number>

C<membershipNumber>

A unique identifier for the membership.


A membership_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has membership_number => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<program_name>

C<programName>

The program providing the membership.


A program_name should be one of the following types:

=over

=item C<Str>

=back

=cut

has program_name => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'ProgramMembership' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'hostingOrganization' => $self->curry::_serializer('hosting_organization'),
       'member' => $self->curry::_serializer('member'),
       'members' => $self->curry::_serializer('members'),
       'membershipNumber' => $self->curry::_serializer('membership_number'),
       'programName' => $self->curry::_serializer('program_name'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;