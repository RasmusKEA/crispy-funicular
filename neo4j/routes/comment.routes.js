const router = require("express").Router();
const Comment = require("../model/comment.model.js");

module.exports = (app) => {
  router.get("/", (req, res, next) => {
    req.neo4j
      .read("Match (c:Comment) return c")
      .then((result) => {
        return result.records.map((i) => i.get("c").properties);
      })
      .then((json) => res.send(json))
      // Pass any errors to the next middleware
      .catch(next);
  });

  router.post("/", (req, res, next) => {
    console.log(req.body);
    req.neo4j
      .write(
        `CREATE (c:Comment{
          id: randomUUID(), 
          idUser: "${req.body.idUser}",
          idReview: "${req.body.idReview}",
          userComment: "${req.body.userComment}"})
          return c
      `
      )
      // Convert to user entity
      .then((res) => {
        const comment = new Comment(res.records[0].get("c"));

        return {
          ...comment.toJson(),
        };
      })
      // Return the output
      .then((comment) => res.json({ comment }))
      // Pass any errors to the next middleware
      .catch(next);
  });

  router.get("/:id", (req, res, next) => {
    let { id } = req.params;
    req.neo4j
      .read(`Match (c:Comment {id: "${id}"}) return c`)
      .then((result) => {
        return result.records.map((i) => i.get("c").properties);
      })
      .then((json) => res.send(json))
      // Pass any errors to the next middleware
      .catch(next);
  });

  router.put("/:id", (req, res, next) => {
    console.log(req.params);
    let { id } = req.params;
    console.log(req.body);
    req.neo4j
      .write(
        `MATCH (c {id: "${id}"})
        SET c.idUser = "${req.body.idUser}",
        c.idReview = "${req.body.idReview}",
        c.userComment = "${req.body.userComment}"
        return c`
      )
      // Convert to user entity
      .then((res) => {
        const user = new Comment(res.records[0].get("c"));

        return {
          ...user.toJson(),
        };
      })
      // Return the output
      .then((user) => res.json({ user }))
      // Pass any errors to the next middleware
      .catch(next);
  });

  router.delete("/:id", (req, res, next) => {
    console.log(req.params);
    let { id } = req.params;
    console.log(req.body);
    req.neo4j
      .write(
        `MATCH (c {id: "${id}"})
        DELETE c`
      )
      // Return the output
      .then(res.status(200).send("Deleted succesfully"))
      // Pass any errors to the next middleware
      .catch(next);
  });

  app.use("/api/comment", router);
};
