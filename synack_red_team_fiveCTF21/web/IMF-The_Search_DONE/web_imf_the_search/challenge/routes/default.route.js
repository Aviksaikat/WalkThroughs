const express = require('express');
const defaultRoutes = express.Router();
const pug = require('pug');

let Agent = require('../models/Agent');


// Router for index page
defaultRoutes.route('/').get( (req, res) => {
	query = { name : { $in : ["Ilsa Faust", "Owen Davian", "Ethan Hunt"] } };
	Agent.find(query, (err, agents) => {
		if (err) {
			console.log(err);
			return res.json(err);
		} else {
			res.render('index', { agents: agents});
		}
	});
});

defaultRoutes.route('/').post( (req, res) => {
	let name = req.body.name;
	let search = name.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
	if (typeof name !== 'undefined' && name != "") {
		query = { name : {$regex: search, $options: "i"} };
		Agent.find(query,  (err, agents) => {
			if (err) {
				console.log(err);
				return res.json(err);
			} else {
				return res.render('index', { agents: agents, name: pug.render(`| ${name}`) });
			}
		});
	} else {
		return res.redirect('/');
	}
});

module.exports = defaultRoutes;