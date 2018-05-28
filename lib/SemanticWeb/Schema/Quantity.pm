package SemanticWeb::Schema::Quantity;

# ABSTRACT: Quantities such as distance

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Quantities such as distance, time, mass, weight, etc. Particular instances
of say Mass are entities like '3 Kg' or '4 milligrams'.




=cut


around json_ld_type => sub { return 'Quantity' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;
