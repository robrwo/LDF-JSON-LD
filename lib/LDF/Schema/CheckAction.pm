package LDF::Schema::CheckAction;

# ABSTRACT: An agent inspects

use Moo;

extends qw/ LDF::Schema::FindAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An agent inspects, determines, investigates, inquires, or examines an
object's accuracy, quality, condition, or state.



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'CheckAction' }



=head1 SEE ALSO



L<LDF::Schema::FindAction>

=cut

1;