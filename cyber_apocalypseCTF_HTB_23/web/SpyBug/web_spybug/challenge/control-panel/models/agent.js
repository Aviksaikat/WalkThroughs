module.exports = (sequelize, Sequelize) => {
  const Agent = sequelize.define("agent", {
    identifier: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    token: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    hostname: {
      type: Sequelize.STRING,
      allowNull: true,
    },
    platform: {
      type: Sequelize.STRING,
      allowNull: true,
    },
    arch: {
      type: Sequelize.STRING,
      allowNull: true,
    },
  });
  return Agent;
};
