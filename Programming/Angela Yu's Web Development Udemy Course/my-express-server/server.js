const express = require("express");
const app = express();

app.get("/", function(req, res) {
  res.send("<h1>Hello, World!</h1>");
});

app.get("/contact", function(req, res) {
  res.send("Contact me at: jackmaring1@gmail.com");
});

app.get("/about", function(req, res) {
  res.send("I am a badass bitch");
});

app.get("/hobbies", function(req, res) {
  res.send("f b and get moneyyyyyyy");
});

app.listen(3000, function() {
  console.log("Server started on port 3000");
});
