from pydantic import BaseSettings


class MysteriousSettings(BaseSettings):
    flag: str = "ictf{what_a_not_fake_flag_:thonk:}"
    magical_token: str = "0nlyL33tHax0rsAll0w3d"

    class Config:
        env_file = "flag.txt"


tags_metadata = [
    {
        "name": "Home",
        "description": "Routes that do not do something",
    },
    {
        "name": "User",
        "description": "Routes that might do something",
    },
    {
        "name": "Admin",
        "description": "Routes that probably do something",
    },
]
