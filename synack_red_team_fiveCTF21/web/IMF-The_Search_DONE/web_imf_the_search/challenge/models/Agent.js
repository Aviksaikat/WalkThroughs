const mongoose = require('mongoose');
const Schema = mongoose.Schema;

let Agent = new Schema({
	name: {
		type: String
	},
	identifier: {
		type: String
	},
	score: {
		type: Number
	}
}, {
	collection: 'agents'
});

module.exports = mongoose.model('Agent', Agent);
