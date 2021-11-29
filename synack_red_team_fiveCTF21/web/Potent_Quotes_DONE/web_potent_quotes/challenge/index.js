const express       = require('express');
const app           = express();
const bodyParser    = require('body-parser');
const routes        = require('./routes');
const path          = require('path');
const Database      = require('./database');

const db = new Database('potent_quotes.db');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.set('views', './views');
app.use('/static', express.static(path.resolve('static')));

app.use(routes(db));

app.all('*', (req, res) => {
    return res.status(404).send({
        message: '404 page not found'
    });
});

(async () => {
    await db.connect();
    await db.migrate();

    app.listen(80, () => console.log('Listening on port 80'));
})();