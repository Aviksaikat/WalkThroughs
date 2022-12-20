from collections import namedtuple

from .util import set_multiple_attributes

class Attack:
    def __init__(
            self,
            name,
            display_name,
            type_,
            damage,
            description_of_being_used="",
            stamina_cost=0,
            mana_cost=0
    ):
        """
        Arguments
        ---------
            name : str
                An identifying name of the attack.

            display_name : str
                A readable name of the attack that can be displayed to the user.

            type_ : AttackStyle
                The type of attack.

            damage : int
                The damage value of the attack.

            description_of_being_used : str
                A description of the attack being used against an enemy.

            stamina_cost : int
                The amount of stamina the attack consumes.

            mana_cost : int
                The amount of mana the attack consumes.

        """
        set_multiple_attributes(
            self,
            name=name,
            display_name=display_name,
            type=type_,
            damage=damage,
            description_of_being_used=description_of_being_used,
            stamina_cost=stamina_cost,
            mana_cost=mana_cost
        )

_AttackStyle = namedtuple("AttackStyle", ["damage_stat"])
"""namedtuple: A class that represents different types of attacks."""

MELEE = _AttackStyle(damage_stat="strength")
RANGED = _AttackStyle(damage_stat="archery")
MAGIC = _AttackStyle(damage_stat="magic")
