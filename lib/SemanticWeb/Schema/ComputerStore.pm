package SemanticWeb::Schema::ComputerStore;

# ABSTRACT: A computer store.

use Moo;

extends qw/ SemanticWeb::Schema::Store /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A computer store.




=cut


around json_ld_type => sub { return 'ComputerStore' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Store>

=cut

1;