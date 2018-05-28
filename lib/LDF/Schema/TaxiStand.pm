package LDF::Schema::TaxiStand;

# ABSTRACT: A taxi stand.

use Moo;

extends qw/ LDF::Schema::CivicStructure /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A taxi stand.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'TaxiStand' }



=head1 SEE ALSO



L<LDF::Schema::CivicStructure>

=cut

1;
