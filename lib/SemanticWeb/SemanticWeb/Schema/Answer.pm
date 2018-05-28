package SemanticWeb::Schema::Answer;

# ABSTRACT: An answer offered to a question; perhaps correct

use Moo;

extends qw/ SemanticWeb::Schema::Comment /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An answer offered to a question; perhaps correct, perhaps opinionated or
wrong.




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Answer' }



=head1 SEE ALSO



L<SemanticWeb::Schema::Comment>

=cut

1;