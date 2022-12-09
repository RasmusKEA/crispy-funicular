const db = require("../models");
const Comment = db.comment;

exports.create = (req, res) => {
  const comment = new Comment({
    idUser: req.body.idUser,
    idReview: req.body.idReview,
    userComment: req.body.userComment,
  });

  comment
    .save(comment)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Comment.",
      });
    });
};

exports.findAll = (req, res) => {
  Comment.find()
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message ||
          "Some error occurred while retrieving Comments by review id.",
      });
    });
};

exports.findAllByReview = (req, res) => {
  const { id } = req.params;
  console.log(id);
  Comment.find({ idReview: id })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message ||
          "Some error occurred while retrieving Comments by review id.",
      });
    });
};

exports.findOne = (req, res) => {
  const id = req.params.id;

  Comment.findById(id)
    .then((data) => {
      if (!data)
        res.status(404).send({ message: "Not found Comment with id " + id });
      else res.send(data);
    })
    .catch((err) => {
      res
        .status(500)
        .send({ message: "Error retrieving Comment with id=" + id });
    });
};

exports.update = (req, res) => {
  const id = req.params.id;

  Comment.findByIdAndUpdate(id, req.body, { useFindAndModify: false })
    .then((data) => {
      if (!data) {
        res.status(404).send({
          message: `Cannot update Comment with id=${id}. Maybe Comment was not found!`,
        });
      } else res.send({ message: "Comment was updated successfully." });
    })
    .catch((err) => {
      res.status(500).send({
        message: "Error updating Comment with id=" + id,
      });
    });
};

exports.delete = (req, res) => {
  const id = req.params.id;

  Comment.findByIdAndRemove(id)
    .then((data) => {
      if (!data) {
        res.status(404).send({
          message: `Cannot delete Comment with id=${id}. Maybe Comment was not found!`,
        });
      } else {
        res.send({
          message: "Comment was deleted successfully!",
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: "Could not delete Comment with id=" + id,
      });
    });
};
