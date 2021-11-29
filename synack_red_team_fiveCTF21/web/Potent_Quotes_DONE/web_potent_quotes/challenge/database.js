const sqlite = require('sqlite-async');
const crypto = require('crypto');

class Database {
    constructor(db_file) {
        this.db_file = db_file;
        this.db = undefined;
    }
    
    async connect() {
        this.db = await sqlite.open(this.db_file);
    }

    async migrate() {
        return this.db.exec(`
            DROP TABLE IF EXISTS users;

            CREATE TABLE IF NOT EXISTS users (
                id         INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                username   VARCHAR(255) NOT NULL UNIQUE,
                password   VARCHAR(255) NOT NULL
            );

            INSERT INTO users (username, password) VALUES ('admin', '${ crypto.randomBytes(32).toString('hex') }');
        `);
    }

    async register(user, pass) {
        return new Promise(async (resolve, reject) => {
            try {
                let smt = await this.db.prepare(`INSERT INTO users (username, password) VALUES (?, ?)`);
                resolve((await smt.run(user, pass)));
            } catch(e) {
                reject(e);
            }
        });
    }

    async login(user, pass) {
        return new Promise(async (resolve, reject) => {
            try {
                let query = `SELECT username FROM users WHERE username = '${user}' and password = '${pass}'`;
                let row = await this.db.get(query);
                resolve(row !== undefined ? row.username : false);
            } catch(e) {
                reject(e);
            }
        });
    }
}

module.exports = Database;