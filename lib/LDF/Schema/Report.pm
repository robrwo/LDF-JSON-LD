package LDF::Schema::Report;

# ABSTRACT: A Report generated by governmental or non-governmental organization.

use Moo;

extends qw/ LDF::Schema::Article /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A Report generated by governmental or non-governmental organization.



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=head1 ATTRIBUTES


=head2 C<report_number>

C<reportNumber>

The number or other unique designator assigned to a Report by the
publishing organization.


A report_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has report_number => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Report' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields,
      { reportNumber => 'report_number' },
    ]
};




=head1 SEE ALSO



L<LDF::Schema::Article>

=cut

1;