from .exceptions import NoItemEquippedInEquipLocationError

def unequip(self, equip_location):
    """
    Execute the player unequipping an item.

    Arguments
    ---------
        equip_location : str
            The equip location to unequip from.

    Returns
    -------
    None

    """

    item_to_unequip = self.equipped_items.get(equip_location)

    if not item_to_unequip:
        raise NoItemEquippedInEquipLocationError

    del self.equipped_items[equip_location]
    self.inventory.append(item_to_unequip)

    for effect in item_to_unequip.effects:
        setattr(
            self.entity,
            effect.stat,
            getattr(self.entity, effect.stat) - effect.modifier
        )

    for attack in item_to_unequip.attacks:
        self.entity.attacks.remove(attack)
