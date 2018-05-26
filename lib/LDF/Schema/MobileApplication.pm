package LDF::Schema::MobileApplication;

# ABSTRACT: A software application designed specifically to work well on a mobile device such as a telephone.

use Moo;

extends qw/ LDF::Schema::SoftwareApplication /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A software application designed specifically to work well on a mobile
device such as a telephone.



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=head1 ATTRIBUTES


=head2 C<carrier_requirements>

C<carrierRequirements>

Specifies specific carrier(s) requirements for the application (e.g. an
application may only work on a specific carrier network).


A carrier_requirements should be one of the following types:

=over

=item C<Str>

=back

=cut

has carrier_requirements => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'MobileApplication' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields,
      { carrierRequirements => 'carrier_requirements' },
    ]
};




=head1 SEE ALSO



L<LDF::Schema::SoftwareApplication>

=cut

1;