package SemanticWeb::Schema::SearchAction;

# ABSTRACT: <p>The act of searching for an object

use Moo;

extends qw/ SemanticWeb::Schema::Action /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

<p>The act of searching for an object.</p> <p>Related actions:</p> <ul>
<li><a class="localLink"
href="http://schema.org/FindAction">FindAction</a>: SearchAction generally
leads to a FindAction, but not necessarily.</li> </ul> 

=end html




=head1 ATTRIBUTES


=head2 C<query>



A sub property of instrument. The query used on this action.


A query should be one of the following types:

=over

=item C<Str>

=back

=cut

has query => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'SearchAction' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'query' => $self->curry::_serializer('query'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Action>

=cut

1;