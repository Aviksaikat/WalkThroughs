from src.routers import *

models.database.Base.metadata.create_all(bind=database.engine)

router = InferringRouter()

@cbv(router)
class Admin:
    authorization: str = Security(auth.fastapi_authorization)
    db: saSesssion = Depends(helper.get_db_conn)

    def __init__(self):
        self.valid_session = crud.validate_imaginary_user(
            self.authorization, self.db)

    @router.get("/", response_model=schemas.JSONMessage)
    def admin_home(self):
        return helper.return_json({"detail": "an admin? :rooMatthewVoid:"})

    @router.get("/flag", response_model=str, status_code=status.HTTP_200_OK, dependencies=[Depends(auth.verify_imaginary_user)])
    def flag(self):
        return crud.get_flag(self.valid_session)
