import sys

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from slowapi import _rate_limit_exceeded_handler
from slowapi.errors import RateLimitExceeded
from slowapi.middleware import SlowAPIMiddleware
from fastapi_utils.tasks import repeat_every

from loguru import logger

from src.routers import admin_endpoints, user_endpoints
from src import schemas, auth, config
from src.abstract_helper import AbstractHelper as helper

logger.remove()
logger.add(sys.stdout, colorize=True,
           format="<blue>{time:YYYY-MM-DD HH:mm:ss.SSS}</blue> | "
           "<red>{level: <8}</red> | "
           "<yellow>{name}</yellow>:<yellow>{function}</yellow>:<yellow>{line}</yellow> - <level>{message}</level>",)

imaginary_app = FastAPI(title="NumHead",
                        description="A fun game",
                        version="3.0",
                        openapi_tags=config.tags_metadata)

imaginary_app.state.limiter = config.limiter
imaginary_app.add_exception_handler(
    RateLimitExceeded, _rate_limit_exceeded_handler)
imaginary_app.add_middleware(SlowAPIMiddleware)

#@imaginary_app.on_event("startup")
#@repeat_every(seconds=10, logger=logger)
#def remove_expired_tokens_task() -> None:
#    auth.Authentication.delete_old_imaginary_users()


imaginary_app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

HOME_MESSAGE = """:wave: Welcome to NumHead, have fun guessing numbers :rooYay2:"""

@imaginary_app.get("/", response_model=schemas.JSONMessage, tags=["Home"])
def home():
    return helper.return_json({"detail": HOME_MESSAGE})

@imaginary_app.get("/api/", response_model=schemas.JSONMessage, tags=["Home"])
def api_home():
    return helper.return_json({"detail": ":rooangry:"})


imaginary_app.include_router(admin_endpoints.router, prefix="/api/admin",
                             tags=["Admin"])

imaginary_app.include_router(user_endpoints.router, prefix="/api/user",
                             tags=["User"])
