import time
import json
from typing import Optional, Set, Union, Callable

from sqlalchemy.orm import Session as saSession
from fastapi import status
from fastapi.responses import JSONResponse
from starlette import requests

from src import models, game
from src.auth import Authentication
from src.abstract_helper import AbstractHelper as helper, get_config

def create_imaginary_user(headers: requests.Headers, db: saSession) -> JSONResponse:
    imaginary_id = Authentication.generate_id()

    known_discoveries = {"imaginary_discoveries": [*headers]}
    known_discoveries_str = json.dumps(known_discoveries)
    current_time = int(time.time())

    new_imaginary_user = models.ImaginaryUser(
        imaginary_id=imaginary_id, imaginary_discoveries=known_discoveries_str,
        imaginary_points=10, imaginary_number=None, imaginary_attempts=0, imaginary_timestamp=current_time)

    db.add(new_imaginary_user)
    db.commit()

    return helper.return_json({"id": imaginary_id}, status_code=status.HTTP_201_CREATED)

def _find_imaginary_user(column_name, value, db: saSession) -> Union[bool, models.ImaginaryUser]:
    try:
        imaginary_user = db.query(models.ImaginaryUser).filter(
            getattr(models.ImaginaryUser, column_name) == value).all()[0]
    except:
        return False
    return imaginary_user

def validate_imaginary_user(imaginary_id: str, db: saSession) -> Union[bool, models.ImaginaryUser]:
    imaginary_user = _find_imaginary_user(
        "imaginary_id", imaginary_id, db)
    if imaginary_user:
        return imaginary_user
    return False

def get_points(imaginary_user) -> JSONResponse:
    return helper.return_json({"points": imaginary_user.imaginary_points})

def guess_number(imaginary_user, db: saSession, choice: Optional[int] = None):
    guess = game.ImaginaryGuesser(imaginary_user, db, 5, choice)
    return guess.main()


def guess_header(headers: requests.Headers, imaginary_user: models.ImaginaryUser,
                 db: saSession) -> Callable[[Set[Union[str, None]], models.ImaginaryUser, saSession], JSONResponse]:
    local_session_discoveries = json.loads(
        imaginary_user.imaginary_discoveries)
    if len(set(local_session_discoveries["imaginary_discoveries"])) >= len(set(headers.keys())):
        return helper.return_json({"detail": "requests were the same :rooFrozen:"})

    check = set(
        set(local_session_discoveries["imaginary_discoveries"])) ^ set(headers.keys())

    return _submit_attempt(check, imaginary_user, db)

def _submit_attempt(discovery: Set, imaginary_user: models.ImaginaryUser, db: saSession) -> JSONResponse:

    try:
        discovery = next(iter(discovery))
    except StopIteration:
        return helper.return_json({"detail": "requests were the same :rooFrozen:"})

    local_session_discoveries = json.loads(
        imaginary_user.imaginary_discoveries)

    local_session_discoveries["imaginary_discoveries"].append(discovery)
    imaginary_user.imaginary_discoveries = json.dumps(
        local_session_discoveries)
    imaginary_user.imaginary_points += 100

    db.commit()

    return helper.return_json({"detail": "i'm being hacked :rooNobooli: :banhammer:"})

def get_flag(valid_session) -> JSONResponse:
    if valid_session.imaginary_points >= 1000:
        flag_config = get_config()
        return helper.return_json({"detail": flag_config.flag})
    return helper.return_json({"detail": "admins only :Ban:"})
