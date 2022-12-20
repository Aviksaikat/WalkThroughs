from .. import interface
from ..combat_entity import flags as combat_entity_flags

def run_player_attack_phase(battle):
    while True:
        battle.print_list_of_attacks()

        interface.print_()

        commands = battle.get_player_attack_commands()

        battle.print_player_message(
            "commands",
            interface.generate_readable_list(commands)
        )

        attack_name = interface.get_command(commands)

        if attack_name == battle.GO_BACK:
            return attack_name

        attack = battle.player.get_attack_from_name(attack_name)

        prior_enemy_health = battle.enemy.health

        attack_result = battle.player.entity.attack(battle.enemy, attack)

        if attack_result == combat_entity_flags.NOT_ENOUGH_STAMINA:
            battle.print_player_message("not_enough_stamina")
            continue

        if attack_result == combat_entity_flags.NOT_ENOUGH_MANA:
            battle.print_player_message("not_enough_mana")
            continue

        if attack_result == combat_entity_flags.ATTACK_WAS_EVADED:
            battle.print_enemy_message("player_attack_evaded")
            break

        if attack_result == combat_entity_flags.CRITICAL_HIT:
            battle.print_player_message("critical_hit")

        damage = prior_enemy_health - battle.enemy.health

        battle.print_damage_dealt_message(
            entity=battle.player,
            attack=attack,
            damage=damage
        )

        break
