from application.app import app
from application.util.migrate import start_migration

start_migration()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=1337, threaded=True, debug=False)