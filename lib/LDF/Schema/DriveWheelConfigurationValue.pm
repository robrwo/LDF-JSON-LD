package LDF::Schema::DriveWheelConfigurationValue;

# ABSTRACT: A value indicating which roadwheels will receive torque.

use Moo;

extends qw/ LDF::Schema::QualitativeValue /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A value indicating which roadwheels will receive torque.



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

sub json_ld_type { 'DriveWheelConfigurationValue' }



=head1 SEE ALSO



L<LDF::Schema::QualitativeValue>

=cut

1;