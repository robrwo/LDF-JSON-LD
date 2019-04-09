use utf8;

package SemanticWeb::Schema::Report;

# ABSTRACT: A Report generated by governmental or non-governmental organization.

use Moo;

extends qw/ SemanticWeb::Schema::Article /;


use MooX::JSON_LD 'Report';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.5.1';

=encoding utf8

=head1 DESCRIPTION

A Report generated by governmental or non-governmental organization.




=head1 ATTRIBUTES


=head2 C<report_number>

C<reportNumber>

The number or other unique designator assigned to a Report by the
publishing organization.


A report_number should be one of the following types:

=over

=item C<Str>

=back

=cut

has report_number => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'reportNumber',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Article>

=cut

1;
