package LDF::Schema::BarOrPub;

# ABSTRACT: A bar or pub.

use Moo;

extends qw/ LDF::Schema::FoodEstablishment /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A bar or pub.



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

sub json_ld_type { 'BarOrPub' }



=head1 SEE ALSO



L<LDF::Schema::FoodEstablishment>

=cut

1;