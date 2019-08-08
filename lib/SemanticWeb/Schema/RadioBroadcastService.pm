use utf8;

package SemanticWeb::Schema::RadioBroadcastService;

# ABSTRACT: A delivery service through which radio content is provided via broadcast over the air or online.

use Moo;

extends qw/ SemanticWeb::Schema::BroadcastService /;


use MooX::JSON_LD 'RadioBroadcastService';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.9.1';

=encoding utf8

=head1 DESCRIPTION

A delivery service through which radio content is provided via broadcast
over the air or online.




=head1 ATTRIBUTES


=head2 C<call_sign>

C<callSign>

The official callsign for the radio broadcast.


A call_sign should be one of the following types:

=over

=item C<Str>

=back

=cut

has call_sign => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'callSign',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::BroadcastService>

=cut

1;