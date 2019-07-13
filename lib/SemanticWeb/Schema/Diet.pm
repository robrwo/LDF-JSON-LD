use utf8;

package SemanticWeb::Schema::Diet;

# ABSTRACT: A strategy of regulating the intake of food to achieve or maintain a specific health-related goal.

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork SemanticWeb::Schema::LifestyleModification /;


use MooX::JSON_LD 'Diet';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.6.1';

=encoding utf8

=head1 DESCRIPTION

A strategy of regulating the intake of food to achieve or maintain a
specific health-related goal.




=head1 ATTRIBUTES


=head2 C<diet_features>

C<dietFeatures>

Nutritional information specific to the dietary plan. May include dietary
recommendations on what foods to avoid, what foods to consume, and specific
alterations/deviations from the USDA or other regulatory body's approved
dietary guidelines.


A diet_features should be one of the following types:

=over

=item C<Str>

=back

=cut

has diet_features => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'dietFeatures',
);


=head2 C<endorsers>



People or organizations that endorse the plan.


A endorsers should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has endorsers => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'endorsers',
);


=head2 C<expert_considerations>

C<expertConsiderations>

Medical expert advice related to the plan.


A expert_considerations should be one of the following types:

=over

=item C<Str>

=back

=cut

has expert_considerations => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'expertConsiderations',
);


=head2 C<overview>



Descriptive information establishing the overarching theory/philosophy of
the plan. May include the rationale for the name, the population where the
plan first came to prominence, etc.


A overview should be one of the following types:

=over

=item C<Str>

=back

=cut

has overview => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'overview',
);


=head2 C<physiological_benefits>

C<physiologicalBenefits>

Specific physiologic benefits associated to the plan.


A physiological_benefits should be one of the following types:

=over

=item C<Str>

=back

=cut

has physiological_benefits => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'physiologicalBenefits',
);


=head2 C<risks>



Specific physiologic risks associated to the diet plan.


A risks should be one of the following types:

=over

=item C<Str>

=back

=cut

has risks => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'risks',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::LifestyleModification>

=cut

1;
