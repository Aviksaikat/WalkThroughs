from .. import interface
from . import battle_util

def run_turn(battle):
    """
    Execute a turn in the battle, executing both the player's turn and the
    enemy's turn.

    Arguments
    ---------
        battle : Battle
            The Battle instance representing the battle.

    Returns
    -------
    None
    
    """
    if battle.first_turn:
        battle.first_turn = False
    else:
        interface.print_()

        for entity in battle.entities:
            battle.start_of_turn_value_recovery(entity)

    interface.print_()

    for entity in battle.entities:
        battle_util.print_value_view(entity)

    battle.run_player_turn()

    if battle.fled or battle.enemy.health == 0:
        return

    battle.run_enemy_turn()
