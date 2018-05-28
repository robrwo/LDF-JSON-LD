package SemanticWeb::Schema::ElementarySchool;

# ABSTRACT: An elementary school.

use Moo;

extends qw/ SemanticWeb::Schema::EducationalOrganization /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

An elementary school.




=cut


around json_ld_type => sub { return 'ElementarySchool' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::EducationalOrganization>

=cut

1;
