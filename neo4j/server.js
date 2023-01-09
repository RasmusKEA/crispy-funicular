const app = require("./app");

const server = app.listen(process.env.PORT || 8080, () => {
  console.clear();
  console.log("Listening on port " + server.address().port);
});
