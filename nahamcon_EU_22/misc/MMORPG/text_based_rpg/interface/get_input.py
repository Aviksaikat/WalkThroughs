from .data import DATA
from .built_in_methods import input_

def get_input():
    """
    Call input() with a predefined prompt and return the normalized result.

    Returns
    -------
        str
            The input the user provided after having been normalized
            (converted to all-lowercase and stripped of leading and trailing
            whitespace).

    """
    # return input_(DATA["input_prompt"]).strip().lower()

    try:
        return input_(DATA["input_prompt"])
    except:
        return ""
