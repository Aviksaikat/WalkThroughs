from text_based_rpg import interface
from text_based_rpg.start_game import start_game

PLAY = "play"
HELP = "help"
QUIT = "quit"
COMMANDS = [PLAY, HELP, QUIT]

help_text = "\n\nA rope playing game! It's not massively-multiplayer-online yet... but if you pull some tricks, maybe you can help!\n\n"

def play():
    while True:
        interface.print_("Welcome to my text-based RPG.\n")

        interface.print_("Enter " + interface.generate_readable_list(COMMANDS))
        command = interface.get_command(COMMANDS, False)

        if command == PLAY:
            start_game()

        if command == HELP:
            interface.print_(help_text)

        if command == QUIT:
            break
