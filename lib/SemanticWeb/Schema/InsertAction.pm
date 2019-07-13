use utf8;

package SemanticWeb::Schema::InsertAction;

# ABSTRACT: The act of adding at a specific location in an ordered collection.

use Moo;

extends qw/ SemanticWeb::Schema::AddAction /;


use MooX::JSON_LD 'InsertAction';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.7.0';

=encoding utf8

=head1 DESCRIPTION

The act of adding at a specific location in an ordered collection.




=head1 ATTRIBUTES


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



L<SemanticWeb::Schema::AddAction>

=cut

1;
