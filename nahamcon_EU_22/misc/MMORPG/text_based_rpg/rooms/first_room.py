from .. import interface, enemies, items
from ..util import move
from ..room import Room
from ..battle import Battle

map_ = """You are in the first room of the caves under Goneril Mountain.
There is another room past this one, and then the final chamber.
Outside is the entrace to the caves and the town of Regan."""

def enter(room, player):
    if room.has_been_entered_before:
        interface.print_multiple_lines(
            lines=[
                "You are at in the first room of the caves under Goneril Mountain.",
                "It is very dark, and very eery."
            ],
            delay=4
        )
    else:
        room.has_been_entered_before = True

        interface.print_multiple_lines(
            lines=[
                "You enter the first room of the caves under Goneril Mountain.",
                "There is a large metal door, presumably leading to the room after this one.",
                "However, it has a comically large lock on it.",
                "To the side of the room, there is a chest.",
                "You figure the chest contains the key.",
                "However, there is an even larger bear blocking the path to it.",
                "To open the chest and get the key, you will have to deal with the bear."
            ],
            delay=4
        )

    while True:
        additional_commands = ["attack"]

        if player.first_boss_defeated:
            additional_commands = ["move"]

        command = interface.get_game_command(player, room, additional_commands)

        if command == "attack":
            target = interface.get_command(["bear", "cancel"], True)

            if target == "bear":
                battle = Battle(player, enemies.first_boss())
                battle.run()

                player.first_boss_defeated = True
                interface.sleep(5)
                interface.print_()

                interface.print_multiple_lines(
                    lines=[
                        "Opening the chest, you find the comically large key for the comically large lock.",
                        "You unlock the door, allowing you to progress to the next room.",
                        "In the chest you also find better versions of your current equipment."
                    ],
                    delay=4
                )

                if player.class_ == "warrior":
                    interface.print_multiple_lines(
                        lines=[
                            "A steel sword has been added to your inventory.",
                            "A steel helmet has been added to your inventory.",
                            "A steel platebody has been added to your inventory.",
                            "A set of steel platelegs has been added to your inventory."
                        ],
                        delay=4
                    )

                    player.inventory.extend([
                        items.steel_sword,
                        items.steel_helmet,
                        items.steel_breastplate,
                        items.steel_platelegs
                    ])

                if player.class_ == "archer":
                    interface.print_multiple_lines(
                        lines=[
                            "A willow bow has been added to your inventory.",
                            "A bear hide body has been added to your inventory.",
                            "A set of bear hide legs has been added to your inventory."
                        ],
                        delay=4
                    )

                    player.inventory.extend([
                        items.willow_bow,
                        items.bear_hide_body,
                        items.bear_hide_legs
                    ])

                if player.class_ == "mage":
                    interface.print_multiple_lines(
                        lines=[
                            "A fire staff has been added to your inventory.",
                            "A battle hood has been added to your inventory.",
                            "A battle robe has been added to your inventory."
                        ],
                        delay=4
                    )

                    player.inventory.extend([
                        items.fire_staff,
                        items.battle_hood,
                        items.battle_robe
                    ])

        if command == "move":
            place_to_move = move(["outside", "second room"])

            if place_to_move == "outside":
                from .mountain_exterior import room as mountain_exterior
                mountain_exterior.enter(player)

            if place_to_move == "second room":
                from .second_room import room as second_room
                second_room.enter(player)

room = Room(
    map_=map_,
    enter=enter
)
