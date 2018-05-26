package LDF::Schema::Game;

# ABSTRACT: The Game type represents things which are games

use Moo;

extends qw/ LDF::Schema::CreativeWork /;


use Ref::Util qw/ is_plain_hashref /;
# RECOMMEND PREREQ: Ref::Util::XS

use namespace::autoclean;

our $VERSION = 'v0.0.1';

=head1 DESCRIPTION

The Game type represents things which are games. These are typically
rule-governed recreational activities, e.g. role-playing games in which
players assume the role of characters in a fictional setting.



Note that this class was generated automatically from the following sources:

=over

=item L<http://schema.org/version/3.3/ext-meta.rdf>

=item L<http://schema.org/version/3.3/schema.rdf>

=back


=head1 ATTRIBUTES


=head2 C<character_attribute>

C<characterAttribute>

A piece of data that represents a particular aspect of a fictional
character (skill, power, character points, advantage, disadvantage).


A character_attribute should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::Thing']>

=back

=cut

has character_attribute => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<game_item>

C<gameItem>

An item is an object within the game world that can be collected by a
player or, occasionally, a non-player character.


A game_item should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::Thing']>

=back

=cut

has game_item => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<game_location>

C<gameLocation>

Real or fictional location of the game (or part of game).


A game_location should be one of the following types:

=over

=item C<Str>

=item C<InstanceOf['LDF::Schema::Place']>

=item C<InstanceOf['LDF::Schema::PostalAddress']>

=back

=cut

has game_location => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<number_of_players>

C<numberOfPlayers>

Indicate how many people can play this game (minimum, maximum, or range).


A number_of_players should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::QuantitativeValue']>

=back

=cut

has number_of_players => (
    is        => 'rw',
    predicate => 1,
);


=head2 C<quest>



The task that a player-controlled character, or group of characters may
complete in order to gain a reward.


A quest should be one of the following types:

=over

=item C<InstanceOf['LDF::Schema::Thing']>

=back

=cut

has quest => (
    is        => 'rw',
    predicate => 1,
);




=head1 METHODS

=head2 C<json_ld_type>

Defines the type for L<MooX::Role::JSON_LD>

=cut

sub json_ld_type { 'Game' }



=head2 C<json_ld_fields>

Specifies the fields for L<MooX::Role::JSON_LD>

=cut



around json_ld_fields => sub {
    my ($next, $self) = @_;
    my $fields = $self->$next;
    [ @$fields,
      { characterAttribute => 'character_attribute' },
      { gameItem => 'game_item' },
      { gameLocation => 'game_location' },
      { numberOfPlayers => 'number_of_players' },
      { quest => 'quest' },
    ]
};




=head1 SEE ALSO



L<LDF::Schema::CreativeWork>

=cut

1;