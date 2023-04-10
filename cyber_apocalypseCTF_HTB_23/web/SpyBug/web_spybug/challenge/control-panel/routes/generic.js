const express = require("express");
const router = express.Router();

const authUser = require("../middleware/authuser");

router.get("/", authUser, (req, res) => {
  res.redirect("/panel");
});

module.exports = router;
