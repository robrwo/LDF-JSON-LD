package SemanticWeb::Schema::Enumeration;

# ABSTRACT: Lists or enumerations—for example

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Lists or enumerations—for example, a list of cuisines or music genres,
etc.




=head1 ATTRIBUTES


=head2 C<superseded_by>

C<supersededBy>

Relates a term (i.e. a property, class or enumeration) to one that
supersedes it.


A superseded_by should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Enumeration']>

=item C<InstanceOf['SemanticWeb::Schema::Property']>

=item C<InstanceOf['SemanticWeb::Schema::Class']>

=back

=cut

has superseded_by => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'supersededBy',
    json_ld_serializer => \&_serialize_superseded_by,
);

sub _serialize_superseded_by { $_[0]->_serializer('superseded_by') }




around json_ld_type => sub { return 'Enumeration' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'supersededBy' => \&_serialize_superseded_by,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;