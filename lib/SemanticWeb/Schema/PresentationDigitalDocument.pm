package SemanticWeb::Schema::PresentationDigitalDocument;

# ABSTRACT: A file containing slides or used for a presentation.

use Moo;

extends qw/ SemanticWeb::Schema::DigitalDocument /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A file containing slides or used for a presentation.




=cut


around json_ld_type => sub { return 'PresentationDigitalDocument' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::DigitalDocument>

=cut

1;