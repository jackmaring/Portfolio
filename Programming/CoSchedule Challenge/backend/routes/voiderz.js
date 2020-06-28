const router = require("express").Router();
let Voider = require("../models/voider_model");

router.route("/").get((req, res) => {
  Voider.find()
    .then((voiderz) => res.json(voiderz))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/").post((req, res) => {
  const id = req.body.id;
  const previewURL = req.body.previewURL;
  const user = req.body.user;
  const username = req.body.username;

  const newVoider = new Voider({ id, previewURL, user, username });

  newVoider
    .save()
    .then(() => res.json("Voider added!"))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/:id").delete((req, res) => {
  Voider.findByIdAndDelete(req.params.id)
    .then(() => res.json("Voider deleted."))
    .catch((err) => res.status(400).json("Error: " + err));
});

module.exports = router;
