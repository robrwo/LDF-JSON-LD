package SemanticWeb::Schema;

# ABSTRACT: Moo classes for http://schema.org/ classes

use Moo;

use List::Util qw/ first /;
use MooX::JSON_LD 'Class';
use Ref::Util qw/ is_blessed_ref is_plain_arrayref /;
use Types::Standard qw/ Str /;

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

This is a base class for the C<SemanticWeb::Schema> classes, which
were generated automatically from the following sources:

=over


=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back

=head1 ATTRIBUTES

=head2 C<id>

If this is set, it adds a C<@id> to the L</json_ld_data>.

=cut

has id => (
    is        => 'rw',
    isa       => Str,
    predicate => 1,
);

=head2 C<context>

The context defaults to "http://schema.org/".

=cut

around _build_context => sub { return 'http://schema.org/' };

around json_ld_data => sub {
    my ($next, $self) = @_;

    my $data = $self->$next;

    delete $data->{$_} for grep { !defined $data->{$_} } keys %$data;

    $data->{'@id'} //= $self->id if $self->has_id;

    return $data;
};

=head1 SEE ALSO

=over

=item L<Moo>

=item L<MooX::JSON_LD>

=item L<http://schema.org/>

=back

=cut

1;
