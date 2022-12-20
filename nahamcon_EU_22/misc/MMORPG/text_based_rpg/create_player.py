"""
This modules handles the interface and the logic behind creating the player's
character.
"""

from . import interface
from .combat_entity import CombatEntity
from .player import Player
from . import attack

_ENTITY_DISPLAY_NAME = "You"
_CRITICAL_HIT_CHANCE = 4

_WARRIOR = "warrior"
_ARCHER = "archer"
_MAGE = "mage"
_CLASSES = [_WARRIOR, _ARCHER, _MAGE]

_PUNCH_ATTACK = attack.Attack(
    name="punch",
    display_name="Punch",
    type_=attack.MELEE,
    damage=1,
    stamina_cost=2,
    description_of_being_used="punch"
)

_WARRIOR_ENTITY = CombatEntity(
    display_name=_ENTITY_DISPLAY_NAME,
    attacks=[_PUNCH_ATTACK],
    maximum_health=30,
    maximum_stamina=30,
    strength=8,
    defence=10,
    dexterity=20,
    composure=20,
    critical_hit_chance=_CRITICAL_HIT_CHANCE
)

_ARCHER_ENTITY = CombatEntity(
    display_name=_ENTITY_DISPLAY_NAME,
    attacks=[_PUNCH_ATTACK],
    maximum_health=30,
    maximum_stamina=20,
    strength=4,
    archery=15,
    defence=6,
    dexterity=20,
    composure=15,
    critical_hit_chance=_CRITICAL_HIT_CHANCE
)

_MAGE_ENTITY = CombatEntity(
    display_name=_ENTITY_DISPLAY_NAME,
    attacks=[_PUNCH_ATTACK],
    maximum_health=30,
    maximum_mana=20,
    magic=12,
    strength=2,
    defence=6,
    dexterity=20,
    composure=12,
    critical_hit_chance=_CRITICAL_HIT_CHANCE
)

def create_player():
    """
    Display an interface that allows the player to create their character.

    Returns
    -------
    Player
        The Player instance representing the player.
    """
    interface.print_multiple_lines([
        "On your adventure you may be a warrior, an archer, or a mage.",
        "Which do you choose?"
    ])

    command = interface.get_command(_CLASSES)

    interface.print_("You have chosen the role of a {}.".format(command))
    interface.print_()

    if command == _WARRIOR:
        return Player(_WARRIOR_ENTITY, "warrior")

    if command == _ARCHER:
        return Player(_ARCHER_ENTITY, "archer")

    return Player(_MAGE_ENTITY, "mage")
