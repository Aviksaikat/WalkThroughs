from typing import Dict, Generator
from functools import lru_cache

from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from fastapi import status
from sqlalchemy.orm import Session as saSession

from src import database, config

class AbstractHelper():
    @staticmethod
    def return_json(message: Dict[str, str], status_code=status.HTTP_200_OK) -> JSONResponse:
        response_object = message
        json_compatible_item_data = jsonable_encoder(response_object)
        return JSONResponse(content=json_compatible_item_data, status_code=status_code)

    @staticmethod
    def get_db_conn() -> Generator[saSession, None, None]:
        db = database.SessionLocal()
        try:
            yield db
        finally:
            db.close()


@lru_cache()
def get_config():
    return config.MysteriousSettings()
