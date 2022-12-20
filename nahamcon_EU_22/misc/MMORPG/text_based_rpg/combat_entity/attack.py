from .. import util
from . import flags
from .data import DATA
from .generate_random_multiplier import generate_random_multiplier

def attack(attacking_entity, enemy, attack_to_use):
    """
    Execute the given entity attacking an opponent.

    Arguments
    ---------
        attacking_entity : CombatEntity
            The entity that is attacking.

        enemy : CombatEntity
            The entity that is being attacked.

        attack_to_use : Attack
            The attack the attacking entity is using.

    Returns
    -------
    object or None
        object if a flag was fired, equal to the fired flag.
        None otherwise.

    """
    if attack_to_use.stamina_cost > attacking_entity.stamina:
        return flags.NOT_ENOUGH_STAMINA

    if attack_to_use.mana_cost > attacking_entity.mana:
        return flags.NOT_ENOUGH_MANA

    attacking_entity.stamina -= attack_to_use.stamina_cost
    attacking_entity.mana -= attack_to_use.mana_cost

    attack_was_evaded = util.resolve_random_condition([
        (True, enemy.evasion),
        (False, attacking_entity.evasion)
    ])

    if attack_was_evaded:
        return flags.ATTACK_WAS_EVADED

    attack_stat = getattr(attacking_entity, attack_to_use.type.damage_stat)

    damage = attack_stat / enemy.defence * attack_to_use.damage

    critical_hit = util.resolve_random_condition([
        (True, attacking_entity.critical_hit_chance),
        (False, 100 - attacking_entity.critical_hit_chance)
    ])

    if critical_hit:
        damage *= DATA["critical_hit_multiplier"]

    damage *= generate_random_multiplier()
    damage = round(damage)

    enemy.health -= damage

    if critical_hit:
        return flags.CRITICAL_HIT
