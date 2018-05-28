package SemanticWeb::Schema::Permit;

# ABSTRACT: A permit issued by an organization, e

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A permit issued by an organization, e.g. a parking pass.




=head1 ATTRIBUTES


=head2 C<issued_by>

C<issuedBy>

The organization issuing the ticket or permit.


A issued_by should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has issued_by => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'issuedBy',
    json_ld_serializer => \&_serialize_issued_by,
);

sub _serialize_issued_by { $_[0]->_serializer('issued_by') }


=head2 C<issued_through>

C<issuedThrough>

The service through with the permit was granted.


A issued_through should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Service']>

=back

=cut

has issued_through => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'issuedThrough',
    json_ld_serializer => \&_serialize_issued_through,
);

sub _serialize_issued_through { $_[0]->_serializer('issued_through') }


=head2 C<permit_audience>

C<permitAudience>

The target audience for this permit.


A permit_audience should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Audience']>

=back

=cut

has permit_audience => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'permitAudience',
    json_ld_serializer => \&_serialize_permit_audience,
);

sub _serialize_permit_audience { $_[0]->_serializer('permit_audience') }


=head2 C<valid_for>

C<validFor>

The time validity of the permit.


A valid_for should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Duration']>

=back

=cut

has valid_for => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'validFor',
    json_ld_serializer => \&_serialize_valid_for,
);

sub _serialize_valid_for { $_[0]->_serializer('valid_for') }


=head2 C<valid_from>

C<validFrom>

The date when the item becomes valid.


A valid_from should be one of the following types:

=over

=item C<Str>

=back

=cut

has valid_from => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'validFrom',
    json_ld_serializer => \&_serialize_valid_from,
);

sub _serialize_valid_from { $_[0]->_serializer('valid_from') }


=head2 C<valid_in>

C<validIn>

The geographic area where the permit is valid.


A valid_in should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::AdministrativeArea']>

=back

=cut

has valid_in => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'validIn',
    json_ld_serializer => \&_serialize_valid_in,
);

sub _serialize_valid_in { $_[0]->_serializer('valid_in') }


=head2 C<valid_until>

C<validUntil>

The date when the item is no longer valid.


A valid_until should be one of the following types:

=over

=item C<Str>

=back

=cut

has valid_until => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'validUntil',
    json_ld_serializer => \&_serialize_valid_until,
);

sub _serialize_valid_until { $_[0]->_serializer('valid_until') }




around json_ld_type => sub { return 'Permit' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'issuedBy' => \&_serialize_issued_by,
       'issuedThrough' => \&_serialize_issued_through,
       'permitAudience' => \&_serialize_permit_audience,
       'validFor' => \&_serialize_valid_for,
       'validFrom' => \&_serialize_valid_from,
       'validIn' => \&_serialize_valid_in,
       'validUntil' => \&_serialize_valid_until,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;