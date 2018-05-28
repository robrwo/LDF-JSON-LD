package SemanticWeb::Schema::Audience;

# ABSTRACT: Intended audience for an item, i

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Intended audience for an item, i.e. the group for whom the item was
created.




=head1 ATTRIBUTES


=head2 C<audience_type>

C<audienceType>

The target group associated with a given audience (e.g. veterans, car
owners, musicians, etc.).


A audience_type should be one of the following types:

=over

=item C<Str>

=back

=cut

has audience_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'audienceType',
    json_ld_serializer => \&_serialize_audience_type,
);

sub _serialize_audience_type { $_[0]->_serializer('audience_type') }


=head2 C<geographic_area>

C<geographicArea>

The geographic area associated with the audience.


A geographic_area should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::AdministrativeArea']>

=back

=cut

has geographic_area => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'geographicArea',
    json_ld_serializer => \&_serialize_geographic_area,
);

sub _serialize_geographic_area { $_[0]->_serializer('geographic_area') }




around json_ld_type => sub { return 'Audience' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'audienceType' => \&_serialize_audience_type,
       'geographicArea' => \&_serialize_geographic_area,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;