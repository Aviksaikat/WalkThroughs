from .tavern import room as tavern
from .shop import room as shop
from .town_square import room as town_square
from .center_of_town import room as center_of_town
from .mountain_exterior import room as mountain_exterior
from .first_room import room as first_room
from .second_room import room as second_room

rooms = [
    tavern,
    shop,
    town_square,
    center_of_town,
    mountain_exterior,
    first_room,
    second_room
]

def reset():
    for room in rooms:
        room.has_been_entered_before = False
