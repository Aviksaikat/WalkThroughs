const Sequelize = require("sequelize");
const bcrypt = require("bcryptjs");
const { adminPassword } = require("./authorization");

const sequelize = new Sequelize({
    dialect: "sqlite",
    storage: "storage.Database",
    define: {
        timestamps: false,
    },
});

const products = [
    {
        title: "Octo Alien Annihilator",
        price: 8265,
    },
    {
        title: "Relic Retriever Joker",
        price: 3954,
    },
    {
        title: "Didactic Alien Destroyer",
        price: 7128,
    },
    {
        title: "River Rescuer",
        price: 1439,
    },
    {
        title: "Parasite Punisher",
        price: 5687,
    },
    {
        title: "Hack and Slash",
        price: 9316,
    },
];

const Database = {};

Database.sequelize = sequelize;

Database.Users = sequelize.define("user", {
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false,
        unique: true,
    },
    username: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
    },
    password: {
        type: Sequelize.STRING,
        allowNull: false,
    },
});

Database.Products = sequelize.define("product", {
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false,
    },
    title: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
    },
    price: {
        type: Sequelize.FLOAT,
        allowNull: false,
        unique: true,
    },
});

Database.Carts = sequelize.define("cart", {
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false,
    },
    userId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        unique: true,
    },
    productIds: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
});

Database.connect = async () => {
    try {
        await sequelize.authenticate();
    } catch (error) {
        console.error("Unable to connect to the database:", error);
    }
};

Database.create = async () => {
    try {
        await Database.Users.sync({ force: true });
        await Database.Products.sync({ force: true });
        await Database.Carts.sync({ force: true });
        await Database.Users.create({
            username: "admin",
            password: bcrypt.hashSync(adminPassword, 10),
        });
        products.forEach(async (product) => {
            await Database.Products.create(product);
        });
    } catch (error) {
        console.error("Error creating table:", error);
    }
};

module.exports = Database;
