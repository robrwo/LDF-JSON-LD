package LDF::Schema::FlightReservation;

# ABSTRACT: A reservation for air travel

use Moo;

extends qw/ LDF::Schema::Reservation /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

A reservation for air travel.</p> <p>Note: This type is for information
about actual reservations, e.g. in confirmation emails or HTML pages with
individual confirmations of reservations. For offers of tickets, use <a
class="localLink" href="http://schema.org/Offer">Offer</a>.

=end html



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=head1 ATTRIBUTES


=head2 C<boarding_group>

C<boardingGroup>

The airline-specific indicator of boarding order / preference.


A boarding_group should be one of the following types:

=over

=item C<Str>

=back

=cut

has boarding_group => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<passenger_priority_status>

C<passengerPriorityStatus>

The priority status assigned to a passenger for security or boarding (e.g.
FastTrack or Priority).


A passenger_priority_status should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::QualitativeValue']>

=item C<Str>

=back

=cut

has passenger_priority_status => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<passenger_sequence_number>

C<passengerSequenceNumber>

The passenger's sequence number as assigned by the airline.


A passenger_sequence_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has passenger_sequence_number => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<security_screening>

C<securityScreening>

The type of security screening the passenger is subject to.


A security_screening should be one of the following types:

=over

=item C<Str>

=back

=cut

has security_screening => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'FlightReservation' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields,
      { boardingGroup => 'boarding_group' },
      { passengerPriorityStatus => 'passenger_priority_status' },
      { passengerSequenceNumber => 'passenger_sequence_number' },
      { securityScreening => 'security_screening' },
    ]
};




=head1 SEE ALSO



L<LDF::Schema::Reservation>

=cut

1;