package SemanticWeb::Schema::TVSeason;

# ABSTRACT: Season dedicated to TV broadcast and associated online delivery.

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWorkSeason SemanticWeb::Schema::CreativeWork /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Season dedicated to TV broadcast and associated online delivery.




=head1 ATTRIBUTES


=head2 C<country_of_origin>

C<countryOfOrigin>

The country of the principal offices of the production company or
individual responsible for the movie or program.


A country_of_origin should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Country']>

=back

=cut

has country_of_origin => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'countryOfOrigin',
    json_ld_serializer => \&_serialize_country_of_origin,
);

sub _serialize_country_of_origin { $_[0]->_serializer('country_of_origin') }


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
    json_ld   => 'partOfTVSeries',
    json_ld_serializer => \&_serialize_part_of_tv_series,
);

sub _serialize_part_of_tv_series { $_[0]->_serializer('part_of_tv_series') }




around json_ld_type => sub { return 'TVSeason' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'countryOfOrigin' => \&_serialize_country_of_origin,
       'partOfTVSeries' => \&_serialize_part_of_tv_series,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;