package SemanticWeb::Schema::SendAction;

# ABSTRACT: <p>The act of physically/electronically dispatching an object for transfer from an origin to a destination

use Moo;

extends qw/ SemanticWeb::Schema::TransferAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

<p>The act of physically/electronically dispatching an object for transfer
from an origin to a destination.Related actions:</p> <ul> <li><a
class="localLink" href="http://schema.org/ReceiveAction">ReceiveAction</a>:
The reciprocal of SendAction.</li> <li><a class="localLink"
href="http://schema.org/GiveAction">GiveAction</a>: Unlike GiveAction,
SendAction does not imply the transfer of ownership (e.g. I can send you my
laptop, but I'm not necessarily giving it to you).</li> </ul> 

=end html




=head1 ATTRIBUTES


=head2 C<delivery_method>

C<deliveryMethod>

A sub property of instrument. The method of delivery.


A delivery_method should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DeliveryMethod']>

=back

=cut

has delivery_method => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'deliveryMethod',
    json_ld_serializer => \&_serialize_delivery_method,
);

sub _serialize_delivery_method { $_[0]->_serializer('delivery_method') }


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




around json_ld_type => sub { return 'SendAction' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'deliveryMethod' => \&_serialize_delivery_method,
       'recipient' => \&_serialize_recipient,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::TransferAction>

=cut

1;
