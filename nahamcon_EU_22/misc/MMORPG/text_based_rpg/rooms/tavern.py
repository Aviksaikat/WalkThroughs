from .. import interface
from ..util import move
from ..room import Room

map_ = """You are in the tavern in Regan.
Outside is the town square and the weapons and armour shop.
Goneril Mountain looms in the distance."""

def enter(room, player):
    talked_to_bartender = False
    talked_to_strange_person = False

    if room.has_been_entered_before:
        interface.print_multiple_lines(
            lines=[
                "You are in the tavern in Regan.",
                "The bartender is still bored, and the strange person in the corner is the same as usual."
            ],
            delay=4
        )
    else:
        interface.print_multiple_lines(
            lines=[
                "You are in the town of Regan on the island of Albany.",
                "You arrived yesterday on a boat from the kingdom of Cornwall.",
                "Albany is a small island days away from any other civlisation.",
                "Little is known about Albany in Cornwall.",
                "Many of the villagers regard it as a mysterious land.",
                "A number of them are unconvinced that it even exists.",
                "Cornwall has an alliance with Albany, and sends supplies to Albany by boat every month.",
                "There is some limited room on these boats for passengers, but rarely does anyone make the journey.",
                "You heard mysterious stories about Albany through your whole childhood.",
                "Now that you are older, you have travelled to Albany to discover this foreign land, and the discover the truth.",
                "",
                "After sleeping in after the rough journey, you wake up and climb down the stairs into the main area of the Tavern.",
                "The tavern is small and cozy, with a fireplace burning softly in the corner.",
                "The bartender looks up as you come down the stairs, but looks down again, the sight of you unable to remedy his boredom.",
                "The only other person in the bar is a suspicious looking person in the corner, standing still and stiff like a stick, facing the wall."
            ],
            delay=4
        )

    while True:
        additional_commands = ["talk"]

        if (
                room.has_been_entered_before or \
                (talked_to_bartender and talked_to_strange_person)
        ):
            additional_commands = ["move"]

        command = interface.get_game_command(player, room, additional_commands)

        if command == "talk":
            npc = interface.get_command(
                ["bartender", "person in corner", "cancel"],
                True
            )

            if npc == "person in corner":
                interface.print_multiple_lines(
                    lines=[
                        "You cautiously approach the strange person standing in the corner.",
                        "They sense you coming, and slowly turn around.",
                        "Their expression is blank and lifeless.",
                        "They utter, in an emotionless voice:",
                        "\"I'm a phsyical manifestation of electrical impulses that exists solely to help tick this box on the marking criteria.\"",
                        "They turn back around. You think it's best not to try and make further conversation.",
                    ],
                    delay=4
                )
                interface.print_()
                talked_to_strange_person = True

            if npc == "bartender":
                interface.print_multiple_lines(
                    lines=[
                        "You approach the bartender.",
                        "He looks up at you again. He is still just as bored, and upon further inspection, looks rather down.",
                        "\"Where is everyone?\" you ask as you sit down on one of the crude wooden barstools.",
                        "\"All my business has dried up, and that was a deliberate pun! Normally the bar would be full of townsfolk, but everyone's too scared to leave their homes!\"",
                        "\"Why is that?\" you ask, worried.",
                        "\"Some of the townsfolk have been saying they've been seeing ghosts around town! Now everyone's boarding up their windows and refusing to go outside! It's terrible for business!\"",
                        "The bartender must be able to tell that you're excited, as he says \"An adventurer, are we? Your like don't come around these parts very often.\"",
                        "\"Cordelia came in here crying a few hours ago, saying she'd seen a ghost. I think I saw her run towards the town square. If you want to investigate, you should go talk to her.\"",
                        "\"If you could get to the bottom of this, you would do all of us a great service.\""
                    ],
                    delay=4
                )
                interface.print_()
                talked_to_bartender = True
        else:
            place_to_move = move(["outside"])

            if place_to_move == "outside":
                room.has_been_entered_before = True
                from .center_of_town import room as center_of_town
                center_of_town.enter(player)

room = Room(
    map_=map_,
    enter=enter
)
