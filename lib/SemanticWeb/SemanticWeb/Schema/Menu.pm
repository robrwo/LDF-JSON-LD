package SemanticWeb::Schema::Menu;

# ABSTRACT: A structured representation of food or drink items available from a FoodEstablishment.

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A structured representation of food or drink items available from a
FoodEstablishment.




=head1 ATTRIBUTES


=head2 C<has_menu_item>

C<hasMenuItem>

A food or drink item contained in a menu or menu section.


A has_menu_item should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MenuItem']>

=back

=cut

has has_menu_item => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<has_menu_section>

C<hasMenuSection>

A subgrouping of the menu (by dishes, course, serving time period, etc.).


A has_menu_section should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MenuSection']>

=back

=cut

has has_menu_section => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Menu' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'hasMenuItem' => $self->curry::_serializer('has_menu_item'),
       'hasMenuSection' => $self->curry::_serializer('has_menu_section'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;