"""
This module is an interface to the package's data.json file.
"""

import os
import json

DATA = json.load(
    open(
        os.path.dirname(
            os.path.realpath(__file__)
        ) + "/data.json"
    )
)

def _make_full_list_of_stats():
    """
    Generate the full list of the entity's stats.

    Returns
    -------
        list
            The list of the entity's stats.

    """
    list_of_stats = DATA["_other_stats"][:]
    list_of_stats.extend(
        ["maximum_" + value_name for value_name in DATA["entity_values"]]
    )
    return list_of_stats

DATA["stats"] = _make_full_list_of_stats()

def _make_full_list_of_values():
    """
    Generate a combined list of the entity's stats and entity values.

    Returns
    -------
    list
        The combined list.
    """
    values = DATA["entity_values"][:]
    values.extend(DATA["stats"])
    return values

DATA["all_values"] = _make_full_list_of_values()
