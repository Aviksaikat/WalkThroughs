from .. import interface

def run_player_turn(battle):
    """
    Execute the player's turn in the battle, seeking input from the player as to
    what to do.

    Arguments
    ---------
        battle : Battle
            The Battle instance representing the battle.

    Returns
    -------
    None

    """
    # Loop allows for the player to cancel choices, execute commands after using
    # items.
    while True:
        battle.print_player_message(
            "commands",
            interface.generate_readable_list(battle.TURN_COMMANDS)
        )
        command = interface.get_command(battle.TURN_COMMANDS)

        if command == battle.REST:
            battle.rest(battle.player.entity)
            break

        if command == battle.USE_ITEM:
            result = battle.player.use_item_interface()

            if result != battle.GO_BACK:
                break

        if command == battle.ATTACK:
            result = battle.run_player_attack_phase()

            if result != battle.GO_BACK:
                break
