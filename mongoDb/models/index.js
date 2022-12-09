const dbConfig = require("../config/db.config");

const mongoose = require("mongoose");
mongoose.Promise = global.Promise;

const db = {};
db.mongoose = mongoose;
db.url = dbConfig.url;
db.review = require("../models/review.models.js")(mongoose);
db.comment = require("../models/comment.models.js")(mongoose);
db.user = require("./user.models.js")(mongoose);
db.role = require("./role.models.js")(mongoose);
db.ROLES = ["user", "admin", "staff"];

module.exports = db;
