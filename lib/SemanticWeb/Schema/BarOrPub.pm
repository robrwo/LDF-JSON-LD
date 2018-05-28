package SemanticWeb::Schema::BarOrPub;

# ABSTRACT: A bar or pub.

use Moo;

extends qw/ SemanticWeb::Schema::FoodEstablishment /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A bar or pub.




=cut


around json_ld_type => sub { return 'BarOrPub' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::FoodEstablishment>

=cut

1;
