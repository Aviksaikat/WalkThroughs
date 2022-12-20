from .. import item

@property
def consumable_items(player):
    items = []

    for inventory_item in player.inventory:
        if inventory_item.type == item.CONSUMABLE:
            items.append(inventory_item)

    return items
"""property: A property that computes a list of the items the player has in
their inventory which are consumable."""

@property
def equippable_items(player):
    items = []

    for inventory_item in player.inventory:
        if inventory_item.type == item.EQUIPPABLE:
            items.append(inventory_item)

    return items
"""property: A property that computes a list of the items the player has in
their inventory which are equippable."""
