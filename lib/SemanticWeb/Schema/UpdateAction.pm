use utf8;

package SemanticWeb::Schema::UpdateAction;

# ABSTRACT: The act of managing by changing/editing the state of the object.

use Moo;

extends qw/ SemanticWeb::Schema::Action /;


use MooX::JSON_LD 'UpdateAction';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.8.0';

=encoding utf8

=head1 DESCRIPTION

The act of managing by changing/editing the state of the object.




=head1 ATTRIBUTES


=head2 C<collection>



A sub property of object. The collection target of the action.


A collection should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Thing']>

=back

=cut

has collection => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'collection',
);


=head2 C<target_collection>

C<targetCollection>

A sub property of object. The collection target of the action.


A target_collection should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Thing']>

=back

=cut

has target_collection => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'targetCollection',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Action>

=cut

1;
