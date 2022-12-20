"""This module contains code for the main command loop of the game."""

from .get_command import get_command
from .print_multiple_lines import print_multiple_lines
from .built_in_methods import print_
import sys

_MAP = "map"
_STATS = "stats"
_INVENTORY = "inventory"
_EQUIPMENT = "equipment"
_CONSUME_ITEM = "use item"
_DISCARD_ITEM = "discard item"
_EQUIP_ITEM = "equip item"
_UNEQUIP_ITEM = "unequip item"
_QUIT_GAME = "quit game"

_BASE_COMMANDS = [
    _MAP,
    _STATS,
    _INVENTORY,
    _EQUIPMENT,
    _CONSUME_ITEM,
    _DISCARD_ITEM,
    _EQUIP_ITEM,
    _UNEQUIP_ITEM,
    _QUIT_GAME,

]

def get_game_command(player, room, additional_commands=[]):
    """
    Get a general game command from the player and execute it.

    Arguments
    ---------
        player : Player
            The player.

        room : Room
            The room the player is currently in.

        additional_commands : Optional[list]
            A list of additional commands to allow the play to enter.

    Returns
    -------
    None

    """
    commands = additional_commands[:]
    commands.extend(_BASE_COMMANDS)

    while True:
        print_()
        command = get_command(commands, True)

        if command in additional_commands:
            return command

        if command == _MAP:
            print_multiple_lines(room.map.split("\n"), 1)

        if command == _STATS:
            player.stats_view()

        if command == _INVENTORY:
            player.inventory_view()

        if command == _EQUIPMENT:
            player.equipment_view()

        if command == _CONSUME_ITEM:
            player.use_item_interface()

        if command == _DISCARD_ITEM:
            player.discard_item_interface()

        if command == _EQUIP_ITEM:
            player.equip_item_interface()

        if command == _UNEQUIP_ITEM:
            player.unequip_item_interface()

        if command == _QUIT_GAME:
            sys.exit()
