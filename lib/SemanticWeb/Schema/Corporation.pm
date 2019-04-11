use utf8;

package SemanticWeb::Schema::Corporation;

# ABSTRACT: Organization: A business corporation.

use Moo;

extends qw/ SemanticWeb::Schema::Organization /;


use MooX::JSON_LD 'Corporation';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.5.2';

=encoding utf8

=head1 DESCRIPTION

Organization: A business corporation.




=head1 ATTRIBUTES


=head2 C<ticker_symbol>

C<tickerSymbol>

The exchange traded instrument associated with a Corporation object. The
tickerSymbol is expressed as an exchange and an instrument name separated
by a space character. For the exchange component of the tickerSymbol
attribute, we recommend using the controlled vocabulary of Market
Identifier Codes (MIC) specified in ISO15022.


A ticker_symbol should be one of the following types:

=over

=item C<Str>

=back

=cut

has ticker_symbol => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'tickerSymbol',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Organization>

=cut

1;
