package SemanticWeb::Schema::GovernmentPermit;

# ABSTRACT: A permit issued by a government agency.

use Moo;

extends qw/ SemanticWeb::Schema::Permit /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A permit issued by a government agency.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'GovernmentPermit' }



=head1 SEE ALSO



L<SemanticWeb::Schema::Permit>

=cut

1;