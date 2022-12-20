from .. import interface, enemies
from ..util import move
from ..room import Room
from ..battle import Battle

map_ = """You are outside Goneril Mountain, at the entrace of the caves.
To the south is the town of Regan."""

def enter(room, player):
    if room.has_been_entered_before:
        interface.print_multiple_lines(
            lines=[
                "You are at the entrace to the caves under Goneril Mountain.",
                "Besides for the faint chirping of birds in the distance, the area is deserted."
            ],
            delay=4
        )
    else:
        room.has_been_entered_before = True

        interface.print_multiple_lines(
            lines=[
                "You have left the town of Regan and are walking through the wilderness north to Goneril Mountain.",
                "Besides for the chriping of birds, and the faint trickling of the river, it is silent.",
                "As you are climbing over some rocks, you fail to see a bear sleeping behind them.",
                "You forcefully step on the bear, waking it up and making it very angry."
            ],
            delay=4
        )

        battle = Battle(player, enemies.bear())
        battle.run()

        interface.sleep(5)
        interface.print_()
        
        interface.print_multiple_lines(
            lines=[
                "Finally, you are at the entrace to the caves under Goneril Mountain.",
                "Besides for the faint chirping of birds in the distance, the area is deserted."
            ],
            delay=4
        )

    while True:
        command = interface.get_game_command(player, room, ["move"])

        place_to_move = move(["regan", "cave"])

        if place_to_move == "regan":
            from .center_of_town import room as center_of_town
            center_of_town.enter(player)

        if place_to_move == "cave":
            from .first_room import room as first_room
            first_room.enter(player)

room = Room(
    map_=map_,
    enter=enter
)
