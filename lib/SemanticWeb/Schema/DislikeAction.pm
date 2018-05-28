package SemanticWeb::Schema::DislikeAction;

# ABSTRACT: The act of expressing a negative sentiment about the object

use Moo;

extends qw/ SemanticWeb::Schema::ReactAction /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The act of expressing a negative sentiment about the object. An agent
dislikes an object (a proposition, topic or theme) with participants.




=cut


around json_ld_type => sub { return 'DislikeAction' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::ReactAction>

=cut

1;