const router = require("express").Router();
let Message = require("../models/message_model");

router.route("/").get((req, res) => {
  Message.find()
    .then((messages) => res.json(messages))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/").post((req, res) => {
  const username = req.body.username;
  const content = req.body.content;

  const newMessage = new Message({ username, content });

  newMessage
    .save()
    .then(() => res.json("Message added!"))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/delete/:id").delete((req, res) => {
  Message.findByIdAndDelete(req.params.id)
    .then(() => res.json("Message deleted."))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/update/:id").put((req, res) => {
  const id = req.params.id;
  const message = {
    username: req.body.username,
    content: req.body.content,
  };

  Message.findOneAndUpdate({_id: id}, message)
    .then(() => res.json("Message updated."))
    .catch((err) => res.status(400).json("Error: " + err));
});

module.exports = router;
