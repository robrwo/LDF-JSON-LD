package SemanticWeb::Schema::SportsOrganization;

# ABSTRACT: Represents the collection of all sports organizations

use Moo;

extends qw/ SemanticWeb::Schema::Organization /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Represents the collection of all sports organizations, including sports
teams, governing bodies, and sports associations.




=head1 ATTRIBUTES


=head2 C<sport>



A type of sport (e.g. Baseball).


A sport should be one of the following types:

=over

=item C<Str>

=back

=cut

has sport => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'SportsOrganization' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'sport' => $self->curry::_serializer('sport'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Organization>

=cut

1;