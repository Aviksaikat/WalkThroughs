module.exports = (db) => {
    const bcrypt = require("bcryptjs");
    const router = require("express").Router();
    const jwt = require("jsonwebtoken");
    const jsrender = require("jsrender");
    const AuthMiddleware = require("../middleware/AuthMiddleware");
    const AdminMiddleware = require("../middleware/AdminMiddleware");
    const { tokenKey, getUserId } = require("../utils/authorization");

    const response = (data) => ({ message: data });

    router.get("/", AuthMiddleware, async (req, res) => {
        try {
            const products = await db.Products.findAll();
            res.render("index", { products: products });
        } catch (error) {
            console.error(error);
            res.status(500).send("Something went wrong!");
        }
    });

    router.get("/register", async (req, res) => {
        res.render("register");
    });

    router.post("/register", async (req, res) => {
        try {
            const username = req.body.username;
            const password = req.body.password;

            if (!username || !password) {
                return res
                    .status(400)
                    .send(response("Username and password are required"));
            }

            const existingUser = await db.Users.findOne({
                where: { username: username },
            });
            if (existingUser) {
                return res
                    .status(400)
                    .send(response("Username already exists"));
            }

            await db.Users.create({
                username: username,
                password: bcrypt.hashSync(password),
            }).then(() => {
                res.send(response("User registered succesfully"));
            });
        } catch (error) {
            console.error(error);
            res.status(500).send({
                error: "Something went wrong!",
            });
        }
    });

    router.get("/login", async (req, res) => {
        res.render("login");
    });

    router.post("/login", async (req, res) => {
        try {
            const username = req.body.username;
            const password = req.body.password;

            if (!username || !password) {
                return res
                    .status(400)
                    .send(response("Username and password are required"));
            }

            const user = await db.Users.findOne({
                where: { username: username },
            });
            if (!user) {
                return res
                    .status(400)
                    .send(response("Invalid username or password"));
            }

            const validPassword = bcrypt.compareSync(password, user.password);
            if (!validPassword) {
                return res
                    .status(400)
                    .send(response("Invalid username or password"));
            }

            const token = jwt.sign({ id: user.id }, tokenKey, {
                expiresIn: "1h",
            });

            res.cookie("session", token);

            return res.status(200).send(response("Logged in successfully"));
        } catch (error) {
            console.error(error);
            res.status(500).send({
                error: "Something went wrong!",
            });
        }
    });

    router.get("/cart", AuthMiddleware, async (req, res) => {
        try {
            let products;
            const userId = getUserId(req.cookies.session);
            const cart = await db.Carts.findOne({ where: { userId: userId } });

            if (cart && cart.productIds) {
                products = await db.Products.findAll({
                    where: {
                        id: JSON.parse(cart.productIds),
                    },
                });
            }

            res.render("cart", { products: products });
        } catch (error) {
            console.error(error);
            res.status(500).send("Something went wrong!");
        }
    });

    router.post("/add-to-cart/:item", AuthMiddleware, async (req, res) => {
        const item = req.params.item;
        const userId = getUserId(req.cookies.session);

        try {
            if (!item) {
                return res
                    .status(400)
                    .send(response("Item needs to be specified"));
            }

            const cart = await db.Carts.findOne({ where: { userId: userId } });

            if (!cart) {
                const newCart = db.Carts.build({
                    userId: userId,
                    productIds: JSON.stringify([item]),
                });
                await newCart.save();
                return res.send(response("Item added to cart!"));
            }

            if (cart.productIds.includes(item)) {
                return res
                    .status(400)
                    .send(response("Product already in cart"));
            }
            const productIds = JSON.parse(cart.productIds);
            productIds.push(item);

            await db.Carts.update(
                { productIds: JSON.stringify(productIds) },
                { where: { userId: userId } }
            );

            return res.send(response("Item added to cart!"));
        } catch (error) {
            console.error(error);
            res.status(500).send({
                error: "Something went wrong!",
            });
        }
    });

    router.post("/remove-from-cart/:item", AuthMiddleware, async (req, res) => {
        try {
            const item = req.params.item;
            if (!item) {
                return res
                    .status(400)
                    .send(response("Item needs to be specified"));
            }

            const userId = getUserId(req.cookies.session);

            const cart = await db.Carts.findOne({ where: { userId: userId } });
            if (!cart) {
                return res.status(404).send(response("Cart not found"));
            }

            const productIds = JSON.parse(cart.productIds);
            const index = productIds.indexOf(item);
            if (index === -1) {
                return res.status(404).send(response("Item not found in cart"));
            }

            productIds.splice(index, 1);

            await db.Carts.update(
                { productIds: JSON.stringify(productIds) },
                { where: { userId: userId } }
            );

            res.send(response("Item removed from cart!"));
        } catch (error) {
            console.error(error);
            res.status(500).send({
                error: "Something went wrong!",
            });
        }
    });

    router.get("/admin", AdminMiddleware, async (req, res) => {
        try {
            const users = await db.Users.findAll();
            const usernames = users.map((user) => user.username);

            res.render("admin", {
                users: jsrender.templates(`${usernames}`).render(),
            });
        } catch (error) {
            console.error(error);
            res.status(500).send("Something went wrong!");
        }
    });

    router.get("/logout", async (req, res) => {
        res.clearCookie("session");
        return res.redirect("/");
    });

    return router;
};
