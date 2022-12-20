from .. import interface
from ..combat_entity.data import DATA as COMBAT_ENTITY_DATA
from .data import DATA

def _print_line(player, value_name):
    """
    Print a line of the view displaying the player's stats.

    Arguments
    ---------
        player : Player
            The player.

        value_name : str
            The name of the stat to print the line for.
    """
    interface.print_(
        DATA["stats_view_line"].format(
            name=value_name.capitalize(),
            value=getattr(player.entity, value_name)
        )
    )

def stats_view(player):
    """
    Display a list of the items the player's stats.

    Arguments
    ---------
        player : Player
            The player.

    Returns
    -------
    None

    """
    for value_name in COMBAT_ENTITY_DATA["entity_values"]:
        _print_line(player, value_name)

    interface.print_()

    for stat_name in COMBAT_ENTITY_DATA["stats"]:
        _print_line(player, stat_name)
