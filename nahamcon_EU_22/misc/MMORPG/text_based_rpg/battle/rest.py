from .. import interface
from .data import DATA

def rest(battle, entity):
    """
    Execute the entity resting in the battle, printing relevant messages.

    Arguments
    ---------
        battle : Battle
            The Battle instance representing the battle.

        entity : CombatEntity
            The entity that is resting.

    Returns
    -------
    None
    
    """
    prior_stamina = entity.stamina
    prior_mana = entity.mana

    entity.restore_stamina_and_mana(multiplier=DATA["rest_multiplier"])

    stamina_restored = entity.stamina - prior_stamina
    mana_restored = entity.mana - prior_mana

    entity_name = battle.get_entity_name(entity)

    if stamina_restored:
        interface.print_(
            DATA["messages"][entity_name]["rested_and_restored_stamina"].format(
                stamina_restored
            )
        )

    if mana_restored:
        interface.print_(
            DATA["messages"][entity_name]["rested_and_restored_mana"].format(
                mana_restored
            )
        )
