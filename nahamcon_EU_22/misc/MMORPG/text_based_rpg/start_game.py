from . import interface
from .battle.battle_util import PlayerHasDiedError
from .create_player import create_player
from .rooms.tavern import room as tavern
from .util import GameOver
from .rooms.reset import reset as reset_rooms

def start_game():
    """
    Start and control the game.

    Returns
    -------
    None

    """

    reset_rooms()
    player = create_player()

    try:
        tavern.enter(player)
    except (PlayerHasDiedError, GameOver) as exception:
        if isinstance(exception, PlayerHasDiedError):
            interface.print_multiple_lines(
                lines=[
                    "=" * 20,
                    "",
                    "",
                    "",
                    "You have died",
                    "",
                    "",
                    "",
                    "=" * 20
                ],
                delay=1
            )
        else:
            interface.sleep(7)
            interface.print_multiple_lines(
                lines=[
                    "Nothingness.",
                    "Whiteness.",
                    "A vast, empty, white void.",
                    "Are you dead?",
                    "No.",
                    "If you were dead, you would have hit the title screen again.",
                    "You're still alive.",
                    "Or are you?",
                    "Were you ever alive?",
                    "In the distance, you see something.",
                    "You can't tell what it is, but it stands out clearly against the infinite whiteness.",
                    "You run towards it.",
                    "It feels further away than it should be.",
                    "Eventually, you reach the object.",
                    "It's a person, standing still and stiff like a stick, facing away from you.",
                    "They sense you coming, and slowly turn around.",
                    "Their expression is blank and lifeless.",
                    "They utter, in an emotionless voice:",
                    "\"I'm a physical manifestation of electrical impulses that exists solely to help tick this box on the marking criteria.\"",
                    "They turn back around.",
                    "And suddenly, everything makes sense.",
                    "There were no ghosts.",
                    "There is no Goneril Mountain.",
                    "There is no town of Regan.",
                    "There is no island of Albany.",
                    "There is no kingdom of Cornwall.",
                    "In fact, those are all just names ripped from King Lear.",
                    "There was no tavern.",
                    "There was no shop.",
                    "There were no bears.",
                    "You thought that lion was weird because it was weird.",
                    "They were all just electrical impulses that existed solely to help tick boxes on the marking criteria.",
                    "This. All of this. Everything.",
                    "It was all just an elaborate ploy to get marks."
                ],
                delay=4
            )

            interface.print_()
            interface.sleep(7)
