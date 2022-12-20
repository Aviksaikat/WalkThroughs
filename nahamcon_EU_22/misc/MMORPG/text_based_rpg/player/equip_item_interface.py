from .. import interface, item
from .data import DATA
from .exceptions import ItemIsNotEquippableError

def equip_item_interface(player):
    """
    Display an interface to the user allowing them to equip items in their
    inventory.

    Arguments
    ---------
        player : Player
            The player.

    Returns
    -------
    str, None
        str "back" when the player cancels out of the interface.
        None when the player has no items in their inventory to equip.

    """
    while True:
        player.inventory_view(item.EQUIPPABLE)

        if not player.equippable_items:
            break

        commands = [str(i) for i in range(1, len(player.equippable_items) + 1)]
        commands.append("back")

        interface.print_(
            "You must enter " + interface.generate_readable_list(commands)
        )

        command = interface.get_command(commands)

        if command == "back":
            return command

        item_to_equip = player.equippable_items[int(command) - 1]

        try:
            player.equip(item_to_equip)
        except ItemIsNotEquippableError:
            interface.print_(DATA["messages"]["not_equippable"])
            continue

        interface.print_(
            DATA["messages"]["item_equipped"].format(item_to_equip.display_name)
        )

        for effect in item_to_equip.effects:
            message = None

            if effect.modifier < 0:
                message = DATA["messages"]["item_equipped_decreased"]
            else:
                message = DATA["messages"]["item_equipped_increased"]

            interface.print_(
                message.format(
                    stat=effect.stat,
                    amount=abs(effect.modifier)
                )
            )

        interface.print_()
