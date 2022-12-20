from .generate_random_multiplier import generate_random_multiplier

def _generate_amount_of_value_to_restore(entity, value_name, multiplier=1):
    """
    Generates the amount of an entity value for the given entity to restore.

    Arguments
    ---------
        entity : CombatEntity
            The entity of which the value is being restored.

        value_name : str
            The name of the value that is being restored.

        multiplier : Optional[int, float]
            An additonal multiplier to multiply the amount by. Defaults to 1.

    Returns
    -------
    int
        The amount of the value to restore.

    """
    amount_to_restore = round(
        getattr(entity, "maximum_" + value_name) * \
        entity.composure / 100 * \
        3 / 8 * \
        generate_random_multiplier() * \
        multiplier
    )

    if amount_to_restore < 1:
        amount_to_restore = 1

    return amount_to_restore

def restore_stamina_and_mana(entity, multiplier=1):
    """
    Execute the given entity restoring stamina and mana.

    Arguments
    ---------
        entity : CombatEntity
            The entity to restore stamina and mana of.

        multiplier : Optional[int, float]
            An additional multiplier to multiply the amount being restored by.

    Returns
    -------
        None

    """

    stamina_to_restore = _generate_amount_of_value_to_restore(
        entity,
        "stamina",
        multiplier
    )

    mana_to_restore = _generate_amount_of_value_to_restore(
        entity,
        "mana",
        multiplier
    )

    if entity.maximum_stamina:
        entity.stamina += stamina_to_restore

    if entity.maximum_mana:
        entity.mana += mana_to_restore
