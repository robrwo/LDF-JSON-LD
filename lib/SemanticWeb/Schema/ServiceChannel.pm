package SemanticWeb::Schema::ServiceChannel;

# ABSTRACT: A means for accessing a service, e

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

A means for accessing a service, e.g. a government office location, web
site, or phone number.




=head1 ATTRIBUTES


=head2 C<available_language>

C<availableLanguage>

=begin html

A language someone may use with or at the item, service or place. Please
use one of the language codes from the <a
href="http://tools.ietf.org/html/bcp47">IETF BCP 47 standard</a>. See also
<a class="localLink" href="http://schema.org/inLanguage">inLanguage</a>

=end html


A available_language should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['SemanticWeb::Schema::Language']>

=back

=cut

has available_language => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'availableLanguage',
    json_ld_serializer => \&_serialize_available_language,
);

sub _serialize_available_language { $_[0]->_serializer('available_language') }


=head2 C<processing_time>

C<processingTime>

Estimated processing time for the service using this channel.


A processing_time should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Duration']>

=back

=cut

has processing_time => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'processingTime',
    json_ld_serializer => \&_serialize_processing_time,
);

sub _serialize_processing_time { $_[0]->_serializer('processing_time') }


=head2 C<provides_service>

C<providesService>

The service provided by this channel.


A provides_service should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Service']>

=back

=cut

has provides_service => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'providesService',
    json_ld_serializer => \&_serialize_provides_service,
);

sub _serialize_provides_service { $_[0]->_serializer('provides_service') }


=head2 C<service_location>

C<serviceLocation>

The location (e.g. civic structure, local business, etc.) where a person
can go to access the service.


A service_location should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has service_location => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'serviceLocation',
    json_ld_serializer => \&_serialize_service_location,
);

sub _serialize_service_location { $_[0]->_serializer('service_location') }


=head2 C<service_phone>

C<servicePhone>

The phone number to use to access the service.


A service_phone should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ContactPoint']>

=back

=cut

has service_phone => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'servicePhone',
    json_ld_serializer => \&_serialize_service_phone,
);

sub _serialize_service_phone { $_[0]->_serializer('service_phone') }


=head2 C<service_postal_address>

C<servicePostalAddress>

The address for accessing the service by mail.


A service_postal_address should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::PostalAddress']>

=back

=cut

has service_postal_address => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'servicePostalAddress',
    json_ld_serializer => \&_serialize_service_postal_address,
);

sub _serialize_service_postal_address { $_[0]->_serializer('service_postal_address') }


=head2 C<service_sms_number>

C<serviceSmsNumber>

The number to access the service by text message.


A service_sms_number should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::ContactPoint']>

=back

=cut

has service_sms_number => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'serviceSmsNumber',
    json_ld_serializer => \&_serialize_service_sms_number,
);

sub _serialize_service_sms_number { $_[0]->_serializer('service_sms_number') }


=head2 C<service_url>

C<serviceUrl>

The website to access the service.


A service_url should be one of the following types:

=over

=item C<Str>

=back

=cut

has service_url => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'serviceUrl',
    json_ld_serializer => \&_serialize_service_url,
);

sub _serialize_service_url { $_[0]->_serializer('service_url') }




around json_ld_type => sub { return 'ServiceChannel' };

around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ $fields ? @$fields : (), {
       'availableLanguage' => \&_serialize_available_language,
       'processingTime' => \&_serialize_processing_time,
       'providesService' => \&_serialize_provides_service,
       'serviceLocation' => \&_serialize_service_location,
       'servicePhone' => \&_serialize_service_phone,
       'servicePostalAddress' => \&_serialize_service_postal_address,
       'serviceSmsNumber' => \&_serialize_service_sms_number,
       'serviceUrl' => \&_serialize_service_url,
    } ]
};

=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;