from .. import interface
from .data import DATA

def equipment_view(player):
    """
    Display a list of the items the player currently has equipped.

    Arguments
    ---------
        player : Player
            The player.

    Returns
    -------
    None

    """
    if not player.equipped_items:
        interface.print_(DATA["equipment_view"]["no_items"])
        return

    for equip_location, item in player.equipped_items.items():
        interface.print_(
            DATA["equipment_view"]["item_line"].format(
                location=equip_location.capitalize(),
                name=item.display_name
            )
        )

        for effect in item.effects:
            message = None

            if effect.modifier < 0:
                message = DATA["equipment_view"]["decrease_effect"]
            else:
                message = DATA["equipment_view"]["increase_effect"]

            interface.print_(
                message.format(
                    stat=effect.stat,
                    amount=abs(effect.modifier)
                )
            )

        interface.print_()
