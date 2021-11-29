const path              = require('path');
const fs                = require('fs');
const express           = require('express');
const router            = express.Router();

let db;

const response = data => ({ message: data });

router.get('/', (req, res) => {
	return res.redirect('/login');
});

router.get('/login', (req, res) => {
	return res.sendFile(path.resolve('views/login.html'));
});

router.post('/login', (req, res) => {

	let { username, password } = req.body;

	if (username && password) {
		return db.login(username, password)
			.then(user => {
                
				if (user == 'admin') {
                    return res.send(response(fs.readFileSync('/app/flag').toString()))
                };

				if (!user) {
                    return res.send(response('This record does not exist'))
                };
				return res.send(response('You are not admin'));
			})
			.catch(() => res.send(response('Something went wrong')));
	}
	
	return re.send(response('Missing parameters'));
});

router.get('/register', (req, res) => {
	return res.sendFile(path.resolve('views/register.html'));
});

router.post('/register', (req, res) => {

	let { username, password } = req.body;

	if (username && password) {
		return db.register(username, password)
			.then(()  => res.send(response('Successfully registered')))
			.catch(() => res.send(response('Something went wrong')));
	}

	return res.send(response('Missing parameters'));
});

module.exports = database => { 
	db = database;
	return router;
};