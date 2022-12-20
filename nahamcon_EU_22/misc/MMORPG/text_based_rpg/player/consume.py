from .. import item
from .exceptions import ItemIsNotConsumableError

def consume(self, item_to_consume):
    """
    Execute the player using an item.

    Arguments
    ---------
        item_to_consume : Item
            The item the player is using.

    Returns
    -------
    None
    
    """

    if item_to_consume.type != item.CONSUMABLE:
        raise ItemIsNotConsumableError

    for effect in item_to_consume.effects:
        setattr(
            self.entity,
            effect.stat,
            getattr(self.entity, effect.stat) + effect.modifier
        )

    self.inventory.remove(item_to_consume)
