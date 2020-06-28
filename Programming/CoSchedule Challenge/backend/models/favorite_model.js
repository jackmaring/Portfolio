const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const favoriteSchema = new Schema({
  id: { type: String },
  previewURL: { type: String },
  user: { type: String },
  username: {type: String}
});

const Favorite = mongoose.model("Favorite", favoriteSchema);

module.exports = Favorite;
