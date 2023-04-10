const express = require("express");
const app = express();
const path = require("path");
const routes = require("./routes");
const cookieParser = require("cookie-parser");
const crypto = require("crypto");
const db = require("./utils/database");

app.use(express.json());
app.use(cookieParser(crypto.randomBytes(32).toString("hex")));

app.set("view engine", "jsrender");
app.set("views", path.join(__dirname, "views"));

app.use("/static", express.static(path.join(__dirname, "static")));
app.set("etag", false);

app.use(routes(db));

app.all("*", (req, res) => {
    return res.status(404).send({
        message: "404 page not found",
    });
});

(async () => {
    try {
        await db.connect();
        await db.create();
        app.listen(1337, "0.0.0.0", () =>
            console.log("Listening on port 1337")
        );
    } catch (error) {
        console.error(error);
    }
})();
