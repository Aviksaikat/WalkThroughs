from .. import interface
from ..util import move
from ..room import Room

map_ = """You are in the town square in Regan.
To the east is the centre of town, from where the tavern and the weapons and armour shop can be accessed.
Goneril Mountain looms in the distance."""

def enter(room, player):
    if room.has_been_entered_before:
        interface.print_multiple_lines(
            lines=[
                "You are in the town square in Regan.",
                "Normally it would be buzzing with villagers, but as everyone is currently busy being scared of ghosts, it is deserted."
            ],
            delay=4
        )
    else:
        room.has_been_entered_before = True

        interface.print_multiple_lines(
            lines=[
                "You are in the town square in Regan.",
                "Normally it would be buzzing with villagers, but as everyone is currently busy being scared of ghosts, it is deserted.",
                "Except, for a young villager sitting on a wooden bench across the other side of the square, crying."
            ],
            delay=4
        )

    while True:
        additional_commands = ["talk"]

        if player.talked_to_cordelia:
            additional_commands = ["move"]

        command = interface.get_game_command(
            player,
            room,
            additional_commands
        )

        if command == "talk":
            npc = interface.get_command(
                ["villager", "cancel"],
                True
            )

            if npc == "villager":
                interface.print_multiple_lines(
                    lines=[
                        "You slowly approach the villager.",
                        "\"Are you Cordelia?\" you ask sheepishly.",
                        "\"I saw it! It was a ghost! I'm not insane!\"",
                        "\"What did you see?\" you ask, intrigued.",
                        "\"I saw a ghost!\"",
                        "\"What did it look like?\"",
                        "\"It looked like a person except they were see-through! They were standing completely still with a completely blank expression!\"",
                        "\"Oh please, you have to help us! These ghosts have been tormenting us for weeks now!\"",
                        "\"Life on the island is usually so peaceful...\"",
                        "She burts into tears and runs away before you can ask further questions.",
                        "Your path is clear to you now: you must get to the bottom of these supernatural occurances.",
                        "You should stop in at the weapons and armour shop before you start your adventure."
                    ],
                    delay=4
                )
                interface.print_()
                player.talked_to_cordelia = True
        else:
            place_to_move = move(["center of town"])

            if place_to_move == "center of town":
                from .center_of_town import room as center_of_town
                center_of_town.enter(player)

room = Room(
    map_=map_,
    enter=enter
)
