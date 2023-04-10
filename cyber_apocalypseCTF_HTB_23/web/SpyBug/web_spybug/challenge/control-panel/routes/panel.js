const express = require("express");
const router = express.Router();

const {
  checkUserLogin,
  getAgents,
  getRecordings,
} = require("./../utils/database");

const authUser = require("../middleware/authuser");

router.get("/panel", authUser, async (req, res) => {
  res.render("panel", {
    username:
      req.session.username === "admin"
        ? process.env.FLAG
        : req.session.username,
    agents: await getAgents(),
    recordings: await getRecordings(),
  });
});

router.get("/panel/logout", authUser, (req, res) => {
  req.session.destroy();
  res.redirect("/panel/login");
});

router.get("/panel/login", (req, res) => {
  res.render("login");
});

router.post("/panel/login", async (req, res) => {
  let username = req.body.username;
  let password = req.body.password;

  if (!(username && password)) return res.sendStatus(400);
  if (!(await checkUserLogin(username, password)))
    return res.redirect("/panel/login");

  req.session.loggedin = true;
  req.session.username = username;

  res.redirect("/panel");
});

module.exports = router;
