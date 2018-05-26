package LDF::Schema::ReserveAction;

# ABSTRACT: <p>Reserving a concrete object

use Moo;

extends qw/ LDF::Schema::PlanAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

<p>Reserving a concrete object.</p> <p>Related actions:</p> <ul> <li><a
class="localLink"
href="http://schema.org/ScheduleAction">ScheduleAction</a></a>: Unlike
ScheduleAction, ReserveAction reserves concrete objects (e.g. a table, a
hotel) towards a time slot / spatial allocation.</li> </ul> 

=end html



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'ReserveAction' }



=head1 SEE ALSO



L<LDF::Schema::PlanAction>

=cut

1;
