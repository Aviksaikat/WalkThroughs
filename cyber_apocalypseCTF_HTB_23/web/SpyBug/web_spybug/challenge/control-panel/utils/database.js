const bcrypt = require("bcryptjs");
const { v4: uuidv4 } = require("uuid");

const db = require("./../models");
const Op = db.Sequelize.Op;

exports.createAdmin = async () => {
  await db.User.sync();
  await db.User.create({
    username: "admin",
    password: bcrypt.hashSync(process.env.ADMIN_SECRET),
  });
};

exports.checkUserLogin = async (username, password) => {
  const results = await db.User.findOne({
    where: {
      username: username,
    },
  });

  if (!results) return false;

  if (!bcrypt.compareSync(password, results.password)) return false;

  return true;
};

exports.registerAgent = async () => {
  const agentId = uuidv4();
  const agentToken = uuidv4();

  const options = {
    identifier: agentId,
    token: agentToken,
  };

  await db.Agent.create(options);

  return options;
};

exports.checkAgentLogin = async (agentId, agentToken) => {
  const results = await db.Agent.findOne({
    where: {
      [Op.and]: [{ identifier: agentId }, { token: agentToken }],
    },
  });

  if (!results) return false;

  return true;
};

exports.updateAgentDetails = async (agentId, hostname, platform, arch) => {
  await db.Agent.update(
    {
      hostname: hostname,
      platform: platform,
      arch: arch,
    },
    {
      where: {
        identifier: agentId,
      },
    }
  );
};

exports.getAgents = async () => {
  const results = await db.Agent.findAll();

  if (!results) return false;

  return results;
};

exports.createRecording = async (agentId, filepath) => {
  await db.Recording.create({
    agentId: agentId,
    filepath: "/uploads/" + filepath,
  });
};

exports.getRecordings = async () => {
  const results = await db.Recording.findAll();

  if (!results) return false;

  return results;
};
