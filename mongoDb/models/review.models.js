module.exports = (mongoose) => {
  var schema = mongoose.Schema(
    {
      idUser: String,
      review: String,
      title: String,
      rating: Number,
      ratingReasoning: String,
      platform: String,
      image: String,
      featured: Number,
    },
    { timestamps: true }
  );

  schema.method("toJSON", function () {
    const { __v, _id, ...object } = this.toObject();
    object.id = _id;
    return object;
  });

  const Review = mongoose.model("review", schema);
  return Review;
};
