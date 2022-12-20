from .. import util
from . import battle_util, commands, print_list_of_attacks, rest, \
    run_enemy_turn, run_player_attack_phase, run_player_turn, run_turn, run, \
    start_of_turn_value_recovery

class Battle:
    """
    A class for representing battles.
    """

    def __init__(self, player, enemy):
        """
        Arguments
        ---------
            player : Player
                The player.

            enemy : CombatEntity
                The enemy.
        """
        util.set_multiple_attributes(
            self,
            player=player,
            enemy=enemy,
            entities=[player.entity, enemy],
            first_turn=True,
            fled=False
        )

    get_entity_name = battle_util.get_entity_name
    get_opponent = battle_util.get_opponent
    print_player_message = battle_util.print_player_message
    print_enemy_message = battle_util.print_enemy_message
    print_damage_dealt_message = battle_util.print_damage_dealt_message

    ATTACK = commands.ATTACK
    REST = commands.REST
    USE_ITEM = commands.USE_ITEM
    GO_BACK = commands.GO_BACK
    TURN_COMMANDS = commands.TURN_COMMANDS
    get_player_attack_commands = commands.get_player_attack_commands

    start_of_turn_value_recovery = \
        start_of_turn_value_recovery.start_of_turn_value_recovery
    print_list_of_attacks = print_list_of_attacks.print_list_of_attacks
    rest = rest.rest
    run_enemy_turn = run_enemy_turn.run_enemy_turn
    run_player_attack_phase = run_player_attack_phase.run_player_attack_phase
    run_player_turn = run_player_turn.run_player_turn
    run_turn = run_turn.run_turn
    run = run.run
