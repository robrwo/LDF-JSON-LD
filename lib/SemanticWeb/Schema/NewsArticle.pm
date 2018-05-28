package SemanticWeb::Schema::NewsArticle;

# ABSTRACT: A NewsArticle is an article whose content reports news

use Moo;

extends qw/ SemanticWeb::Schema::Article /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

=begin html

A NewsArticle is an article whose content reports news, or provides
background context and supporting materials for understanding the news.</p>
<p>A more detailed overview of <a href="/docs/news.html">schema.org News
markup</a> is also available.

=end html




=head1 ATTRIBUTES


=head2 C<dateline>



=begin html

A <a href="https://en.wikipedia.org/wiki/Dateline">dateline</a> is a brief
piece of text included in news articles that describes where and when the
story was written or filed though the date is often omitted. Sometimes only
a placename is provided.

=end html


A dateline should be one of the following types:

=over

=item C<Str>

=back

=cut

has dateline => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'dateline',
    json_ld_serializer => \&_serialize_dateline,
);

sub _serialize_dateline { $_[0]->_serializer('dateline') }


=head2 C<print_column>

C<printColumn>

The number of the column in which the NewsArticle appears in the print
edition.


A print_column should be one of the following types:

=over

=item C<Str>

=back

=cut

has print_column => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'printColumn',
    json_ld_serializer => \&_serialize_print_column,
);

sub _serialize_print_column { $_[0]->_serializer('print_column') }


=head2 C<print_edition>

C<printEdition>

The edition of the print product in which the NewsArticle appears.


A print_edition should be one of the following types:

=over

=item C<Str>

=back

=cut

has print_edition => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'printEdition',
    json_ld_serializer => \&_serialize_print_edition,
);

sub _serialize_print_edition { $_[0]->_serializer('print_edition') }


=head2 C<print_page>

C<printPage>

If this NewsArticle appears in print, this field indicates the name of the
page on which the article is found. Please note that this field is intended
for the exact page name (e.g. A5, B18).


A print_page should be one of the following types:

=over

=item C<Str>

=back

=cut

has print_page => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'printPage',
    json_ld_serializer => \&_serialize_print_page,
);

sub _serialize_print_page { $_[0]->_serializer('print_page') }


=head2 C<print_section>

C<printSection>

If this NewsArticle appears in print, this field indicates the print
section in which the article appeared.


A print_section should be one of the following types:

=over

=item C<Str>

=back

=cut

has print_section => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'printSection',
    json_ld_serializer => \&_serialize_print_section,
);

sub _serialize_print_section { $_[0]->_serializer('print_section') }




around json_ld_type => sub { return 'NewsArticle' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'dateline' => \&_serialize_dateline,
       'printColumn' => \&_serialize_print_column,
       'printEdition' => \&_serialize_print_edition,
       'printPage' => \&_serialize_print_page,
       'printSection' => \&_serialize_print_section,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Article>

=cut

1;
