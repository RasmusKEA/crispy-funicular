module.exports = (app) => {
  const reviews = require("../controllers/review.controller.js");

  var router = require("express").Router();

  router.post("/", reviews.create);
  router.get("/featured", reviews.findFeatured);
  router.get("/", reviews.findAll);
  router.get("/:id", reviews.findOne);
  router.put("/:id", reviews.update);
  router.delete("/:id", reviews.delete);

  app.use("/api/review", router);
};
