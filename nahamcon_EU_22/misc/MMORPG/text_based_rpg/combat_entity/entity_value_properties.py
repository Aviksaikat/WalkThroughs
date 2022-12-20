"""
This module contains functions for generating property instances that can be
used to with the CombatEntity class to represent entity values and their 
corresponding maximum stats for an entity.
"""

def generate_value_property(name):
    """
    Generate a property instance that can be used to represent an entity value.

    Arguments
    ---------
        name : str
            The name of the entity value to represent.

    Returns
    -------
    property
        The generated property.

    """

    @property
    def value_property(entity):
        return getattr(entity, "_" + name)

    @value_property.setter
    def value_property(entity, value):
        value_maximum = getattr(entity, "maximum_" + name)

        # Prohibit the value from exceeding it's maximum or falling below zero.
        if value > value_maximum:
            value = value_maximum

        if value < 0:
            value = 0

        setattr(entity, "_" + name, value)

    return value_property

def generate_maximum_value_stat_property(name):
    """
    Generate a property instance that can be used to represent an entity's
    maximum value stat.

    Arguments
    ---------
        name : str
            The name of the entity value to represent the maximum stat ofS.

    Returns
    -------
    property
        The generated property.

    """

    @property
    def maximum_value_stat_property(entity):
        return getattr(entity, "_maximum_" + name)

    @maximum_value_stat_property.setter
    def maximum_value_stat_property(entity, value):
        setattr(entity, "_maximum_" + name, value)

        if not hasattr(entity, name) or value < getattr(entity, name):
            setattr(entity, name, value)

    return maximum_value_stat_property
