from .. import interface
from ..util import move
from ..room import Room

map_ = """You are out in the town of Regan.
To your west is the town square.
To the east is the weapons and armour shop.
To the south is the tavern.
Goneril Mountain looms to the north."""

def enter(room, player):
    interface.print_multiple_lines(lines=map_.split("\n"), delay=1)

    while True:
        interface.get_game_command(player, room, ["move"])

        places_to_move = ["tavern", "town square"]

        if player.talked_to_cordelia:
            places_to_move.append("shop")

        if player.can_progress_to_mountain:
            places_to_move.append("goneril mountain")

        move_location = move(places_to_move)

        if move_location == "tavern":
            from .tavern import room as tavern
            tavern.enter(player)

        if move_location == "town square":
            from .town_square import room as town_square
            town_square.enter(player)

        if move_location == "shop":
            from .shop import room as shop
            shop.enter(player)

        if move_location == "goneril mountain":
            from .mountain_exterior import room as mountain_exterior
            mountain_exterior.enter(player)

room = Room(
    map_=map_,
    enter=enter
)
