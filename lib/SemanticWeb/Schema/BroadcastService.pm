use utf8;

package SemanticWeb::Schema::BroadcastService;

# ABSTRACT: A delivery service through which content is provided via broadcast over the air or online.

use Moo;

extends qw/ SemanticWeb::Schema::Service /;


use MooX::JSON_LD 'BroadcastService';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.8.1';

=encoding utf8

=head1 DESCRIPTION

A delivery service through which content is provided via broadcast over the
air or online.




=head1 ATTRIBUTES


=head2 C<area>



The area within which users can expect to reach the broadcast service.


A area should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has area => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'area',
);


=head2 C<broadcast_affiliate_of>

C<broadcastAffiliateOf>

The media network(s) whose content is broadcast on this station.


A broadcast_affiliate_of should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has broadcast_affiliate_of => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'broadcastAffiliateOf',
);


=head2 C<broadcast_display_name>

C<broadcastDisplayName>

The name displayed in the channel guide. For many US affiliates, it is the
network name.


A broadcast_display_name should be one of the following types:

=over

=item C<Str>

=back

=cut

has broadcast_display_name => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'broadcastDisplayName',
);


=head2 C<broadcast_frequency>

C<broadcastFrequency>

The frequency used for over-the-air broadcasts. Numeric values or simple
ranges e.g. 87-99. In addition a shortcut idiom is supported for frequences
of AM and FM radio channels, e.g. "87 FM".


A broadcast_frequency should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::BroadcastFrequencySpecification']>

=item C<Str>

=back

=cut

has broadcast_frequency => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'broadcastFrequency',
);


=head2 C<broadcast_timezone>

C<broadcastTimezone>

=begin html

The timezone in <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO 8601
format</a> for which the service bases its broadcasts

=end html


A broadcast_timezone should be one of the following types:

=over

=item C<Str>

=back

=cut

has broadcast_timezone => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'broadcastTimezone',
);


=head2 C<broadcaster>



The organization owning or operating the broadcast service.


A broadcaster should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has broadcaster => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'broadcaster',
);


=head2 C<has_broadcast_channel>

C<hasBroadcastChannel>

A broadcast channel of a broadcast service.


A has_broadcast_channel should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::BroadcastChannel']>

=back

=cut

has has_broadcast_channel => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'hasBroadcastChannel',
);


=head2 C<parent_service>

C<parentService>

A broadcast service to which the broadcast service may belong to such as
regional variations of a national channel.


A parent_service should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::BroadcastService']>

=back

=cut

has parent_service => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'parentService',
);


=head2 C<video_format>

C<videoFormat>

The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD,
etc.).


A video_format should be one of the following types:

=over

=item C<Str>

=back

=cut

has video_format => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'videoFormat',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Service>

=cut

1;
