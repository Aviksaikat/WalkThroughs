from . import equip, unequip, consume, attacks, inventory_view, \
    use_item_interface, inventory_properties, equipment_view, \
    equip_item_interface, stats_view, discard_item_interface, \
    unequip_item_interface

class Player:
    def __init__(self, entity, class_):
        self.inventory = []
        self.equipped_items = {}
        self.entity = entity
        self.class_ = class_
        self.talked_to_cordelia = False
        self.can_progress_to_mountain = False
        self.first_boss_defeated = False
        self.second_boss_defeated = False

    consumable_items = inventory_properties.consumable_items
    equippable_items = inventory_properties.equippable_items

    equip = equip.equip
    unequip = unequip.unequip
    consume = consume.consume

    attack_names = attacks.attack_names
    get_attack_from_name = attacks.get_attack_from_name
    attacks_view = attacks.attacks_view
    inventory_view = inventory_view.inventory_view
    equipment_view = equipment_view.equipment_view
    stats_view = stats_view.stats_view
    use_item_interface = use_item_interface.use_item_interface
    equip_item_interface = equip_item_interface.equip_item_interface
    discard_item_interface = discard_item_interface.discard_item_interface
    unequip_item_interface = unequip_item_interface.unequip_item_interface
