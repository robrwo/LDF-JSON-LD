package LDF::ClassGenerator;

use v5.10;

use Moo;

use Carp;
use Const::Fast;
use List::Util 1.33 qw/ any pairgrep uniqstr /;
use Path::Tiny;
use RDF::Prefixes;
use RDF::Trine;
use Ref::Util qw/ is_plain_arrayref /;
use String::CamelCase qw/ decamelize /;
use Template;
use Text::Wrap qw/ wrap /;
use URI;

our $VERSION = 'v0.0.1';

const my $MAX_ABSTRACT_LENGTH => 44;    # See ExtUtils::ModuleMaker

const my %prefixes => (
    dc       => 'http://purl.org/dc/terms/',
    elements => 'http://purl.org/dc/elements/1.1/',
    rdf      => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
    rdfs     => 'http://www.w3.org/2000/01/rdf-schema#',
    schema   => 'http://schema.org/',
    og       => 'http://ogp.me/ns#',
);

has prefixes => (
    is      => 'lazy',
    builder => sub { RDF::Prefixes->new( \%prefixes ) },
);

sub stringify {
    my ( $self, $node ) = @_;

    if ( $node->isa('RDF::Trine::Node::Literal') ) {
        my $value = $node->literal_value;
        if ( defined $value ) {
            return $value;
        }
    }

    if ( $node->isa('RDF::Trine::Node::Resource') ) {
        my $value = $node->uri;
        if ( defined $value ) {
            return $self->prefixes->get_qname($value) // $value;
        }
    }

    return $node->stringify;
}

foreach my $prefix ( keys %prefixes ) {
    has $prefix => (
        is      => 'lazy',
        builder => sub {
            RDF::Trine::Namespace->new( $prefixes{$prefix} );
        },
    );

}

has definition => (
    is      => 'ro',
    default => sub {
        [
         ## 'http://dublincore.org/2012/06/14/dcterms.rdf',
         'http://schema.org/version/3.3/ext-meta.rdf',
         'http://schema.org/version/3.3/schema.rdf',
        ]
    },
);

has store => (
    is      => 'lazy',
    builder => sub {
        RDF::Trine::Store::Memory->new;
    },
);

has model => (
    is      => 'lazy',
    builder => sub {
        my ($self) = @_;

        my $defs = $self->definition;
        unless ( is_plain_arrayref($defs) ) {
            $defs = [$defs];
        }

        my $model = RDF::Trine::Model->new( $self->store );

        foreach my $url (@$defs) {
            RDF::Trine::Parser->parse_url_into_model( $url, $model, );
        }
        return $model;

    },
    handles => [qw/ get_statements /],
);

has trines => (
    is      => 'lazy',
    builder => sub {
        my ($self) = @_;

        my %trines;

        foreach ( $self->query(), ) {

            my $subj = $self->stringify( $_->subject );
            my $pred = $self->stringify( $_->predicate );
            my $obj  = $self->stringify( $_->object );

            $trines{$subj} //= {};

            if ( defined( my $vals = $trines{$subj}{$pred} ) ) {

                if ( is_plain_arrayref($vals) ) {
                    push @{ $trines{$subj}{$pred} }, $obj;

                }
                else {
                    $trines{$subj}{$pred} = [ $vals, $obj ];
                }

            }
            else {

                $trines{$subj}{$pred} = $obj;

            }

        }

        return \%trines;
    },
);

