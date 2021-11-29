const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const config = require('./db');

const defaultRoute = require('./routes/default.route');

mongoose.Promise = global.Promise;
mongoose.connect(config.DB, { useNewUrlParser: true, useUnifiedTopology: true}).then(
	() => {console.log('Database is connected')},
	err => {console.log('DB error: ' + err)}
);

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


app.use(express.static('static'));
app.set('view engine', 'pug')

app.use('/', defaultRoute);

let port = 80;

const server = app.listen(port, function() {
	console.log('Listening on port ' + port);
});
