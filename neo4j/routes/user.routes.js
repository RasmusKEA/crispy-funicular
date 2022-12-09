const router = require("express").Router();
const Review = require("../model/review.model.js");

module.exports = (app) => {
  router.post("/signup", async (req, res, next) => {
    // Create User

    let existingUser = await req.neo4j.read(
      `MATCH (u:User) WHERE u.username = "${req.body.username}" OR u.email = "${req.body.email}" return u`
    );

    if (!existingUser.records.length) {
      req.neo4j
        .write(
          `
        CREATE (u:User{
          id: randomUUID(), 
          username: "${req.body.username}", 
          password: "${req.body.password}", 
          email: "${req.body.email}"}) 
          return u
      `
        )
        // Convert to user entity
        .then((res) => {
          const review = new Review(res.records[0].get("u"));

          return {
            ...review.toJson(),
          };
        })
        // Return the output
        .then((user) => res.json({ user }))
        // Pass any errors to the next middleware
        .catch(next);
    } else {
      res.status(400).send({
        message: "Failed! Email or username is already in use!",
      });
    }
  });

  router.post("/signin", (req, res, next) => {
    req.neo4j
      .read(
        `MATCH (u:User) WHERE u.username = "${req.body.username}" AND u.password = "${req.body.password}" return u`
      )
      .then((user) => {
        console.log();
        if (user.records.length) {
          const userFound = new User(user.records[0].get("u"));

          return {
            ...userFound.toJson(),
          };
        } else {
          res.status(400).send("No user found");
        }
      })
      // Return the output
      .then((userFound) => res.json({ userFound }))
      // Pass any errors to the next middleware
      .catch(next);
  });

  app.use("/api/auth", router);
};
