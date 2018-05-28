package SemanticWeb::Schema::AutoPartsStore;

# ABSTRACT: An auto parts store.

use Moo;

extends qw/ SemanticWeb::Schema::AutomotiveBusiness SemanticWeb::Schema::Store /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An auto parts store.




=cut


around json_ld_type => sub { return 'AutoPartsStore' };

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