const router = require("express").Router();
let Favorite = require("../models/favorite_model");

router.route("/").get((req, res) => {
  Favorite.find()
    .then((favorites) => res.json(favorites))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/").post((req, res) => {
  const id = req.body.id;
  const previewURL = req.body.previewURL;
  const user = req.body.user;
  const username = req.body.username;

  const newFavorite = new Favorite({ id, previewURL, user, username });

  newFavorite
    .save()
    .then(() => res.json("Favorite added!"))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/:id").delete((req, res) => {
  Favorite.findByIdAndDelete(req.params.id)
    .then(() => res.json("Favorite deleted."))
    .catch((err) => res.status(400).json("Error: " + err));
});

module.exports = router;
