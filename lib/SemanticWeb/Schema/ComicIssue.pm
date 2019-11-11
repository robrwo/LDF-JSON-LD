use utf8;

package SemanticWeb::Schema::ComicIssue;

# ABSTRACT: Individual comic issues are serially published as part of a larger series

use Moo;

extends qw/ SemanticWeb::Schema::PublicationIssue /;


use MooX::JSON_LD 'ComicIssue';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v5.0.1';

=encoding utf8

=head1 DESCRIPTION

Individual comic issues are serially published as part of a larger series.
For the sake of consistency, even one-shot issues belong to a series
comprised of a single issue. All comic issues can be uniquely identified
by: the combination of the name and volume number of the series to which
the issue belongs; the issue number; and the variant description of the
issue (if any).




=head1 ATTRIBUTES


=head2 C<artist>



The primary artist for a work in a medium other than pencils or digital
line art--for example, if the primary artwork is done in watercolors or
digital paints.


A artist should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has artist => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'artist',
);


=head2 C<colorist>



The individual who adds color to inked drawings.


A colorist should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has colorist => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'colorist',
);


=head2 C<inker>



The individual who traces over the pencil drawings in ink after pencils are
complete.


A inker should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has inker => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'inker',
);


=head2 C<letterer>



The individual who adds lettering, including speech balloons and sound
effects, to artwork.


A letterer should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has letterer => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'letterer',
);


=head2 C<penciler>



The individual who draws the primary narrative artwork.


A penciler should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has penciler => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'penciler',
);


=head2 C<variant_cover>

C<variantCover>

A description of the variant cover for the issue, if the issue is a variant
printing. For example, "Bryan Hitch Variant Cover" or "2nd Printing
Variant".


A variant_cover should be one of the following types:

=over

=item C<Str>

=back

=cut

has variant_cover => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'variantCover',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::PublicationIssue>

=cut

1;
