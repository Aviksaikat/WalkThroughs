from sqlalchemy import Column, Integer, String
from sqlalchemy_utils import UUIDType

from src import database


class ImaginaryUser(database.Base):
    __tablename__ = "imaginary_user"

    imaginary_id = Column(UUIDType(binary=False), primary_key=True)
    imaginary_discoveries = Column(String, unique=False)
    imaginary_points = Column(Integer)
    imaginary_number = Column(Integer)
    imaginary_attempts = Column(Integer)
    imaginary_timestamp = Column(Integer)
