package LDF::Schema::RsvpResponseType;

# ABSTRACT: RsvpResponseType is an enumeration type whose instances represent responding to an RSVP request.

use Moo;

extends qw/ LDF::Schema::Enumeration /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

RsvpResponseType is an enumeration type whose instances represent
responding to an RSVP request.



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

sub json_ld_type { 'RsvpResponseType' }



=head1 SEE ALSO



L<LDF::Schema::Enumeration>

=cut

1;