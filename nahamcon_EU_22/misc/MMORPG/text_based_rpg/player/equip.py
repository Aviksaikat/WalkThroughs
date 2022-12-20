from .. import item, interface
from .data import DATA
from .exceptions import ItemIsNotEquippableError

def equip(self, item_to_equip):
    """
    Execute the player equipping an item.

    Arguments
    ---------
        item_to_equip : Item
            The item the player is equipping.

    Returns
    -------
    None
    
    """
    if item_to_equip.type != item.EQUIPPABLE:
        raise ItemIsNotEquippableError

    item_currently_equipped = self.equipped_items.get(
        item_to_equip.equip_location
    )

    if item_currently_equipped:
        interface.print_(DATA["messages"]["item_already_equipped"].format(
            item=item_currently_equipped.display_name
        ))
        whether_to_proceed = interface.get_boolean_input()

        if not whether_to_proceed:
            return

        self.unequip(item_to_equip.equip_location)

    self.equipped_items[item_to_equip.equip_location] = item_to_equip

    for effect in item_to_equip.effects:
        setattr(
            self.entity,
            effect.stat,
            getattr(self.entity, effect.stat) + effect.modifier
        )

    for attack in item_to_equip.attacks:
        self.entity.attacks.append(attack)

    self.inventory.remove(item_to_equip)
