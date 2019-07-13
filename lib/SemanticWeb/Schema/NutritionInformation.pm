use utf8;

package SemanticWeb::Schema::NutritionInformation;

# ABSTRACT: Nutritional information about the recipe.

use Moo;

extends qw/ SemanticWeb::Schema::StructuredValue /;


use MooX::JSON_LD 'NutritionInformation';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.6.0';

=encoding utf8

=head1 DESCRIPTION

Nutritional information about the recipe.




=head1 ATTRIBUTES


=head2 C<calories>



The number of calories.


A calories should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Energy']>

=back

=cut

has calories => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'calories',
);


=head2 C<carbohydrate_content>

C<carbohydrateContent>

The number of grams of carbohydrates.


A carbohydrate_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has carbohydrate_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'carbohydrateContent',
);


=head2 C<cholesterol_content>

C<cholesterolContent>

The number of milligrams of cholesterol.


A cholesterol_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has cholesterol_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'cholesterolContent',
);


=head2 C<fat_content>

C<fatContent>

The number of grams of fat.


A fat_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has fat_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'fatContent',
);


=head2 C<fiber_content>

C<fiberContent>

The number of grams of fiber.


A fiber_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has fiber_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'fiberContent',
);


=head2 C<protein_content>

C<proteinContent>

The number of grams of protein.


A protein_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has protein_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'proteinContent',
);


=head2 C<saturated_fat_content>

C<saturatedFatContent>

The number of grams of saturated fat.


A saturated_fat_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has saturated_fat_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'saturatedFatContent',
);


=head2 C<serving_size>

C<servingSize>

The serving size, in terms of the number of volume or mass.


A serving_size should be one of the following types:

=over

=item C<Str>

=back

=cut

has serving_size => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'servingSize',
);


=head2 C<sodium_content>

C<sodiumContent>

The number of milligrams of sodium.


A sodium_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has sodium_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'sodiumContent',
);


=head2 C<sugar_content>

C<sugarContent>

The number of grams of sugar.


A sugar_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has sugar_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'sugarContent',
);


=head2 C<trans_fat_content>

C<transFatContent>

The number of grams of trans fat.


A trans_fat_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has trans_fat_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'transFatContent',
);


=head2 C<unsaturated_fat_content>

C<unsaturatedFatContent>

The number of grams of unsaturated fat.


A unsaturated_fat_content should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Mass']>

=back

=cut

has unsaturated_fat_content => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'unsaturatedFatContent',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::StructuredValue>

=cut

1;
