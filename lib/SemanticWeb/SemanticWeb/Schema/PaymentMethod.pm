package SemanticWeb::Schema::PaymentMethod;

# ABSTRACT: <p>A payment method is a standardized procedure for transferring the monetary amount for a purchase

use Moo;

extends qw/ SemanticWeb::Schema::Enumeration /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

<p>A payment method is a standardized procedure for transferring the
monetary amount for a purchase. Payment methods are characterized by the
legal and technical structures used, and by the organization or group
carrying out the transaction.</p> <p>Commonly used values:</p> <ul>
<li>http://purl.org/goodrelations/v1#ByBankTransferInAdvance</li>
<li>http://purl.org/goodrelations/v1#ByInvoice</li>
<li>http://purl.org/goodrelations/v1#Cash</li>
<li>http://purl.org/goodrelations/v1#CheckInAdvance</li>
<li>http://purl.org/goodrelations/v1#COD</li>
<li>http://purl.org/goodrelations/v1#DirectDebit</li>
<li>http://purl.org/goodrelations/v1#GoogleCheckout</li>
<li>http://purl.org/goodrelations/v1#PayPal</li>
<li>http://purl.org/goodrelations/v1#PaySwarm</li> </ul> 

=end html




=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'PaymentMethod' }



=head1 SEE ALSO



L<SemanticWeb::Schema::Enumeration>

=cut

1;