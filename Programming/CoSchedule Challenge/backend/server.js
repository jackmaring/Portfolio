const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");

require("dotenv").config();

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

const uri = process.env.ATLAS_URI;
mongoose.connect(uri, {
  useNewUrlParser: true,
  useCreateIndex: true,
  useUnifiedTopology: true,
});

const connection = mongoose.connection;
connection.once("open", () => {
  console.log("MongoDB database connection established successfully");
});

const favoritesRouter = require("./routes/favorites");
const messagesRouter = require("./routes/messages");
const voiderzRouter = require("./routes/voiderz");

app.use("/favorites", favoritesRouter);
app.use("/messages", messagesRouter);
app.use("/voiderz", voiderzRouter);

app.listen(port, () => {
  console.log(`Server is running on port: ${port}`);
});
