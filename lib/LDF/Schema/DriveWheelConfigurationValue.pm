package LDF::Schema::DriveWheelConfigurationValue;

# ABSTRACT: A value indicating which roadwheels will receive torque.

use Moo;

extends qw/ LDF::Schema::QualitativeValue /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A value indicating which roadwheels will receive torque.




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
