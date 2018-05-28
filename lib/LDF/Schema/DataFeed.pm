package LDF::Schema::DataFeed;

# ABSTRACT: A single feed providing structured information about one or more entities or topics.

use Moo;

extends qw/ LDF::Schema::Dataset /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A single feed providing structured information about one or more entities
or topics.




=head1 ATTRIBUTES


=head2 C<data_feed_element>

C<dataFeedElement>

An item within in a data feed. Data feeds may have many elements.


A data_feed_element should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::DataFeedItem']>

=item C<Str>

=item C<InstanceOf['LDF::Schema::Thing']>

=back

=cut

has data_feed_element => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'DataFeed' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'dataFeedElement' => $self->curry::_serializer('data_feed_element'),
    } ]
};




=head1 SEE ALSO



L<LDF::Schema::Dataset>

=cut

1;
