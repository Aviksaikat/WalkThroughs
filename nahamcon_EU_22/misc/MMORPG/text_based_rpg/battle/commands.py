"""
This module contains constants and methods relating to commands that can be used
in the battle.
"""

ATTACK = "attack"
REST = "rest"
USE_ITEM = "use item"
GO_BACK = "back"
TURN_COMMANDS = [ATTACK, REST, USE_ITEM]

def get_player_attack_commands(battle):
    """
    Get the list of commands the play can use in the attack phase in the battle.

    Arguments
    ---------
        battle : Battle
            The Battle instance representing the battle.

    Returns
    -------
    list
        The list of commands the player can use in the attack phase.
    """
    commands = battle.player.attack_names[:]()
    commands.append(GO_BACK)
    return commands
