package SemanticWeb::Schema::AuthorizeAction;

# ABSTRACT: The act of granting permission to an object.

use Moo;

extends qw/ SemanticWeb::Schema::AllocateAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of granting permission to an object.




=head1 ATTRIBUTES


=head2 C<recipient>



A sub property of participant. The participant who is at the receiving end
of the action.


A recipient should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ContactPoint']>

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=item C<InstanceOf['SemanticWeb::Schema::Audience']>

=item C<InstanceOf['SemanticWeb::Schema::Person']>

=back

=cut

has recipient => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'recipient',
    json_ld_serializer => \&_serialize_recipient,
);

sub _serialize_recipient { $_[0]->_serializer('recipient') }




around json_ld_type => sub { return 'AuthorizeAction' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'recipient' => \&_serialize_recipient,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::AllocateAction>

=cut

1;
