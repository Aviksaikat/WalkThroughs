import random

from application.config import Config
from faker import Faker
from pymongo import MongoClient

fake = Faker()
client = MongoClient(Config.MONGO_URI)
db = client[Config.DB_NAME]
users_collection = db["users"]

def generate_random_user():
    email = fake.email()
    password = fake.password()
    return {
        "email": email,
        "password": password
    }


def start_migration():
    num_users = 10
    for _ in range(num_users):
        random_user = generate_random_user()
        users_collection.insert_one(random_user)