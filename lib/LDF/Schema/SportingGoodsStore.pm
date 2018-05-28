package LDF::Schema::SportingGoodsStore;

# ABSTRACT: A sporting goods store.

use Moo;

extends qw/ LDF::Schema::Store /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A sporting goods store.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'SportingGoodsStore' }



=head1 SEE ALSO



L<LDF::Schema::Store>

=cut

1;
