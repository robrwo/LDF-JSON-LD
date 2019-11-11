use utf8;

package SemanticWeb::Schema::JobPosting;

# ABSTRACT: A listing that describes a job opening in a certain organization.

use Moo;

extends qw/ SemanticWeb::Schema::Intangible /;


use MooX::JSON_LD 'JobPosting';
use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v5.0.0';

=encoding utf8

=head1 DESCRIPTION

A listing that describes a job opening in a certain organization.




=head1 ATTRIBUTES


=head2 C<applicant_location_requirements>

C<applicantLocationRequirements>

The location(s) applicants can apply from. This is usually used for
telecommuting jobs where the applicant does not need to be in a physical
office. Note: This should not be used for citizenship or work visa
requirements.


A applicant_location_requirements should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::AdministrativeArea']>

=back

=cut

has applicant_location_requirements => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'applicantLocationRequirements',
);


=head2 C<base_salary>

C<baseSalary>

The base salary of the job or of an employee in an EmployeeRole.


A base_salary should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MonetaryAmount']>

=item C<InstanceOf['SemanticWeb::Schema::PriceSpecification']>

=item C<Num>

=back

=cut

has base_salary => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'baseSalary',
);


=head2 C<benefits>



Description of benefits associated with the job.


A benefits should be one of the following types:

=over

=item C<Str>

=back

=cut

has benefits => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'benefits',
);


=head2 C<date_posted>

C<datePosted>

Publication date for the job posting.


A date_posted should be one of the following types:

=over

=item C<Str>

=back

=cut

has date_posted => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'datePosted',
);


=head2 C<education_requirements>

C<educationRequirements>

Educational background needed for the position or Occupation.


A education_requirements should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::EducationalOccupationalCredential']>

=item C<Str>

=back

=cut

has education_requirements => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'educationRequirements',
);


=head2 C<employment_type>

C<employmentType>

Type of employment (e.g. full-time, part-time, contract, temporary,
seasonal, internship).


A employment_type should be one of the following types:

=over

=item C<Str>

=back

=cut

has employment_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'employmentType',
);


=head2 C<employment_unit>

C<employmentUnit>

Indicates the department, unit and/or facility where the employee reports
and/or in which the job is to be performed.


A employment_unit should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has employment_unit => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'employmentUnit',
);


=head2 C<estimated_salary>

C<estimatedSalary>

An estimated salary for a job posting or occupation, based on a variety of
variables including, but not limited to industry, job title, and location.
Estimated salaries are often computed by outside organizations rather than
the hiring organization, who may not have committed to the estimated value.


A estimated_salary should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::MonetaryAmount']>

=item C<InstanceOf['SemanticWeb::Schema::MonetaryAmountDistribution']>

=item C<Num>

=back

=cut

has estimated_salary => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'estimatedSalary',
);


=head2 C<experience_requirements>

C<experienceRequirements>

Description of skills and experience needed for the position or Occupation.


A experience_requirements should be one of the following types:

=over

=item C<Str>

=back

=cut

has experience_requirements => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'experienceRequirements',
);


=head2 C<hiring_organization>

C<hiringOrganization>

Organization offering the job position.


A hiring_organization should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Organization']>

=back

=cut

has hiring_organization => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'hiringOrganization',
);


=head2 C<incentive_compensation>

C<incentiveCompensation>

Description of bonus and commission compensation aspects of the job.


A incentive_compensation should be one of the following types:

=over

=item C<Str>

=back

=cut

has incentive_compensation => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'incentiveCompensation',
);


=head2 C<incentives>



Description of bonus and commission compensation aspects of the job.


A incentives should be one of the following types:

=over

=item C<Str>

=back

=cut

has incentives => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'incentives',
);


=head2 C<industry>



The industry associated with the job position.


A industry should be one of the following types:

=over

=item C<Str>

=back

=cut

has industry => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'industry',
);


=head2 C<job_benefits>

C<jobBenefits>

Description of benefits associated with the job.


A job_benefits should be one of the following types:

=over

=item C<Str>

=back

=cut

has job_benefits => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'jobBenefits',
);


=head2 C<job_immediate_start>

C<jobImmediateStart>

An indicator as to whether a position is available for an immediate start.


A job_immediate_start should be one of the following types:

=over

=item C<Bool>

=back

=cut

has job_immediate_start => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'jobImmediateStart',
);


