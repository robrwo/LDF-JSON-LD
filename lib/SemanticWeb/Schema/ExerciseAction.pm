use utf8;

package SemanticWeb::Schema::ExerciseAction;

# ABSTRACT: The act of participating in exertive activity for the purposes of improving health and fitness.

use Moo;

extends qw/ SemanticWeb::Schema::PlayAction /;


use MooX::JSON_LD 'ExerciseAction';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.8.2';

=encoding utf8

=head1 DESCRIPTION

The act of participating in exertive activity for the purposes of improving
health and fitness.




=head1 ATTRIBUTES


=head2 C<course>



A sub property of location. The course where this action was taken.


A course should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has course => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'course',
);


=head2 C<diet>



A sub property of instrument. The diet used in this action.


A diet should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Diet']>

=back

=cut

has diet => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'diet',
);


=head2 C<distance>



The distance travelled, e.g. exercising or travelling.


A distance should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Distance']>

=back

=cut

has distance => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'distance',
);


=head2 C<exercise_course>

C<exerciseCourse>

A sub property of location. The course where this action was taken.


A exercise_course should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has exercise_course => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'exerciseCourse',
);


=head2 C<exercise_plan>

C<exercisePlan>

A sub property of instrument. The exercise plan used on this action.


A exercise_plan should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ExercisePlan']>

=back

=cut

has exercise_plan => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'exercisePlan',
);


=head2 C<exercise_related_diet>

C<exerciseRelatedDiet>

A sub property of instrument. The diet used in this action.


A exercise_related_diet should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Diet']>

=back

=cut

has exercise_related_diet => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'exerciseRelatedDiet',
);


=head2 C<exercise_type>

C<exerciseType>

Type(s) of exercise or activity, such as strength training, flexibility
training, aerobics, cardiac rehabilitation, etc.


A exercise_type should be one of the following types:

=over

=item C<Str>

=back

=cut

has exercise_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'exerciseType',
);


=head2 C<from_location>

C<fromLocation>

A sub property of location. The original location of the object or the
agent before the action.


A from_location should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has from_location => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'fromLocation',
);


=head2 C<opponent>



A sub property of participant. The opponent on this action.


A opponent should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has opponent => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'opponent',
);


=head2 C<sports_activity_location>

C<sportsActivityLocation>

A sub property of location. The sports activity location where this action
occurred.


A sports_activity_location should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::SportsActivityLocation']>

=back

=cut

has sports_activity_location => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'sportsActivityLocation',
);


=head2 C<sports_event>

C<sportsEvent>

A sub property of location. The sports event where this action occurred.


A sports_event should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::SportsEvent']>

=back

=cut

has sports_event => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'sportsEvent',
);


=head2 C<sports_team>

C<sportsTeam>

A sub property of participant. The sports team that participated on this
action.


A sports_team should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::SportsTeam']>

=back

=cut

has sports_team => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'sportsTeam',
);


=head2 C<to_location>

C<toLocation>

A sub property of location. The final location of the object or the agent
after the action.


A to_location should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has to_location => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'toLocation',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::PlayAction>

=cut

1;
