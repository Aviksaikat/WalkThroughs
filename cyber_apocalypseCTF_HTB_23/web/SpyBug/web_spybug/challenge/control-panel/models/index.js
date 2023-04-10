require("dotenv").config();

const Sequelize = require("sequelize");

const dbConfig = {
  dialect: "sqlite",
  storage: ":memory:",
  logging: false,
};

const sequelize = new Sequelize(dbConfig);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.Agent = require("./agent")(sequelize, Sequelize);
db.User = require("./user")(sequelize, Sequelize);
db.Recording = require("./recordings")(sequelize, Sequelize);

db.Agent.sync();
db.User.sync();
db.Recording.sync();

module.exports = db;
