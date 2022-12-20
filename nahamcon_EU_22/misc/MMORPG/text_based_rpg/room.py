class Room:
    def __init__(self, map_, enter):
        """
        Arguments
        ---------
            map_ : str
                The text to display as the map when the user is in the room.

            enter : function
                The function to call when the user enters the room.
                Implements the user's interaction with the room.

        """
        self.map = map_
        self.enter_function = enter
        self.has_been_entered_before = False

    def enter(self, player):
        """
        Enter the room.

        Arguments
        ---------
            player : Player
                The player.

        Returns
        -------
        None
        """
        self.enter_function(self, player)
