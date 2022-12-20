from .data import DATA
from .get_input import get_input
from .built_in_methods import print_

def get_integer_input(upper_limit):
    """
    Get input from the user and parse it as an integer.
    If the input does not parse as an integer, the integer is higher than the
    maximum integer acceptable, or the integer is less than 1, re-call the
    function recursively until an acceptable input is provided.

    Arguments
    --------
        upper_limit : int
            The maximum integer acceptable for the user to input.

    Returns
    -------
        int
            The acceptable integer provided by the user.

    """
    unsuitable_input_messsage = DATA["unsuitable_input_messages"][
        "get_integer_input"
    ].format(upper_limit=upper_limit)

    while True:
        received_input = get_input()
        value = None

        try:
            value = int(received_input)
        except ValueError:
            print_(unsuitable_input_messsage)
            continue

        if not 1 <= value <= upper_limit:
            print_(unsuitable_input_messsage)
            continue

        return value
