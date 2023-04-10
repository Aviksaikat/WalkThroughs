const { checkAgentLogin } = require("../utils/database");

module.exports = async (req, res, next) => {
  const { identifier, token } = req.params;

  if (!(identifier && token)) return res.sendStatus(400);

  if (!(await checkAgentLogin(identifier, token))) return res.sendStatus(401);

  next();
};
