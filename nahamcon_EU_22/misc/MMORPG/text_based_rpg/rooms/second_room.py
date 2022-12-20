from .. import interface, enemies, items
from ..util import move, GameOver
from ..room import Room
from ..battle import Battle

map_ = """You are in the second room of the caves under Goneril Mountain.
It is even darker and more eery than the first room.
Only the final chamber remains.
The first room and the outside are behind you."""

def enter(room, player):
    if room.has_been_entered_before:
        interface.print_multiple_lines(
            lines=map_.split("\n"),
            delay=4
        )
    else:
        room.has_been_entered_before = True

        interface.print_multiple_lines(
            lines=[
                "You enter the second room of the caves under Goneril Mountain.",
                "There is an even larger metal door engraved with ornate symbols.",
                "It does not appear to have a lock, but in front of it is a lion, sleeping.",
                "You are surprised to see a lion.",
                "You did not know lions were found on Albany.",
                "You learn something new every day.",
                "Knowledge is power, as they say.",
                "The point is, the only way to get through the door and get into the final chamber is to defeat the lion."
            ],
            delay=4
        )

    while True:
        additional_commands = ["attack"]

        if player.second_boss_defeated:
            additional_commands = ["move"]

        command = interface.get_game_command(player, room, additional_commands)

        if command == "attack":
            target = interface.get_command(["lion", "cancel"], True)

            if target == "lion":
                battle = Battle(player, enemies.second_boss())
                battle.run()

                player.second_boss_defeated = True
                interface.sleep(5)
                interface.print_()

                interface.print_multiple_lines(
                    lines=[
                        "You have defeated the lion.",
                        "You are now able to get through the door and into the final chamber."
                    ],
                    delay=4
                )

        if command == "move":
            place_to_move = move(["first room", "final chamber"])

            if place_to_move == "first room":
                from .first_room import room as first_room
                first_room.enter(player)

            if place_to_move == "final chamber":
                raise GameOver

room = Room(
    map_=map_,
    enter=enter
)
