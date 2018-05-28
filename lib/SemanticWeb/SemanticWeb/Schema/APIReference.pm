package SemanticWeb::Schema::APIReference;

# ABSTRACT: Reference documentation for application programming interfaces (APIs).

use Moo;

extends qw/ SemanticWeb::Schema::TechArticle /;


use curry;
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

Reference documentation for application programming interfaces (APIs).




=head1 ATTRIBUTES


=head2 C<assembly>



Library file name e.g., mscorlib.dll, system.web.dll.


A assembly should be one of the following types:

=over

=item C<Str>

=back

=cut

has assembly => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<assembly_version>

C<assemblyVersion>

Associated product/technology version. e.g., .NET Framework 4.5.


A assembly_version should be one of the following types:

=over

=item C<Str>

=back

=cut

has assembly_version => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<executable_library_name>

C<executableLibraryName>

Library file name e.g., mscorlib.dll, system.web.dll.


A executable_library_name should be one of the following types:

=over

=item C<Str>

=back

=cut

has executable_library_name => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<programming_model>

C<programmingModel>

Indicates whether API is managed or unmanaged.


A programming_model should be one of the following types:

=over

=item C<Str>

=back

=cut

has programming_model => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<target_platform>

C<targetPlatform>

Type of app development: phone, Metro style, desktop, XBox, etc.


A target_platform should be one of the following types:

=over

=item C<Str>

=back

=cut

has target_platform => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'APIReference' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields, {
       'assembly' => $self->curry::_serializer('assembly'),
       'assemblyVersion' => $self->curry::_serializer('assembly_version'),
       'executableLibraryName' => $self->curry::_serializer('executable_library_name'),
       'programmingModel' => $self->curry::_serializer('programming_model'),
       'targetPlatform' => $self->curry::_serializer('target_platform'),
    } ]
};




=head1 SEE ALSO



L<SemanticWeb::Schema::TechArticle>

=cut

1;