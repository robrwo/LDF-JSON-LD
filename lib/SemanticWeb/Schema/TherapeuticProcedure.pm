use utf8;

package SemanticWeb::Schema::TherapeuticProcedure;

# ABSTRACT: A medical procedure intended primarily for therapeutic purposes

use Moo;

extends qw/ SemanticWeb::Schema::MedicalProcedure /;


use MooX::JSON_LD 'TherapeuticProcedure';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.9.0';

=encoding utf8

=head1 DESCRIPTION

A medical procedure intended primarily for therapeutic purposes, aimed at
improving a health condition.




=head1 ATTRIBUTES


=head2 C<adverse_outcome>

C<adverseOutcome>

A possible complication and/or side effect of this therapy. If it is known
that an adverse outcome is serious (resulting in death, disability, or
permanent damage; requiring hospitalization; or is otherwise
life-threatening or requires immediate medical attention), tag it as a
seriouseAdverseOutcome instead.


A adverse_outcome should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MedicalEntity']>

=back

=cut

has adverse_outcome => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'adverseOutcome',
);


=head2 C<dose_schedule>

C<doseSchedule>

A dosing schedule for the drug for a given population, either observed,
recommended, or maximum dose based on the type used.


A dose_schedule should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DoseSchedule']>

=back

=cut

has dose_schedule => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'doseSchedule',
);


=head2 C<drug>



Specifying a drug or medicine used in a medication procedure


A drug should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Drug']>

=back

=cut

has drug => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'drug',
);


=head2 C<indication>



A factor that indicates use of this therapy for treatment and/or prevention
of a condition, symptom, etc. For therapies such as drugs, indications can
include both officially-approved indications as well as off-label uses.
These can be distinguished by using the ApprovedIndication subtype of
MedicalIndication.


A indication should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MedicalIndication']>

=back

=cut

has indication => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'indication',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::MedicalProcedure>

=cut

1;
