from .center_of_town import room as center_of_town
from .first_room import room as first_room
from .mountain_exterior import room as mountain_exterior
from .second_room import room as second_room
from .shop import room as shop
from .tavern import room as tavern
from .town_square import room as town_square

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
