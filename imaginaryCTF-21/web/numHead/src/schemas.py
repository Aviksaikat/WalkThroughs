from typing import Dict, List
from pydantic import BaseModel

class JSONMessage(BaseModel):
    response_dictionary: Dict[str, str]