sub generate_class_from_trine {
    my ( $self, $subj ) = @_;

    my $trines = $self->trines;
    my $nodes = $trines->{$subj} or croak "Invalid subject: ${subj}";

    my $types = $nodes->{'rdf:type'} or return;
    $types = [$types] unless is_plain_arrayref($types);

    return if any { $_ eq 'schema:DataType' } @$types;

    return unless any { $_ eq 'rdfs:Class' } @$types;

    my $class_name = $self->label_to_package_name($subj);

    my ($prefix, $label) = split /:/, $subj;

    my %meta = (
        sources    => $self->definition,
        prefix     => $prefix,
        context    => $prefixes{$prefix},
        version    => $VERSION,
        class_name => $class_name,
        label      => $nodes->{'rdfs:label'},
        qname      => $subj,
    );

    my $comment = $nodes->{'rdfs:comment'};
    if ($comment) {

        my $abstract = $comment;
        $abstract =~ s/\s+/ /g;
        if ( length($abstract) > $MAX_ABSTRACT_LENGTH ) {
            $abstract =~ s/\..+$//;
        }
        if ( length($abstract) > $MAX_ABSTRACT_LENGTH ) {
            $abstract =~ s/\,.+$//;
        }

        $meta{abstract}    = $abstract;
        $meta{description} = $self->comment_to_pod($comment),;
    }

    if ( my $extends = $nodes->{'rdfs:subClassOf'} ) {
        $extends = [$extends] unless is_plain_arrayref($extends);
        $meta{parents} = [ map { $self->label_to_package_name($_) } @$extends ],
          ;
    }
    else {

        $meta{roles} = 'MooX::Role::JSON_LD';

    }

    $meta{attributes} = \my %attrs;

    my $properties = $self->get_properties_of_class($subj);

    foreach my $prop ( keys %{$properties} ) {

        my $node = $properties->{$prop};

        my $label = $node->{'rdfs:label'};

        my $name = decamelize($label);
        $name =~ s/\s/_/g;

        $attrs{$name} = {
            qname       => $prop,
            label       => $label,
            description => $self->comment_to_pod( $node->{'rdfs:comment'} ),
        };

        if ( my $types = $node->{'schema:rangeIncludes'} ) {
            $types = [$types] unless is_plain_arrayref($types);
            $attrs{$name}{types} = $self->translate_types( @$types );
        }

    }

    my $filename = $class_name;
    $filename =~ s/::/\//g;
    my $file    = path( 'lib', $filename . '.pm' );

    $file->parent->mkpath;

    my $engine = Template->new();

    $engine->process( 'etc/package.tt', \%meta, $file->openw );

}

sub translate_types {
    my $self = shift;

    my @types;

    # Note that ideally we'd use this to enforce type restrictions, in
    # which case we could allow them to be URI or DateTime objects as
    # appropriate. However, it's unclear how the JSON_LD role would
    # serialise them properly.
    #
    # The RDF specification does not seem to specify whether
    # properties are repeatable.

    while (my $type = shift) {

        if ($type eq 'schema:Text') {
            push @types, 'Str';
        }
        elsif ($type eq 'schema:Number') {
            push @types, 'Num';
        }
        elsif ($type eq 'schema:URL') {
            push @types, 'Str';
        }
        elsif ($type eq 'schema:Boolean') {
            push @types, 'Bool';
        }
        elsif ($type =~ /^schema:(Date(Time)?|Time)$/) {
            push @types, qw/ Str /;
        }
        else {
            push @types, "InstanceOf['" . $self->label_to_package_name($type) . "']";
        }

    }

    return [ uniqstr @types ];
}

sub comment_to_pod {
    my ( $self, $comment ) = @_;

    $comment =~ s/\s+/ /g;

    my $buffer = "";

    my $is_html = $comment =~ /\<\w+.*\>/;
    $buffer .= "=begin html\n\n" if $is_html;

    $buffer .= wrap( '', '', $comment ) . "\n\n";

    $buffer .= "=end html\n\n" if $is_html;

    return $buffer;
}

sub get_properties_of_class {
    my ( $self, $class ) = @_;

    my $trines     = $self->trines;
    my %properties = pairgrep {
        my $type = $b->{'rdf:type'} or return;
        my $range = $b->{'schema:domainIncludes'} // $b->{'rdfs:range'};

        return unless $range;

        $range = [$range] unless is_plain_arrayref($range);

        return $type =~ /^(?:rdf|schema):Property$/ && any { $_ eq $class } @$range;

    }
    %{$trines};

    return \%properties;
}

sub label_to_package_name {
    my ( $self, $qname ) = @_;

    my ( $prefix, $name ) = split /:/, $qname;

    return
        'LDF::'
      . ( $prefix =~ /^(?:schema|elements)$/ ? ucfirst($prefix) : uc($prefix) )
      . '::'
      . $name;

}

sub query {
    my ( $self, $subject, $predicate, $object ) = @_;

    my @res;

    my $rs = $self->get_statements( $subject, $predicate, $object );
    while ( my $st = $rs->next ) {
        push @res, $st;
    }

    return @res;
}

sub generate_all_classes {
    my ($self) = @_;

    my $trines     = $self->trines;

    foreach my $name (keys %$trines) {
        $self->generate_class_from_trine($name);
    }

}

package main;

use v5.10;
use DDP;

my $mg = LDF::ClassGenerator->new();

# definition_url => 'http://ogp.me/ns/ogp.me.rdf'

$mg->generate_all_classes;

# $mg->generate_class_from_trine('schema:WebPage');