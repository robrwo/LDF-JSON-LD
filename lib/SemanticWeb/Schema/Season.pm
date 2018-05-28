package SemanticWeb::Schema::Season;

# ABSTRACT: A media season e

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A media season e.g. tv, radio, video game etc.




=cut


around json_ld_type => sub { return 'Season' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;
