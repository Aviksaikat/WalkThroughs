from uuid import uuid4
import time
from typing import Union

from fastapi import Depends, HTTPException, Security, status
from fastapi.security import APIKeyHeader
from fastapi_utils.session import FastAPISessionMaker
from sqlalchemy.orm import Session as saSession

from src import crud, models
from .abstract_helper import AbstractHelper

class Authentication():
    @staticmethod
    def generate_id() -> str:
        return uuid4().hex

    @staticmethod
    def delete_old_imaginary_users(delete_time: int = 300) -> None:
        file_name = "attempts.db"
        database_uri = f"sqlite:///tmp/{file_name}"
        sessionmaker = FastAPISessionMaker(database_uri)

        with sessionmaker.context_session() as db:
            now = int(time.time())
            old_time = now - delete_time
            db.query(models.ImaginaryUser).filter(
                models.ImaginaryUser.imaginary_timestamp < old_time).delete()
            db.commit()


fastapi_authorization = APIKeyHeader(name="authorization", auto_error=False)

def verify_imaginary_user(authorization: str = Security(fastapi_authorization), db: saSession = Depends(AbstractHelper.get_db_conn)) -> Union[HTTPException, None]:
    valid_imaginary_user = crud.validate_imaginary_user(authorization, db)
    if not valid_imaginary_user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED, detail="invalid imaginary_user")
