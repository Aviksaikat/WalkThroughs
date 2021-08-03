import random
import time
from typing import Optional

from sqlalchemy.orm import Session as saSession

from src.abstract_helper import AbstractHelper as helper

class ImaginaryGuesser:

    def __init__(self, valid_session, db: saSession,
                 imaginary_attempts: int, imaginary_choice: Optional[int] = None):

        self.db = db
        self.valid_session = valid_session
        self.imaginary_attempts = imaginary_attempts

        self.imaginary_choice = imaginary_choice

    def main(self):
        if self.valid_session.imaginary_number is None:
            return self.start()
        if self.imaginary_choice is None:
            return helper.return_json({"status": "please guess a number"})
        else:
            return self.guess()

        self.valid_session.imaginary_attempts += 1
        self.db.commit()

    def start(self):
        number = str(random.randint(1, 100))
        self.valid_session.imaginary_number = number
        self.db.commit()
        time.sleep(0.5)
        return helper.return_json({"status": "Number set. Please guess a number :)"})

    def guess(self):
        number = self.valid_session.imaginary_number
        imaginary_attempts_left_message = {"guesses left": self.imaginary_attempts -
                                           self.valid_session.imaginary_attempts - 1}
        imaginary_attempts_left_number = self.valid_session.imaginary_attempts
        if self.imaginary_choice == number:
            self.win()
            return helper.return_json({**{"status": "Congratulations! You guessed the number! :rooCash:"}, **imaginary_attempts_left_message})
        if self.imaginary_choice >= number:
            self.lose()

            if imaginary_attempts_left_number + 1 >= self.imaginary_attempts:
                fallen_number = self.valid_session.imaginary_number
                self.reset()
                return helper.return_json({"status": f"Sorry, you lost :rooDevil: The number was {fallen_number}"})
            return helper.return_json({**{"status": "Your number was too high :rooFrozen:"}, **imaginary_attempts_left_message})
        if self.imaginary_choice <= number:
            self.lose()

            if imaginary_attempts_left_number + 1 >= self.imaginary_attempts:
                fallen_number = self.valid_session.imaginary_number
                self.reset()
                return helper.return_json({"status": f"Sorry, you lost :rooDevil: The number was {fallen_number}"})
            return helper.return_json({**{"status": "Your number was too low :rooFrozen:"}, **imaginary_attempts_left_message})

    def reset(self):
        self.valid_session.imaginary_number = None
        self.valid_session.imaginary_attempts = 0
        self.db.commit()

    def lose(self):
        self.valid_session.imaginary_attempts += 1
        self.db.commit()

    def win(self):
        number = self.valid_session.imaginary_number
        self.reset()
        points = number & 1
        self.valid_session.imaginary_points += points
        self.db.commit()
