package SemanticWeb::Schema::AutoDealer;

# ABSTRACT: An car dealership.

use Moo;

extends qw/ SemanticWeb::Schema::AutomotiveBusiness /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An car dealership.




=cut


around json_ld_type => sub { return 'AutoDealer' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::AutomotiveBusiness>

=cut

1;
