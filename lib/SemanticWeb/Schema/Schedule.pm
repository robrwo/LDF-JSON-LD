use utf8;

package SemanticWeb::Schema::Schedule;

# ABSTRACT: A schedule defines a repeating time period used to describe a regularly occurring Event 

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use MooX::JSON_LD 'Schedule';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v6.0.0';

=encoding utf8

=head1 DESCRIPTION

=begin html

<p>A schedule defines a repeating time period used to describe a regularly
occurring <a class="localLink" href="http://schema.org/Event">Event</a>. At
a minimum a schedule will specify <a class="localLink"
href="http://schema.org/repeatFrequency">repeatFrequency</a> which
describes the interval between occurences of the event. Additional
information can be provided to specify the schedule more precisely. This
includes identifying the day(s) of the week or month when the recurring
event will take place, in addition to its start and end time. Schedules may
also have start and end dates to indicate when they are active, e.g. to
define a limited calendar of events.<p>

=end html




=head1 ATTRIBUTES


=head2 C<by_day>

C<byDay>

=begin html

<p>Defines the day(s) of the week on which a recurring <a class="localLink"
href="http://schema.org/Event">Event</a> takes place. May be specified
using either <a class="localLink"
href="http://schema.org/DayOfWeek">DayOfWeek</a>, or alternatively <a
class="localLink" href="http://schema.org/Text">Text</a> conforming to
iCal's syntax for byDay recurrence rules<p>

=end html


A by_day should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DayOfWeek']>

=item C<Str>

=back

=head2 C<_has_by_day>

A predicate for the L</by_day> attribute.

=cut

has by_day => (
    is        => 'rw',
    predicate => '_has_by_day',
    json_ld   => 'byDay',
);


=head2 C<by_month>

C<byMonth>

=begin html

<p>Defines the month(s) of the year on which a recurring <a
class="localLink" href="http://schema.org/Event">Event</a> takes place.
Specified as an <a class="localLink"
href="http://schema.org/Integer">Integer</a> between 1-12. January is 1.<p>

=end html


A by_month should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Integer']>

=back

=head2 C<_has_by_month>

A predicate for the L</by_month> attribute.

=cut

has by_month => (
    is        => 'rw',
    predicate => '_has_by_month',
    json_ld   => 'byMonth',
);


=head2 C<by_month_day>

C<byMonthDay>

=begin html

<p>Defines the day(s) of the month on which a recurring <a
class="localLink" href="http://schema.org/Event">Event</a> takes place.
Specified as an <a class="localLink"
href="http://schema.org/Integer">Integer</a> between 1-31.<p>

=end html


A by_month_day should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Integer']>

=back

=head2 C<_has_by_month_day>

A predicate for the L</by_month_day> attribute.

=cut

has by_month_day => (
    is        => 'rw',
    predicate => '_has_by_month_day',
    json_ld   => 'byMonthDay',
);


=head2 C<duration>



=begin html

<p>The duration of the item (movie, audio recording, event, etc.) in <a
href="http://en.wikipedia.org/wiki/ISO_8601">ISO 8601 date format</a>.<p>

=end html


A duration should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Duration']>

=back

=head2 C<_has_duration>

A predicate for the L</duration> attribute.

=cut

has duration => (
    is        => 'rw',
    predicate => '_has_duration',
    json_ld   => 'duration',
);


=head2 C<except_date>

C<exceptDate>

=begin html

<p>Defines a <a class="localLink" href="http://schema.org/Date">Date</a> or
<a class="localLink" href="http://schema.org/DateTime">DateTime</a> during
which a scheduled <a class="localLink"
href="http://schema.org/Event">Event</a> will not take place. The property
allows exceptions to a <a class="localLink"
href="http://schema.org/Schedule">Schedule</a> to be specified. If an
exception is specified as a <a class="localLink"
href="http://schema.org/DateTime">DateTime</a> then only the event that
would have started at that specific date and time should be excluded from
the schedule. If an exception is specified as a <a class="localLink"
href="http://schema.org/Date">Date</a> then any event that is scheduled for
that 24 hour period should be excluded from the schedule. This allows a
whole day to be excluded from the schedule without having to itemise every
scheduled event.<p>

=end html


A except_date should be one of the following types:

=over

=item C<Str>

=back

=head2 C<_has_except_date>

A predicate for the L</except_date> attribute.

=cut

has except_date => (
    is        => 'rw',
    predicate => '_has_except_date',
    json_ld   => 'exceptDate',
);


=head2 C<repeat_count>

C<repeatCount>

=begin html

<p>Defines the number of times a recurring <a class="localLink"
href="http://schema.org/Event">Event</a> will take place<p>

=end html


A repeat_count should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Integer']>

=back

=head2 C<_has_repeat_count>

A predicate for the L</repeat_count> attribute.

=cut

has repeat_count => (
    is        => 'rw',
    predicate => '_has_repeat_count',
    json_ld   => 'repeatCount',
);


=head2 C<repeat_frequency>

C<repeatFrequency>

=begin html

<p>Defines the frequency at which <a class="localLink"
href="http://schema.org/Events">Events</a> will occur according to a
schedule <a class="localLink"
href="http://schema.org/Schedule">Schedule</a>. The intervals between
events should be defined as a <a class="localLink"
href="http://schema.org/Duration">Duration</a> of time.<p>

=end html


A repeat_frequency should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Duration']>

=item C<Str>

=back

=head2 C<_has_repeat_frequency>

A predicate for the L</repeat_frequency> attribute.

=cut

has repeat_frequency => (
    is        => 'rw',
    predicate => '_has_repeat_frequency',
    json_ld   => 'repeatFrequency',
);


=head2 C<schedule_timezone>

C<scheduleTimezone>

=begin html

<p>Indicates the timezone for which the time(s) indicated in the <a
class="localLink" href="http://schema.org/Schedule">Schedule</a> are given.
The value provided should be among those listed in the IANA Time Zone
Database.<p>

=end html


A schedule_timezone should be one of the following types:

=over

=item C<Str>

=back

=head2 C<_has_schedule_timezone>

A predicate for the L</schedule_timezone> attribute.

=cut

has schedule_timezone => (
    is        => 'rw',
    predicate => '_has_schedule_timezone',
    json_ld   => 'scheduleTimezone',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;
