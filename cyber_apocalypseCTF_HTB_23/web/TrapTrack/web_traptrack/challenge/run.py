from application.main import app
from application.database import db, migrate_db

with app.app_context():
    db.create_all()
    migrate_db()

app.run(host='0.0.0.0', port=1337, debug=False, use_evalex=False)