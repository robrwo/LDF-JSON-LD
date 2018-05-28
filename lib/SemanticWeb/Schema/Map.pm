package SemanticWeb::Schema::Map;

# ABSTRACT: A map.

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A map.




=head1 ATTRIBUTES


=head2 C<map_type>

C<mapType>

Indicates the kind of Map, from the MapCategoryType Enumeration.


A map_type should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MapCategoryType']>

=back

=cut

has map_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'mapType',
    json_ld_serializer => \&_serialize_map_type,
);

sub _serialize_map_type { $_[0]->_serializer('map_type') }




around json_ld_type => sub { return 'Map' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'mapType' => \&_serialize_map_type,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;
