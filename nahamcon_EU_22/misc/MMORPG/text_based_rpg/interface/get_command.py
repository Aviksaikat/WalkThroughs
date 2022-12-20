from .data import DATA
from .get_input import get_input
from .generate_readable_list import generate_readable_list
from .built_in_methods import print_

def get_command(commands, list_options=True):
    """
    Get input from the user and match it against a provided list of commands.
    If the command given was not in the list, re-call the function
    recursively until a suitable command is given.

    Arguments
    ---------
        commands : list[str]
            A set of commands to match against.

    Returns
    -------
    str
        The suitable command provided by the user.

    """
    while True:
        if list_options == True:
            print_(
                "You may enter: " + generate_readable_list(commands)
            )

        received_input = get_input()

        print_()

        # if received_input in commands:
        #     return received_input

        if received_input in range(1, len(commands)+1):
            return commands[received_input-1]

        print_(
            DATA["unsuitable_input_messages"]["get_command"].format(
                commands=generate_readable_list(commands)
            )
        )
