use utf8;

package SemanticWeb::Schema::CivicStructure;

# ABSTRACT: A public structure

use Moo;

extends qw/ SemanticWeb::Schema::Place /;


use MooX::JSON_LD 'CivicStructure';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.6.0';

=encoding utf8

=head1 DESCRIPTION

A public structure, such as a town hall or concert hall.




=head1 ATTRIBUTES


=head2 C<opening_hours>

C<openingHours>

=begin html

The general opening hours for a business. Opening hours can be specified as
a weekly time range, starting with days, then times per day. Multiple days
can be listed with commas ',' separating each day. Day or time ranges are
specified using a hyphen '-'.<br/><br/> <ul> <li>Days are specified using
the following two-letter combinations: <code>Mo</code>, <code>Tu</code>,
<code>We</code>, <code>Th</code>, <code>Fr</code>, <code>Sa</code>,
<code>Su</code>.</li> <li>Times are specified using 24:00 time. For
example, 3pm is specified as <code>15:00</code>. </li> <li>Here is an
example: <code>&lt;time itemprop="openingHours" datetime=&quot;Tu,Th
16:00-20:00&quot;&gt;Tuesdays and Thursdays 4-8pm&lt;/time&gt;</code>.</li>
<li>If a business is open 7 days a week, then it can be specified as
<code>&lt;time itemprop=&quot;openingHours&quot;
datetime=&quot;Mo-Su&quot;&gt;Monday through Sunday, all
day&lt;/time&gt;</code>.</li> </ul> 

=end html


A opening_hours should be one of the following types:

=over

=item C<Str>

=back

=cut

has opening_hours => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'openingHours',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Place>

=cut

1;
