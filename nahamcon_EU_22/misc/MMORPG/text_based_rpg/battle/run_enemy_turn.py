import random

from .. import interface
from ..combat_entity import flags as combat_entity_flags
from .data import DATA

def run_enemy_turn(battle):
    """
    Execute the enemy's turn in the battle.

    Arguments
    ---------
        battle : Battle
            The Battle instance representing the battle.

    Returns
    -------
    None
    
    """
    if not len(battle.enemy.usable_attacks):
        battle.rest(battle.enemy)
        return

    prior_player_health = battle.player.entity.health

    attack_to_use = random.choice(battle.enemy.usable_attacks)

    attack_result = battle.enemy.attack(battle.player.entity, attack_to_use)

    if attack_result == combat_entity_flags.ATTACK_WAS_EVADED:
        interface.print_(DATA["messages"]["player"]["enemy_attack_evaded"])
        return

    if attack_result == combat_entity_flags.CRITICAL_HIT:
        interface.print_(DATA["messages"]["enemy"]["critical_hit"])

    damage = prior_player_health - battle.player.entity.health

    battle.print_damage_dealt_message(
        entity=battle.enemy,
        attack=attack_to_use,
        damage=damage
    )
