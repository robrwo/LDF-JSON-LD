package SemanticWeb::Schema::HowToItem;

# ABSTRACT: An item used as either a tool or supply when performing the instructions for how to to achieve a result.

use Moo;

extends qw/ SemanticWeb::Schema::ListItem /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An item used as either a tool or supply when performing the instructions
for how to to achieve a result.




=head1 ATTRIBUTES


=head2 C<required_quantity>

C<requiredQuantity>

The required quantity of the item(s).


A required_quantity should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::QuantitativeValue']>

=item C<Str>

=item C<Num>

=back

=cut

has required_quantity => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'HowToItem' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'requiredQuantity' => $self->curry::_serializer('required_quantity'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::ListItem>

=cut

1;