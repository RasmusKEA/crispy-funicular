const db = require("../models");
const Review = db.review;

exports.create = (req, res) => {
  const review = new Review({
    idUser: req.body.idUser,
    review: req.body.review,
    title: req.body.title,
    rating: req.body.rating,
    ratingReasoning: req.body.ratingReasoning,
    platform: req.body.platform,
    image: req.body.image,
    featured: req.body.featured,
  });

  review
    .save(review)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Review.",
      });
    });
};

exports.findAll = (req, res) => {
  Review.find()
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Reviews.",
      });
    });
};

exports.findOne = (req, res) => {
  const id = req.params.id;

  Review.findById(id)
    .then((data) => {
      if (!data)
        res.status(404).send({ message: "Not found Review with id " + id });
      else res.send(data);
    })
    .catch((err) => {
      res
        .status(500)
        .send({ message: "Error retrieving Review with id=" + id });
    });
};

exports.findFeatured = (req, res) => {
  Review.findAll({ where: { featured: 1 } })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Reviews.",
      });
    });
};

exports.findFeatured = (req, res) => {
  Review.findOne({ featured: 1 })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving Reviews.",
      });
    });
};

exports.update = (req, res) => {
  const id = req.params.id;

  Review.findByIdAndUpdate(id, req.body, { useFindAndModify: false })
    .then((data) => {
      if (!data) {
        res.status(404).send({
          message: `Cannot update Review with id=${id}. Maybe Review was not found!`,
        });
      } else res.send({ message: "Review was updated successfully." });
    })
    .catch((err) => {
      res.status(500).send({
        message: "Error updating Review with id=" + id,
      });
    });
};

exports.delete = (req, res) => {
  const id = req.params.id;

  Review.findByIdAndRemove(id)
    .then((data) => {
      if (!data) {
        res.status(404).send({
          message: `Cannot delete Review with id=${id}. Maybe Review was not found!`,
        });
      } else {
        res.send({
          message: "Review was deleted successfully!",
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: "Could not delete Review with id=" + id,
      });
    });
};
