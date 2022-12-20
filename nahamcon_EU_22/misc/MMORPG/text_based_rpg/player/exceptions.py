class ItemIsNotEquippableError(Exception):
    """
    This exception is raised when the player attempts to equip an item that is
    not equippable.
    """

    pass

class NoItemEquippedInEquipLocationError(Exception):
    """
    This exception is raised when the player attempts to unequip from an equip
    location where no item is equipped.
    """
    pass

class ItemIsNotConsumableError(Exception):
    """
    This exception is raised when the player attempts to use an item that is not
    usable.
    """
    pass
