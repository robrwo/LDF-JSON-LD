package LDF::Schema::Periodical;

# ABSTRACT: A publication in any medium issued in successive parts bearing numerical or chronological designations and intended

use Moo;

extends qw/ LDF::Schema::CreativeWorkSeries /;


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



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=cut


=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Periodical' }



=head1 SEE ALSO



L<LDF::Schema::CreativeWorkSeries>

=cut

1;
