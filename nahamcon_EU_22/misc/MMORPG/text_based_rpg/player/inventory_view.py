from .. import interface
from .data import DATA
from .. import item

def inventory_view(player, item_type=None):
    """
    Display a list of the items the player currently has in their inventory.

    Arguments
    ---------
        player : Player
            The player.

    Returns
    -------
    None

    """
    if not player.inventory:
        interface.print_(DATA["inventory_view"]["no_items"])
        return

    if item_type == item.CONSUMABLE and not player.consumable_items:
        interface.print_(DATA["inventory_view"]["no_consumable_items"])
        return

    if item_type == item.EQUIPPABLE and not player.equippable_items:
        interface.print_(DATA["inventory_view"]["no_equippable_items"])
        return

    items_to_show = []

    for inventory_item in player.inventory:
        if not item_type or item_type == inventory_item.type:
            items_to_show.append(inventory_item)

    for index, inventory_item in enumerate(items_to_show):
        interface.print_(
            DATA["inventory_view"]["item_line"].format(
                number=index + 1,
                name=inventory_item.display_name
            )
        )

        for effect in inventory_item.effects:
            message = None

            if effect.modifier < 0:
                message = DATA["inventory_view"]["decrease_effect"]
            else:
                message = DATA["inventory_view"]["increase_effect"]

            interface.print_(
                message.format(
                    stat=effect.stat,
                    amount=abs(effect.modifier)
                )
            )

        interface.print_()
