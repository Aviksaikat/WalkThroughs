const sqlite = require('sqlite-async');

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
            DROP TABLE IF EXISTS party_requests;

            CREATE TABLE party_requests(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                halloween_name VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                costume_type VARCHAR(255) NOT NULL,
                trick_or_treat VARCHAR(20) NOT NULL
             )
        `);
	}

	async party_request_add(halloween_name, email, costume_type, trick_or_treat) {
		return new Promise(async (resolve, reject) => {
			try {
				let stmt = await this.db.prepare('INSERT INTO party_requests (halloween_name, email, costume_type, trick_or_treat) VALUES (?, ?, ?, ?)');
				resolve((await stmt.run(halloween_name, email, costume_type, trick_or_treat)));
			} catch(e) {
				reject(e);
			}
		});
	}

	async get_party_requests(){
		return new Promise(async (resolve, reject) => {
			try {
				let stmt = await this.db.prepare('SELECT * FROM party_requests');
				resolve(await stmt.all());
			} catch(e) {
				reject(e);
			}
		});
	}

	async remove_requests(){
		return new Promise(async (resolve, reject) => {
			try {
				let stmt = await this.db.prepare('DELETE FROM party_requests');
				resolve(await stmt.run());
			} catch(e) {

			}
		})
	}

}

module.exports = Database;