package SemanticWeb::Schema::AskAction;

# ABSTRACT: <p>The act of posing a question / favor to someone

use Moo;

extends qw/ SemanticWeb::Schema::CommunicateAction /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

<p>The act of posing a question / favor to someone.</p> <p>Related
actions:</p> <ul> <li><a class="localLink"
href="http://schema.org/ReplyAction">ReplyAction</a>: Appears generally as
a response to AskAction.</li> </ul> 

=end html




=head1 ATTRIBUTES


=head2 C<question>



A sub property of object. A question.


A question should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Question']>

=back

=cut

has question => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'AskAction' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'question' => $self->curry::_serializer('question'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::CommunicateAction>

=cut

1;