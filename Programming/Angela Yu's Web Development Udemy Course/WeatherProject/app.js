const express = require("express");
const https = require("https");
const bodyParser = require("body-parser");

const app = express();

app.use(bodyParser.urlencoded({extended: true}));

app.get("/", function(req, res) {
  res.sendFile(__dirname + "/index.html");
});

app.post("/", function(req, res) {

  const query = req.body.cityName;
  const apiKey = "5c2418a9686892a88a95d2eea7ef863b";
  const unit = "imperial";
  const url = "https://api.openweathermap.org/data/2.5/weather?q=" + query + "&appid=" + apiKey + "&units=" + unit;

  https.get(url, function(response) {
    console.log(response.statusCode);

    response.on("data", function(data) {

      const weaterData = JSON.parse(data);
      const temp = weaterData.main.temp;
      const desc = weaterData.weather[0].description;
      const icon = weaterData.weather[0].icon;
      const imageUrl = "http://openweathermap.org/img/wn/" + icon + "@2x.png";

      res.write("<p>The weather is currently " + desc + "</p>");
      res.write("<h1>The temperature in " + query + " is " + temp + "</h1>");
      res.write("<img src=" + imageUrl + ">");
      res.send();
    });
  });
});

app.listen(3000, function() {
  console.log("Server is running on port 3000");
});
