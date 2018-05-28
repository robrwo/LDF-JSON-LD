package SemanticWeb::Schema::LegislativeBuilding;

# ABSTRACT: A legislative building&#x2014;for example

use Moo;

extends qw/ SemanticWeb::Schema::GovernmentBuilding /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A legislative building&#x2014;for example, the state capitol.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'LegislativeBuilding' }



=head1 SEE ALSO



L<SemanticWeb::Schema::GovernmentBuilding>

=cut

1;