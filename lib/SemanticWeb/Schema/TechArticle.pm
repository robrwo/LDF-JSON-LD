use utf8;

package SemanticWeb::Schema::TechArticle;

# ABSTRACT: A technical article - Example: How-to (task) topics

use Moo;

extends qw/ SemanticWeb::Schema::Article /;


use MooX::JSON_LD 'TechArticle';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.9.0';

=encoding utf8

=head1 DESCRIPTION

A technical article - Example: How-to (task) topics, step-by-step,
procedural troubleshooting, specifications, etc.




=head1 ATTRIBUTES


=head2 C<dependencies>



Prerequisites needed to fulfill steps in article.


A dependencies should be one of the following types:

=over

=item C<Str>

=back

=cut

has dependencies => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'dependencies',
);


=head2 C<proficiency_level>

C<proficiencyLevel>

Proficiency needed for this content; expected values: 'Beginner', 'Expert'.


A proficiency_level should be one of the following types:

=over

=item C<Str>

=back

=cut

has proficiency_level => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'proficiencyLevel',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Article>

=cut

1;
