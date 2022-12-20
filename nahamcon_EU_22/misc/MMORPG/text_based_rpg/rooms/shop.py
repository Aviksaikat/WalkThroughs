from .. import interface, items
from ..util import move
from ..room import Room

map_ = """You are in the weapons and armour shop in Regan.
Outside is the center of town, from where the tavern and the town square can be accessed.
Goneril Mountain looms in the distance."""

def enter(room, player):
    if room.has_been_entered_before:
        interface.print_multiple_lines(
            lines=[
                "You are in the weapons and armour shop in Regan.",
                "Normally there would be at least someone here browsing, but right now, it is deserted."
            ],
            delay=4
        )
    else:
        room.has_been_entered_before = True

        interface.print_multiple_lines(
            lines=[
                "You enter the weapons and armour shop in Regan.",
                "The shelves and walls are adorned with different items for adventurers like yourself.",
                "A blacksmith is sharpening a sword behind the counter."
            ],
            delay=4
        )

    while True:
        additional_commands = ["talk"]

        if player.can_progress_to_mountain:
            additional_commands = ["move"]

        command = interface.get_game_command(
            player,
            room,
            additional_commands
        )

        if command == "talk":
            npc = interface.get_command(
                ["shopkeeper", "cancel"],
                True
            )

            if npc == "shopkeeper":
                interface.print_multiple_lines(
                    lines=[
                        "You approach the counter.",
                        "The blacksmith stops sharpening the sword, and turns around.",
                        "\"Why hello there!\" the blacksmith exclaims. \"You must be an adventurer! What quest are you going on?\"",
                        "You tell him about the ghost stories, and how you want to get to the bottom of it.",
                        "\"Oh thank you, thank you! You would be doing the whole town a tremendous favour!\"",
                        "\"I recommend you investigate the caves under Goneril Moutanin. They've always creeped me out!\"",
                        "\"If you are going to go on such a perilous quest, you are going to need equipment! Because you are doing a service for town, I will provide it to you for free!\"",
                        "\"What equipment would you be after?\""
                    ],
                    delay=4
                )

                if player.class_ == "warrior":
                    interface.print_multiple_lines(
                        lines=[
                            "You tell him that you are a warrior.",
                            "\"A warrior, eh? You're in luck. I have plenty of weapons and armour.\"",
                            "\"In fact, I think this sword is as sharp as it's going to get. You should have it.\"",
                            "An iron sword has been added to your inventory.",
                            "An iron helmet has been added to your inventory.",
                            "An iron breastplate has been added to your inventory.",
                            "A set of iron platelegs has been added to your inventory.",
                            "Use the \"equip item\" command to equip them."
                        ],
                        delay=4
                    )

                    player.inventory.extend([
                        items.iron_sword,
                        items.iron_helmet,
                        items.iron_breastplate,
                        items.iron_platelegs
                    ])

                if player.class_ == "archer":
                    interface.print_multiple_lines(
                        lines=[
                            "You tell him that you are an archer.",
                            "\"An archer, eh? You're in luck. I have plenty of bows and hide armour.\"",
                            "An oak bow has been added to your inventory.",
                            "A cow hide body has been added to your inventory.",
                            "A set of cow hide legs has been added to your inventory."
                            "Use the \"equip item\" command to equip them."
                        ],
                        delay=4
                    )

                    player.inventory.extend([
                        items.oak_bow,
                        items.cow_hide_body,
                        items.cow_hide_legs
                    ])

                if player.class_ == "mage":
                    interface.print_multiple_lines(
                        lines=[
                            "You tell him that you are a mage.",
                            "\"A mage, eh? You're in luck. I have an assortment of staves and robes.\"",
                            "An ice staff has been added to your inventory.",
                            "A hood has been added to your inventory.",
                            "A robe has been added to your inventory.",
                            "Use the \"equip item\" command to equip them."
                        ],
                        delay=4
                    )

                    player.inventory.extend([
                        items.ice_staff,
                        items.hood,
                        items.robe
                    ])

                interface.print_multiple_lines(
                    lines=[
                        "\"You're also going to need some potions!\"",
                        "Three health potions have been added to your inventory."
                    ],
                    delay=4
                )

                for _ in range(3):
                    player.inventory.append(items.health_potion())

                if player.class_ in ["warrior", "archer"]:
                    interface.print_("Three stamina potions have been added to your inventory.")

                    for _ in range(3):
                        player.inventory.append(items.stamina_potion())
                else:
                    interface.print_("Three mana potions have been added to your inventory.")

                    for _ in range(3):
                        player.inventory.append(items.mana_potion())

                interface.print_("Use the \"use item\" command to use them if you need them.")

                interface.print_()
                player.can_progress_to_mountain = True
        else:
            place_to_move = move(["outside"])

            if place_to_move == "outside":
                from .center_of_town import room as center_of_town
                center_of_town.enter(player)

room = Room(
    map_=map_,
    enter=enter
)
