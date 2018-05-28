package SemanticWeb::Schema::Locksmith;

# ABSTRACT: A locksmith.

use Moo;

extends qw/ SemanticWeb::Schema::HomeAndConstructionBusiness /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A locksmith.




=cut


around json_ld_type => sub { return 'Locksmith' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::HomeAndConstructionBusiness>

=cut

1;
