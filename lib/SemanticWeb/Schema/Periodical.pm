package SemanticWeb::Schema::Periodical;

# ABSTRACT: A publication in any medium issued in successive parts bearing numerical or chronological designations and intended

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWorkSeries /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

A publication in any medium issued in successive parts bearing numerical or
chronological designations and intended, such as a magazine, scholarly
journal, or newspaper to continue indefinitely.</p> <p>See also <a
href="http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.
html">blog post</a>.

=end html




=cut


around json_ld_type => sub { return 'Periodical' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWorkSeries>

=cut

1;
