const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const voiderSchema = new Schema({
  id: { type: String },
  previewURL: { type: String },
  user: { type: String },
  username: {type: String}
});

const Voider = mongoose.model("Voider", voiderSchema);

module.exports = Voider;
