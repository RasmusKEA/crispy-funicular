const express = require("express");
const app = express();

app.use((req, res, next) => {
  req.neo4j = require("./neo4j");
  next();
});

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

require("./routes/user.routes")(app);
require("./routes/review.routes")(app);
require("./routes/comment.routes")(app);

module.exports = app;
