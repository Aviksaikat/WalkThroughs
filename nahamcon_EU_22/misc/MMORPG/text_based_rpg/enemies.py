"""This modules contains the code representing the enemies in the game."""

from .combat_entity import CombatEntity
from . import attack

def bear():
    return CombatEntity(
        display_name="Bear",
        attacks=[
            attack.Attack(
                name="slash",
                display_name="Slash",
                type_=attack.MELEE,
                damage=2,
                description_of_being_used="slashe",
                stamina_cost=4
            ),
            attack.Attack(
                name="bite",
                display_name="Bite",
                type_=attack.MELEE,
                damage=4,
                description_of_being_used="bite",
                stamina_cost=6
            )
        ],
        maximum_health=20,
        maximum_stamina=15,
        strength=8,
        defence=10,
        dexterity=4,
        composure=5,
        critical_hit_chance=2
    )

def first_boss():
    return CombatEntity(
        display_name="Even larger bear",
        attacks=[
            attack.Attack(
                name="slash",
                display_name="Slash",
                type_=attack.MELEE,
                damage=3,
                description_of_being_used="slashe",
                stamina_cost=3
            ),
            attack.Attack(
                name="bite",
                display_name="Bite",
                type_=attack.MELEE,
                damage=6,
                description_of_being_used="bite",
                stamina_cost=4
            )
        ],
        maximum_health=25,
        maximum_stamina=20,
        strength=10,
        defence=15,
        dexterity=6,
        composure=7,
        critical_hit_chance=4
    )

def second_boss():
    return CombatEntity(
        display_name="The poor, out-of-place lion",
        attacks=[
            attack.Attack(
                name="slash",
                display_name="Slash",
                type_=attack.MELEE,
                damage=8,
                description_of_being_used="slashe",
                stamina_cost=6
            ),
            attack.Attack(
                name="bite",
                display_name="Bite",
                type_=attack.MELEE,
                damage=14,
                description_of_being_used="bite",
                stamina_cost=8
            )
        ],
        maximum_health=40,
        maximum_stamina=50,
        strength=15,
        defence=25,
        dexterity=7,
        composure=8,
        critical_hit_chance=4
    )
