from application.util import generate
import os

class Config(object):
    SECRET_KEY = generate(50)
    ADMIN_USERNAME = 'admin'
    ADMIN_PASSWORD = 'admin'
    SESSION_PERMANENT = False
    SESSION_TYPE = 'filesystem'
    SQLALCHEMY_DATABASE_URI = 'sqlite:////tmp/database.db'
    REDIS_HOST = '127.0.0.1'
    REDIS_PORT = 6379
    REDIS_JOBS = 'jobs'
    REDIS_QUEUE = 'jobqueue'
    REDIS_NUM_JOBS = 100

class ProductionConfig(Config):
    pass

class DevelopmentConfig(Config):
    DEBUG = True

class TestingConfig(Config):
    TESTING = True