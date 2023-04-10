module.exports = (sequelize, Sequelize) => {
  const Recording = sequelize.define("recording", {
    filepath: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    agentId: {
      type: Sequelize.STRING,
      allowNull: false,
    },
  });
  return Recording;
};
