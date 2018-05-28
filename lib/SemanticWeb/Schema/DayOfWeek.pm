package SemanticWeb::Schema::DayOfWeek;

# ABSTRACT: The day of the week, e

use Moo;

extends qw/ SemanticWeb::Schema::Enumeration /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

The day of the week, e.g. used to specify to which day the opening hours of
an OpeningHoursSpecification refer.</p> <p>Originally, URLs from <a
href="http://purl.org/goodrelations/v1">GoodRelations</a> were used (for <a
class="localLink" href="http://schema.org/Monday">Monday</a>, <a
class="localLink" href="http://schema.org/Tuesday">Tuesday</a>, <a
class="localLink" href="http://schema.org/Wednesday">Wednesday</a>, <a
class="localLink" href="http://schema.org/Thursday">Thursday</a>, <a
class="localLink" href="http://schema.org/Friday">Friday</a>, <a
class="localLink" href="http://schema.org/Saturday">Saturday</a>, <a
class="localLink" href="http://schema.org/Sunday">Sunday</a> plus a special
entry for <a class="localLink"
href="http://schema.org/PublicHolidays">PublicHolidays</a>); these have now
been integrated directly into schema.org.

=end html




=cut


around json_ld_type => sub { return 'DayOfWeek' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Enumeration>

=cut

1;