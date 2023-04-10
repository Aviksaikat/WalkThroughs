require("dotenv").config();

const fs = require("fs");
const path = require("path");
const express = require("express");
const session = require("express-session");

const { createAdmin } = require("./utils/database");
const { visitPanel } = require("./utils/adminbot");

const genericRoutes = require("./routes/generic");
const panelRoutes = require("./routes/panel");
const agentRoutes = require("./routes/agents");

const application = express();

const uploadsPath = path.join(__dirname, "uploads");

if (!fs.existsSync(uploadsPath)) fs.mkdirSync(uploadsPath);

application.use("/uploads", express.static(uploadsPath));
application.use("/static", express.static(path.join(__dirname, "static")));

application.use(express.urlencoded({ extended: true }));
application.use(express.json());

application.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: true,
    saveUninitialized: true,
  })
);

application.use((req, res, next) => {
  res.setHeader("Content-Security-Policy", "script-src 'self'; frame-ancestors 'none'; object-src 'none'; base-uri 'none';");
  res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  res.setHeader("Pragma", "no-cache");
  res.setHeader("Expires", "0");
  next();
});

application.set("view engine", "pug");

application.use(genericRoutes);
application.use(panelRoutes);
application.use(agentRoutes);

application.listen(process.env.API_PORT, "0.0.0.0", async () => {
  console.log(`Listening on port ${process.env.API_PORT}`);
});

createAdmin();
setInterval(visitPanel, 60000);
