from .built_in_methods import print_, sleep

def print_multiple_lines(lines, delay=None):
    """
    Iterate over a set of strings and print each one, with an optional time
    delay after each string.

    Arguments
    ---------
        lines : list[str]
            A set of strings to print.
        delay : Optional[int, float]
            The number of seconds to delay after each string is printed.

    Returns
    -------
        None

    """
    for individual_line in lines:
        print_(individual_line)

        if delay:
            sleep(delay)
