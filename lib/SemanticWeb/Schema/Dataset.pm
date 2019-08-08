use utf8;

package SemanticWeb::Schema::Dataset;

# ABSTRACT: A body of structured information describing some topic(s) of interest.

use Moo;

extends qw/ SemanticWeb::Schema::CreativeWork /;


use MooX::JSON_LD 'Dataset';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v3.9.1';

=encoding utf8

=head1 DESCRIPTION

A body of structured information describing some topic(s) of interest.




=head1 ATTRIBUTES


=head2 C<catalog>



A data catalog which contains this dataset.


A catalog should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DataCatalog']>

=back

=cut

has catalog => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'catalog',
);


=head2 C<dataset_time_interval>

C<datasetTimeInterval>

The range of temporal applicability of a dataset, e.g. for a 2011 census
dataset, the year 2011 (in ISO 8601 time interval format).


A dataset_time_interval should be one of the following types:

=over

=item C<Str>

=back

=cut

has dataset_time_interval => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'datasetTimeInterval',
);


=head2 C<distribution>



A downloadable form of this dataset, at a specific location, in a specific
format.


A distribution should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DataDownload']>

=back

=cut

has distribution => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'distribution',
);


=head2 C<included_data_catalog>

C<includedDataCatalog>

A data catalog which contains this dataset (this property was previously
'catalog', preferred name is now 'includedInDataCatalog').


A included_data_catalog should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DataCatalog']>

=back

=cut

has included_data_catalog => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'includedDataCatalog',
);


=head2 C<included_in_data_catalog>

C<includedInDataCatalog>

A data catalog which contains this dataset.


A included_in_data_catalog should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DataCatalog']>

=back

=cut

has included_in_data_catalog => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'includedInDataCatalog',
);


=head2 C<issn>



The International Standard Serial Number (ISSN) that identifies this serial
publication. You can repeat this property to identify different formats of,
or the linking ISSN (ISSN-L) for, this serial publication.


A issn should be one of the following types:

=over

=item C<Str>

=back

=cut

has issn => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'issn',
);


=head2 C<measurement_technique>

C<measurementTechnique>

=begin html

A technique or technology used in a <a class="localLink"
href="http://schema.org/Dataset">Dataset</a> (or <a class="localLink"
href="http://schema.org/DataDownload">DataDownload</a>, <a
class="localLink" href="http://schema.org/DataCatalog">DataCatalog</a>),
corresponding to the method used for measuring the corresponding
variable(s) (described using <a class="localLink"
href="http://schema.org/variableMeasured">variableMeasured</a>). This is
oriented towards scientific and scholarly dataset publication but may have
broader applicability; it is not intended as a full representation of
measurement, but rather as a high level summary for dataset
discovery.<br/><br/> For example, if <a class="localLink"
href="http://schema.org/variableMeasured">variableMeasured</a> is: molecule
concentration, <a class="localLink"
href="http://schema.org/measurementTechnique">measurementTechnique</a>
could be: "mass spectrometry" or "nmr spectroscopy" or "colorimetry" or
"immunofluorescence".<br/><br/> If the <a class="localLink"
href="http://schema.org/variableMeasured">variableMeasured</a> is
"depression rating", the <a class="localLink"
href="http://schema.org/measurementTechnique">measurementTechnique</a>
could be "Zung Scale" or "HAM-D" or "Beck Depression Inventory".<br/><br/>
If there are several <a class="localLink"
href="http://schema.org/variableMeasured">variableMeasured</a> properties
recorded for some given data object, use a <a class="localLink"
href="http://schema.org/PropertyValue">PropertyValue</a> for each <a
class="localLink"
href="http://schema.org/variableMeasured">variableMeasured</a> and attach
the corresponding <a class="localLink"
href="http://schema.org/measurementTechnique">measurementTechnique</a>.

=end html


A measurement_technique should be one of the following types:

=over

=item C<Str>

=back

=cut

has measurement_technique => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'measurementTechnique',
);


=head2 C<variable_measured>

C<variableMeasured>

The variableMeasured property can indicate (repeated as necessary) the
variables that are measured in some dataset, either described as text or as
pairs of identifier and description using PropertyValue.


A variable_measured should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::PropertyValue']>

=item C<Str>

=back

=cut

has variable_measured => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'variableMeasured',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::CreativeWork>

=cut

1;
