const router = require("express").Router();
const Review = require("../model/review.model.js");

module.exports = (app) => {
  router.get("/", (req, res, next) => {
    req.neo4j
      .read("Match (r:Review) return r")
      .then((result) => {
        return result.records.map((i) => i.get("r").properties);
      })
      .then((json) => res.send(json))
      // Pass any errors to the next middleware
      .catch(next);
  });

  router.get("/:id", (req, res, next) => {
    let { id } = req.params;
    req.neo4j
      .read(`Match (r:Review {id: "${id}"}) return r`)
      .then((result) => {
        return result.records.map((i) => i.get("r").properties);
      })
      .then((json) => res.send(json))
      // Pass any errors to the next middleware
      .catch(next);
  });

  router.post("/", (req, res, next) => {
    console.log(req.body);
    req.neo4j
      .write(
        `CREATE (r:Review{
          id: randomUUID(), 
          idUser: "${req.body.idUser}",
          review: "${req.body.review}",
          title: "${req.body.title}",
          rating: "${req.body.rating}",
          ratingReasoning: "${req.body.ratingReasoning}",
          platform: "${req.body.platform}",
          image: "${req.body.image}",
          featured: "${req.body.featured}"})
          return r
      `
      )
      // Convert to user entity
      .then((res) => {
        const user = new Review(res.records[0].get("r"));

        return {
          ...user.toJson(),
        };
      })
      // Return the output
      .then((user) => res.json({ user }))
      // Pass any errors to the next middleware
      .catch(next);
  });

  router.put("/:id", (req, res, next) => {
    console.log(req.params);
    let { id } = req.params;
    console.log(req.body);
    req.neo4j
      .write(
        `MATCH (r {id: "${id}"})
        SET r.idUser = "${req.body.idUser}",
        r.review = "${req.body.review}",
        r.title = "${req.body.title}",
        r.rating = "${req.body.rating}",
        r.ratingReasoning = "${req.body.ratingReasoning}",
        r.platform = "${req.body.platform}",
        r.image = "${req.body.image}",
        r.featured = "${req.body.featured}"
        return r`
      )
      // Convert to user entity
      .then((res) => {
        const user = new Review(res.records[0].get("r"));

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
        `MATCH (r {id: "${id}"})
        DELETE r`
      )
      // Return the output
      .then(res.status(200).send("Deleted succesfully"))
      // Pass any errors to the next middleware
      .catch(next);
  });

  app.use("/api/review", router);
};
