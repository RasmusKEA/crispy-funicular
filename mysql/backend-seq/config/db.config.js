module.exports = {
  HOST: "34.163.130.17",
  USER: "root",
  PASSWORD: "password",
  DB: "rategame",
  dialect: "mysql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  },
};
