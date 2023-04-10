const express          = require('express');
const router           = express.Router();
const { graphqlHTTP }  = require('express-graphql');
const AuthMiddleware   = require('../middleware/AuthMiddleware');
const GraphqlSchema    = require('../helpers/GraphqlHelper');

router.get('/', (req, res) => {
    return res.render('login.html');
});

router.get('/register', (req, res) => {
    return res.render('register.html');
});

router.use('/graphql', AuthMiddleware, graphqlHTTP({
    schema: GraphqlSchema,
    graphiql: false
}));

router.get('/dashboard', AuthMiddleware, async (req, res, next) => {
    return res.render('dashboard.html', {user: req.user});
});

router.get('/logout', (req, res) => {
    res.clearCookie('session');
    return res.redirect('/');
});

module.exports = () => {
    return router;
};