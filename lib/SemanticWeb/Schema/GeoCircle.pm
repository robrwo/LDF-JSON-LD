package SemanticWeb::Schema::GeoCircle;

# ABSTRACT: A GeoCircle is a GeoShape representing a circular geographic area

use Moo;

extends qw/ SemanticWeb::Schema::GeoShape /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A GeoCircle is a GeoShape representing a circular geographic area. As it is
a GeoShape it provides the simple textual property 'circle', but also
allows the combination of postalCode alongside geoRadius. The center of the
circle can be indicated via the 'geoMidpoint' property, or more
approximately using 'address', 'postalCode'.




=head1 ATTRIBUTES


=head2 C<geo_midpoint>

C<geoMidpoint>

Indicates the GeoCoordinates at the centre of a GeoShape e.g. GeoCircle.


A geo_midpoint should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::GeoCoordinates']>

=back

=cut

has geo_midpoint => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'geoMidpoint',
    json_ld_serializer => \&_serialize_geo_midpoint,
);

sub _serialize_geo_midpoint { $_[0]->_serializer('geo_midpoint') }


=head2 C<geo_radius>

C<geoRadius>

Indicates the approximate radius of a GeoCircle (metres unless indicated
otherwise via Distance notation).


A geo_radius should be one of the following types:

=over

=item C<Num>

=item C<InstanceOf['SemanticWeb::Schema::Distance']>

=item C<Str>

=back

=cut

has geo_radius => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'geoRadius',
    json_ld_serializer => \&_serialize_geo_radius,
);

sub _serialize_geo_radius { $_[0]->_serializer('geo_radius') }




around json_ld_type => sub { return 'GeoCircle' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'geoMidpoint' => \&_serialize_geo_midpoint,
       'geoRadius' => \&_serialize_geo_radius,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::GeoShape>

=cut

1;