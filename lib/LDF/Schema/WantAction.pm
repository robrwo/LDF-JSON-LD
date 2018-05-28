package LDF::Schema::WantAction;

# ABSTRACT: The act of expressing a desire about the object

use Moo;

extends qw/ LDF::Schema::ReactAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of expressing a desire about the object. An agent wants an object.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'WantAction' }



=head1 SEE ALSO



L<LDF::Schema::ReactAction>

=cut

1;
