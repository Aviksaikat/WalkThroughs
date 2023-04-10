const crypto = require("crypto");
const jwt = require("jsonwebtoken");

const adminPassword = crypto
    .randomBytes(32 / 2)
    .toString("hex")
    .slice(0, 32);
const tokenKey = crypto
    .randomBytes(64 / 2)
    .toString("hex")
    .slice(0, 64);

const getUserId = (sessionCookie) => {
    try {
        const session = jwt.verify(sessionCookie, tokenKey);
        const userId = session.id;
        return userId;
    } catch (err) {
        return null;
    }
};

module.exports = { adminPassword, tokenKey, getUserId };
