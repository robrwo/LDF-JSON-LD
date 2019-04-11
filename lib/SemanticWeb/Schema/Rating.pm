use utf8;

package SemanticWeb::Schema::Rating;

# ABSTRACT: A rating is an evaluation on a numeric scale

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use MooX::JSON_LD 'Rating';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.5.2';

=encoding utf8

=head1 DESCRIPTION

A rating is an evaluation on a numeric scale, such as 1 to 5 stars.




=head1 ATTRIBUTES


=head2 C<author>



The author of this content or rating. Please note that author is special in
that HTML 5 provides a special mechanism for indicating authorship via the
rel tag. That is equivalent to this and may be used interchangeably.


A author should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has author => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'author',
);


=head2 C<best_rating>

C<bestRating>

The highest value allowed in this rating system. If bestRating is omitted,
5 is assumed.


A best_rating should be one of the following types:

=over

=item C<Num>

=item C<Str>

=back

=cut

has best_rating => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'bestRating',
);


=head2 C<rating_value>

C<ratingValue>

The rating for the content.


A rating_value should be one of the following types:

=over

=item C<Str>

=item C<Num>

=back

=cut

has rating_value => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'ratingValue',
);


=head2 C<review_aspect>

C<reviewAspect>

This Review or Rating is relevant to this part or facet of the
itemReviewed.


A review_aspect should be one of the following types:

=over

=item C<Str>

=back

=cut

has review_aspect => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'reviewAspect',
);


=head2 C<worst_rating>

C<worstRating>

The lowest value allowed in this rating system. If worstRating is omitted,
1 is assumed.


A worst_rating should be one of the following types:

=over

=item C<Num>

=item C<Str>

=back

=cut

has worst_rating => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'worstRating',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;
