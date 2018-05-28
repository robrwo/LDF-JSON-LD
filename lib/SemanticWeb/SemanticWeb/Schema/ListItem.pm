package SemanticWeb::Schema::ListItem;

# ABSTRACT: An list item, e

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An list item, e.g. a step in a checklist or how-to description.




=head1 ATTRIBUTES


=head2 C<item>



An entity represented by an entry in a list or data feed (e.g. an 'artist'
in a list of 'artists')’.


A item should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Thing']>

=back

=cut

has item => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<next_item>

C<nextItem>

A link to the ListItem that follows the current one.


A next_item should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ListItem']>

=back

=cut

has next_item => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<position>



The position of an item in a series or sequence of items.


A position should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::Integer']>

=back

=cut

has position => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<previous_item>

C<previousItem>

A link to the ListItem that preceeds the current one.


A previous_item should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ListItem']>

=back

=cut

has previous_item => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'ListItem' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'item' => $self->curry::_serializer('item'),
       'nextItem' => $self->curry::_serializer('next_item'),
       'position' => $self->curry::_serializer('position'),
       'previousItem' => $self->curry::_serializer('previous_item'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;