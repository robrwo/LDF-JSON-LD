package SemanticWeb::Schema::EmployeeRole;

# ABSTRACT: A subclass of OrganizationRole used to describe employee relationships.

use Moo;

extends qw/ SemanticWeb::Schema::OrganizationRole /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A subclass of OrganizationRole used to describe employee relationships.




=head1 ATTRIBUTES


=head2 C<base_salary>

C<baseSalary>

The base salary of the job or of an employee in an EmployeeRole.


A base_salary should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MonetaryAmount']>

=item C<Num>

=item C<InstanceOf['SemanticWeb::Schema::PriceSpecification']>

=back

=cut

has base_salary => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<salary_currency>

C<salaryCurrency>

=begin html

The currency (coded using <a
href="http://en.wikipedia.org/wiki/ISO_4217">ISO 4217</a> ) used for the
main salary information in this job posting or for this employee.

=end html


A salary_currency should be one of the following types:

=over

=item C<Str>

=back

=cut

has salary_currency => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'EmployeeRole' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'baseSalary' => $self->curry::_serializer('base_salary'),
       'salaryCurrency' => $self->curry::_serializer('salary_currency'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::OrganizationRole>

=cut

1;