package SemanticWeb::Schema::TVClip;

# ABSTRACT: A short TV program or a segment/part of a TV program.

use Moo;

extends qw/ SemanticWeb::Schema::Clip /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A short TV program or a segment/part of a TV program.




=head1 ATTRIBUTES


=head2 C<part_of_tv_series>

C<partOfTVSeries>

The TV series to which this episode or season belongs.


A part_of_tv_series should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::TVSeries']>

=back

=cut

has part_of_tv_series => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'TVClip' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'partOfTVSeries' => $self->curry::_serializer('part_of_tv_series'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Clip>

=cut

1;