=head2 C<job_location>

C<jobLocation>

A (typically single) geographic location associated with the job position.


A job_location should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Place']>

=back

=cut

has job_location => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'jobLocation',
);


=head2 C<job_location_type>

C<jobLocationType>

A description of the job location (e.g TELECOMMUTE for telecommute jobs).


A job_location_type should be one of the following types:

=over

=item C<Str>

=back

=cut

has job_location_type => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'jobLocationType',
);


=head2 C<job_start_date>

C<jobStartDate>

The date on which a successful applicant for this job would be expected to
start work. Choose a specific date in the future or use the
jobImmediateStart property to indicate the position is to be filled as soon
as possible.


A job_start_date should be one of the following types:

=over

=item C<Str>

=back

=cut

has job_start_date => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'jobStartDate',
);


=head2 C<occupational_category>

C<occupationalCategory>

=begin html

<p>A category describing the job, preferably using a term from a taxonomy
such as <a href="http://www.onetcenter.org/taxonomy.html">BLS
O*NET-SOC</a>, <a
href="https://www.ilo.org/public/english/bureau/stat/isco/isco08/">ISCO-08<
/a> or similar, with the property repeated for each applicable value.
Ideally the taxonomy should be identified, and both the textual label and
formal code for the category should be provided.<br/><br/> Note: for
historical reasons, any textual label and formal code provided as a literal
may be assumed to be from O*NET-SOC.<p>

=end html


A occupational_category should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::CategoryCode']>

=item C<Str>

=back

=cut

has occupational_category => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'occupationalCategory',
);


=head2 C<qualifications>



Specific qualifications required for this role or Occupation.


A qualifications should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::EducationalOccupationalCredential']>

=item C<Str>

=back

=cut

has qualifications => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'qualifications',
);


=head2 C<relevant_occupation>

C<relevantOccupation>

The Occupation for the JobPosting.


A relevant_occupation should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Occupation']>

=back

=cut

has relevant_occupation => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'relevantOccupation',
);


=head2 C<responsibilities>



Responsibilities associated with this role or Occupation.


A responsibilities should be one of the following types:

=over

=item C<Str>

=back

=cut

has responsibilities => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'responsibilities',
);


=head2 C<salary_currency>

C<salaryCurrency>

=begin html

<p>The currency (coded using <a
href="http://en.wikipedia.org/wiki/ISO_4217">ISO 4217</a> ) used for the
main salary information in this job posting or for this employee.<p>

=end html


A salary_currency should be one of the following types:

=over

=item C<Str>

=back

=cut

has salary_currency => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'salaryCurrency',
);


=head2 C<skills>



A statement of knowledge, skill, ability, task or any other assertion
expressing a competency that is desired or required to fulfill this role or
to work in this occupation.


A skills should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::DefinedTerm']>

=item C<Str>

=back

=cut

has skills => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'skills',
);


=head2 C<special_commitments>

C<specialCommitments>

Any special commitments associated with this job posting. Valid entries
include VeteranCommit, MilitarySpouseCommit, etc.


A special_commitments should be one of the following types:

=over

=item C<Str>

=back

=cut

has special_commitments => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'specialCommitments',
);


=head2 C<title>



The title of the job.


A title should be one of the following types:

=over

=item C<Str>

=back

=cut

has title => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'title',
);


=head2 C<total_job_openings>

C<totalJobOpenings>

The number of positions open for this job posting. Use a positive integer.
Do not use if the number of positions is unclear or not known.


A total_job_openings should be one of the following types:

=over

=item C<InstanceOf['SemanticWeb::Schema::Integer']>

=back

=cut

has total_job_openings => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'totalJobOpenings',
);


=head2 C<valid_through>

C<validThrough>

The date after when the item is not valid. For example the end of an offer,
salary period, or a period of opening hours.


A valid_through should be one of the following types:

=over

=item C<Str>

=back

=cut

has valid_through => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'validThrough',
);


=head2 C<work_hours>

C<workHours>

The typical working hours for this job (e.g. 1st shift, night shift,
8am-5pm).


A work_hours should be one of the following types:

=over

=item C<Str>

=back

=cut

has work_hours => (
    is        => 'rw',
    predicate => 1,
    json_ld   => 'workHours',
);




=head1 SEE ALSO



L<SemanticWeb::Schema::Intangible>

=cut

1;
