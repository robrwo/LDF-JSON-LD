package LDF::Schema::AutoBodyShop;

# ABSTRACT: Auto body shop.

use Moo;

extends qw/ LDF::Schema::AutomotiveBusiness /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Auto body shop.



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'AutoBodyShop' }



=head1 SEE ALSO



L<LDF::Schema::AutomotiveBusiness>

=cut

1;
