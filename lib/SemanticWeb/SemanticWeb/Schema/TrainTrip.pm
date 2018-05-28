package SemanticWeb::Schema::TrainTrip;

# ABSTRACT: A trip on a commercial train line.

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A trip on a commercial train line.




=head1 ATTRIBUTES


=head2 C<arrival_platform>

C<arrivalPlatform>

The platform where the train arrives.


A arrival_platform should be one of the following types:

=over

=item C<Str>

=back

=cut

has arrival_platform => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<arrival_station>

C<arrivalStation>

The station where the train trip ends.


A arrival_station should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::TrainStation']>

=back

=cut

has arrival_station => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<arrival_time>

C<arrivalTime>

The expected arrival time.


A arrival_time should be one of the following types:

=over

=item C<Str>

=back

=cut

has arrival_time => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<departure_platform>

C<departurePlatform>

The platform from which the train departs.


A departure_platform should be one of the following types:

=over

=item C<Str>

=back

=cut

has departure_platform => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<departure_station>

C<departureStation>

The station from which the train departs.


A departure_station should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::TrainStation']>

=back

=cut

has departure_station => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<departure_time>

C<departureTime>

The expected departure time.


A departure_time should be one of the following types:

=over

=item C<Str>

=back

=cut

has departure_time => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<provider>



The service provider, service operator, or service performer; the goods
producer. Another party (a seller) may offer those services or goods on
behalf of the provider. A provider may also serve as the seller.


A provider should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has provider => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<train_name>

C<trainName>

The name of the train (e.g. The Orient Express).


A train_name should be one of the following types:

=over

=item C<Str>

=back

=cut

has train_name => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<train_number>

C<trainNumber>

The unique identifier for the train.


A train_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has train_number => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'TrainTrip' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'arrivalPlatform' => $self->curry::_serializer('arrival_platform'),
       'arrivalStation' => $self->curry::_serializer('arrival_station'),
       'arrivalTime' => $self->curry::_serializer('arrival_time'),
       'departurePlatform' => $self->curry::_serializer('departure_platform'),
       'departureStation' => $self->curry::_serializer('departure_station'),
       'departureTime' => $self->curry::_serializer('departure_time'),
       'provider' => $self->curry::_serializer('provider'),
       'trainName' => $self->curry::_serializer('train_name'),
       'trainNumber' => $self->curry::_serializer('train_number'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;