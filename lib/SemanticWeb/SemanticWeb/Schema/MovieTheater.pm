package SemanticWeb::Schema::MovieTheater;

# ABSTRACT: A movie theater.

use Moo;

extends qw/ SemanticWeb::Schema::EntertainmentBusiness SemanticWeb::Schema::CivicStructure /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A movie theater.




=head1 ATTRIBUTES


=head2 C<screen_count>

C<screenCount>

The number of screens in the movie theater.


A screen_count should be one of the following types:

=over

=item C<Num>

=back

=cut

has screen_count => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'MovieTheater' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'screenCount' => $self->curry::_serializer('screen_count'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::CivicStructure>

=cut

1;