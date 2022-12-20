from .. import interface
from .data import DATA

def unequip_item_interface(player):
    """
    Display an interface to the user allowing them to unequip items they have equipped.

    Arguments
    ---------
        player : Player
            The player.

    Returns
    -------
    str, None
        str "back" when the player cancels out of the interface.
        None when the player has no items equipped to unequip.

    """
    if not player.equipped_items:
        interface.print_(DATA["equipment_view"]["no_items"])
        return

    while True:
        player.equipment_view()

        commands = [location for location in player.equipped_items]
        commands.append("back")

        interface.print_(
            "You must enter " + interface.generate_readable_list(commands)
        )

        command = interface.get_command(commands)

        if command == "back":
            return command

        item_to_unequip = player.equipped_items[command]
        player.unequip(command)

        interface.print_(
            DATA["messages"]["item_unequipped"].format(
                item_to_unequip.display_name
            )
        )
