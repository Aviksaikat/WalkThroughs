def generate_readable_list(list_to_process):
    """
    Generate the message for get_command() to print when the user provides an
    input that does not match any commands.

    Arguments
    ---------
        commands : list[str]
            The list of commands that can be entered.

    Returns
    -------
        str
            The message that can be printed, instructing the user to input
            one of the valid commands.

    Examples
    --------
    >>> _generate_get_command_unsuitable_input_message(
    ...     ["attack", "rest","flee"]
    ... )
    "You must enter \"attack\", \"rest\", or \"flee\"."

    """
    # Put quotes around each string.
    processed_list = ["{}. {}".format(index+1, item.title()) for index, item in enumerate(list_to_process)]

    # if len(processed_list) > 1:
    #     processed_list.append("or " + processed_list.pop())

    delimiter = "\n"

    # if len(processed_list) > 2:
    #     delimiter = "," + delimiter

    return ":\n\n" + delimiter.join(processed_list)
