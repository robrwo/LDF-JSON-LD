package SemanticWeb::Schema::OrganizationRole;

# ABSTRACT: A subclass of Role used to describe roles within organizations.

use Moo;

extends qw/ SemanticWeb::Schema::Role /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A subclass of Role used to describe roles within organizations.




=head1 ATTRIBUTES


=head2 C<numbered_position>

C<numberedPosition>

A number associated with a role in an organization, for example, the number
on an athlete's jersey.


A numbered_position should be one of the following types:

=over

=item C<Num>

=back

=cut

has numbered_position => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'numberedPosition',
    json_ld_serializer => \&_serialize_numbered_position,
);

sub _serialize_numbered_position { $_[0]->_serializer('numbered_position') }




around json_ld_type => sub { return 'OrganizationRole' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'numberedPosition' => \&_serialize_numbered_position,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Role>

=cut

1;