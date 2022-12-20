"""This module contains general utility functions for the game."""

import random
from . import interface

def set_multiple_attributes(object_, **attributes):
    """
    Iterate over a dictionary and call setattr() on a given object for each
    key-value pair.

    Arguments
    ---------
        object_ : object
            To object to set attributes of.

        **attributes
            The dictionary containing the key-value pairs of the attributes to
            set.

    Returns
    -------
    None

    """
    for key, value in attributes.items():
        setattr(object_, key, value)

def _generate_random_value(upper_limit):
    """
    Generate a random integer between 1 and the given limit inclusive.

    Arguments
    ---------
        upper_limit : int
            The upper limit of random numbers to generate.

    Returns
    -------
    int
        The random integer generated.

    """
    return random.randint(1, upper_limit)

def resolve_random_condition(chances_data):
    sum_of_chances = sum([
        individual_chance_data[1] for individual_chance_data in chances_data
    ])

    random_value = _generate_random_value(sum_of_chances)
    range_checked = 0

    for individual_chance_data in chances_data:
        key, chance = individual_chance_data
        range_checked += chance

        if random_value <= range_checked:
            return key

def move(locations):
    """
    Provide an interface to the user facilitating their movement between
    locations.

    Arguments
    ---------
        locations : list
            A list of locations they can move to.

    Returns
    -------
    str
        The location the user enters to move to.

    """
    move_locations = locations[:]
    move_locations.append("cancel")
    return interface.get_command(move_locations, True)

class GameOver(Exception):
    """An exception that is raised when the user reaches the end of the game."""
    pass
