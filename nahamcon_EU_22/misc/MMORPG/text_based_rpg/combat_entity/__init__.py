from .data import DATA
from . import entity_value_properties, other_properties, \
    restore_stamina_and_mana, attack

class CombatEntity:
    """A class for representing combat entities."""

    def __init__(self, display_name, attacks=None, **stats):
        """
        Arguments
        ---------
            display_name : str
                The readable name of the entity that can be displayed to the
                user.

            attacks : Optional[list]
                The list of attacks the entity has. Defaults to an empty list.

            **stats
                A set of integers that represent the entity's stats.

        """
        for stat, value in stats.items():
            setattr(self, stat, value)

        for stat in DATA["stats"]:
            if not hasattr(self, stat):
                setattr(self, stat, 0)

        if attacks is None:
            attacks = []

        self.display_name = display_name
        self.attacks = attacks

    evasion = other_properties.evasion
    usable_attacks = other_properties.usable_attacks
    values_view = other_properties.values_view

    restore_stamina_and_mana = restore_stamina_and_mana.restore_stamina_and_mana
    attack = attack.attack

# Create value and maximum value stat properties for each entity value.
for value_name in DATA["entity_values"]:
    setattr(
        CombatEntity,
        value_name,
        entity_value_properties.generate_value_property(value_name)
    )

    setattr(
        CombatEntity,
        "maximum_" + value_name,
        entity_value_properties.generate_maximum_value_stat_property(value_name)
    )
