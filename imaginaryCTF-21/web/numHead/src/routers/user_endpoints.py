from typing import Optional

from fastapi import Request

from src.abstract_helper import get_config
from src import config
from src.routers import *

models.database.Base.metadata.create_all(bind=database.engine)

router = InferringRouter()

@cbv(router)
class User:
    authorization: str = Security(auth.fastapi_authorization)
    db: saSesssion = Depends(helper.get_db_conn)

    def __init__(self):
        self.valid_session = crud.validate_imaginary_user(
            self.authorization, self.db)

    @router.get("/", response_model=schemas.JSONMessage)
    def user_home(self):
        return helper.return_json({"detail": ":wave:"})

    @router.post("/new-token", response_model=schemas.JSONMessage,
                 status_code=status.HTTP_201_CREATED)
    @config.limiter.limit("5/minute")
    def new_token(self, request: Request):
        flag_config = get_config()
        if self.authorization != flag_config.magical_token:
            return helper.return_json({"error": f"magical token {self.authorization} is incorrect"},
                                      status_code=status.HTTP_401_UNAUTHORIZED)
        return crud.create_imaginary_user(request.headers, self.db)

    @router.get("/points", response_model=schemas.JSONMessage, dependencies=[Depends(auth.verify_imaginary_user)])
    def points(self):
        return crud.get_points(self.valid_session)

    @router.get("/guess", response_model=schemas.JSONMessage, dependencies=[Depends(auth.verify_imaginary_user)])
    def game(self, choice: Optional[int] = None):
        return crud.guess_number(self.valid_session, self.db, choice)

    @router.post("/nothing-here", response_model=schemas.JSONMessage,
                 status_code=status.HTTP_202_ACCEPTED, dependencies=[Depends(auth.verify_imaginary_user)])
    @config.limiter.limit("20/minute")
    def impossible(self, request: Request):
        ret = crud.guess_header(request.headers, self.valid_session, self.db)
        return ret
