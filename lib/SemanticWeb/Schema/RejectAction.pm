package SemanticWeb::Schema::RejectAction;

# ABSTRACT: <p>The act of rejecting to/adopting an object

use Moo;

extends qw/ SemanticWeb::Schema::AllocateAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

<p>The act of rejecting to/adopting an object.</p> <p>Related actions:</p>
<ul> <li><a class="localLink"
href="http://schema.org/AcceptAction">AcceptAction</a>: The antonym of
RejectAction.</li> </ul> 

=end html




=cut


around json_ld_type => sub { return 'RejectAction' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::AllocateAction>

=cut

1;
