package SemanticWeb::Schema::Courthouse;

# ABSTRACT: A courthouse.

use Moo;

extends qw/ SemanticWeb::Schema::GovernmentBuilding /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A courthouse.




=cut


around json_ld_type => sub { return 'Courthouse' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::GovernmentBuilding>

=cut

1;