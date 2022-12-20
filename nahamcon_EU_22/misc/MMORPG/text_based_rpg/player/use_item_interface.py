from .. import interface, item
from .data import DATA
from .exceptions import ItemIsNotConsumableError

def use_item_interface(player):
    """
    Display an interface to the user allowing them to use items in their
    inventory.

    Arguments
    ---------
        player : Player
            The player.

    Returns
    -------
    str, None
        str "back" when the player cancels out of the interface.
        None when the player has no items in their inventory to use.

    """
    while True:
        player.inventory_view(item.CONSUMABLE)

        if not player.consumable_items:
            break

        commands = [str(i) for i in range(1, len(player.consumable_items) + 1)]
        commands.append("back")

        interface.print_(
            "You must enter " + interface.generate_readable_list(commands)
        )

        command = interface.get_command(commands)

        if command == "back":
            return command

        item_to_use = player.consumable_items[int(command) - 1]

        prior_health = player.entity.health
        prior_stamina = player.entity.stamina
        prior_mana = player.entity.mana

        try:
            player.consume(item_to_use)
        except ItemIsNotConsumableError:
            interface.print_(DATA["messages"]["not_consumable"])
            continue

        interface.print_(
            DATA["messages"]["item_consumed"].format(item_to_use.display_name)
        )

        health_restored = player.entity.health - prior_health
        stamina_restored = player.entity.stamina - prior_stamina
        mana_restored = player.entity.mana - prior_mana

        if health_restored:
            interface.print_(
                DATA["messages"]["item_consumed_effect"].format(
                    amount=health_restored,
                    value="health"
                )
            )

        if stamina_restored:
            interface.print_(
                DATA["messages"]["item_consumed_effect"].format(
                    amount=stamina_restored,
                    value="stamina"
                )
            )

        if mana_restored:
            interface.print_(
                DATA["messages"]["item_consumed_effect"].format(
                    amount=mana_restored,
                    value="mana"
                )
            )

        interface.print_()
