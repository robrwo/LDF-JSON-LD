package SemanticWeb::Schema::Synagogue;

# ABSTRACT: A synagogue.

use Moo;

extends qw/ SemanticWeb::Schema::PlaceOfWorship /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A synagogue.




=cut


around json_ld_type => sub { return 'Synagogue' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::PlaceOfWorship>

=cut

1;
