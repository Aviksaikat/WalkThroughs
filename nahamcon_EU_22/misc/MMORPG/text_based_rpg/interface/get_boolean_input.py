from .data import DATA
from .get_input import get_input
from .built_in_methods import print_

def get_boolean_input():
    """
    Get input from the user and derive a boolean from it by matching it
    against a pre-defined set of values that represent True and a pre-defined
    set of values that represent False.
    If the given input is not in either set, re-call the function recursively
    until a suitable input is given.

    Returns
    -------
    bool
        True if the given input was in the set of values representing True.
        False if the given input was in the set of values representing False.

    """
    while True:
        received_input = get_input()

        if received_input in DATA["forms_of_true"]:
            return True

        if received_input in DATA["forms_of_false"]:
            return False

        print_(DATA["unsuitable_input_messages"]["get_boolean_input"])
