from flask_sqlalchemy import SQLAlchemy
from sqlalchemy_serializer import SerializerMixin
from flask_login import UserMixin
from flask import current_app
from application.cache import create_job_queue

db = SQLAlchemy()

class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(100))

class TrapTracks(db.Model, UserMixin, SerializerMixin):
    id = db.Column(db.Integer, primary_key=True)
    trap_name = db.Column(db.String(100))
    trap_url = db.Column(db.String(100))
    track_cron_id = db.Column(db.String(100))


def clear_db():
    try:
        meta = db.metadata
        for table in reversed(meta.sorted_tables):
            db.session.execute(table.delete())
        db.session.commit()
    except:
        pass

def migrate_db():
    clear_db()

    async_job = create_job_queue('Wikipedia', 'https://www.wikipedia.org/')
    # existing trap tracks
    db.session.add(TrapTracks(id=1, trap_name='Wikipedia', trap_url='https://www.wikipedia.org/', track_cron_id=async_job['job_id']))

    # admin user
    db.session.add(User(id=1, username=current_app.config['ADMIN_USERNAME'], password=current_app.config['ADMIN_PASSWORD']))
    db.session.commit()
