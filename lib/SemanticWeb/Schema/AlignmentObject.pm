use utf8;

package SemanticWeb::Schema::AlignmentObject;

# ABSTRACT: An intangible item that describes an alignment between a learning resource and a node in an educational framework.

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use MooX::JSON_LD 'AlignmentObject';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v4.0.2';

=encoding utf8

=head1 DESCRIPTION

An intangible item that describes an alignment between a learning resource
and a node in an educational framework.




=head1 ATTRIBUTES


=head2 C<alignment_type>

C<alignmentType>

A category of alignment between the learning resource and the framework
node. Recommended values include: 'assesses', 'teaches', 'requires',
'textComplexity', 'readingLevel', 'educationalSubject', and
'educationalLevel'.


A alignment_type should be one of the following types:

=over

=item C<Str>

=back

=cut

has alignment_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'alignmentType',
);


=head2 C<educational_framework>

C<educationalFramework>

The framework to which the resource being described is aligned.


A educational_framework should be one of the following types:

=over

=item C<Str>

=back

=cut

has educational_framework => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'educationalFramework',
);


=head2 C<target_description>

C<targetDescription>

The description of a node in an established educational framework.


A target_description should be one of the following types:

=over

=item C<Str>

=back

=cut

has target_description => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'targetDescription',
);


=head2 C<target_name>

C<targetName>

The name of a node in an established educational framework.


A target_name should be one of the following types:

=over

=item C<Str>

=back

=cut

has target_name => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'targetName',
);


=head2 C<target_url>

C<targetUrl>

The URL of a node in an established educational framework.


A target_url should be one of the following types:

=over

=item C<Str>

=back

=cut

has target_url => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'targetUrl',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;
