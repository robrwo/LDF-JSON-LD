package LDF::Schema::Book;

# ABSTRACT: A book.

use Moo;

extends qw/ LDF::Schema::CreativeWork /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A book.



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=head1 ATTRIBUTES


=head2 C<book_edition>

C<bookEdition>

The edition of the book.


A book_edition should be one of the following types:

=over

=item C<Str>

=back

=cut

has book_edition => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<book_format>

C<bookFormat>

The format of the book.


A book_format should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::BookFormatType']>

=back

=cut

has book_format => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<illustrator>



The illustrator of the book.


A illustrator should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::Person']>

=back

=cut

has illustrator => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<isbn>



The ISBN of the book.


A isbn should be one of the following types:

=over

=item C<Str>

=back

=cut

has isbn => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<number_of_pages>

C<numberOfPages>

The number of pages in the book.


A number_of_pages should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::Integer']>

=back

=cut

has number_of_pages => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Book' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields,
      { bookEdition => 'book_edition' },
      { bookFormat => 'book_format' },
      { illustrator => 'illustrator' },
      { isbn => 'isbn' },
      { numberOfPages => 'number_of_pages' },
    ]
};




=head1 SEE ALSO



L<LDF::Schema::CreativeWork>

=cut

1;