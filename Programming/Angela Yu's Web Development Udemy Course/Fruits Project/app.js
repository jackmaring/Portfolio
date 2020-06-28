const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost:27017/fruitsDB", {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const fruitSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, "Please check your data entry: no name specified"]
  },
  rating: {
    type: Number,
    min: 1,
    max: 10
  },
  review: String
});

const Fruit = mongoose.model("Fruit", fruitSchema);

const fruit = new Fruit({
  rating: 7,
  review: "Pretty solid as a fruit"
});

// fruit.save();

const personSchema = new mongoose.Schema({
  name: String,
  age: Number,
  favoriteFruit: fruitSchema
});

const Person = mongoose.model("Person", personSchema);

const pineapple = new Fruit ({
  name: "Pineapple",
  rating: 9,
  review: "Great fruit"
});

pineapple.save();

const person = new Person({
  name: "John",
  age: 12,
  favoriteFruit: pineapple
});

person.save();

const kiwi = new Fruit({
  name: "Kiwi",
  rating: 10,
  review: "Kiwis are pretty awesome"
});

const orange = new Fruit({
  name: "Orange",
  rating: 4,
  review: "Oranges are sour"
});

const banana = new Fruit({
  name: "Banana",
  rating: 3,
  review: "Weird texture"
});

// Fruit.insertMany([kiwi, orange, banana], function(err) {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("Successfully saved all the fruits to fruitsDB");
//   }
// });

Fruit.find(function(err, fruits) {
  if (err) {
    console.log(err);
  } else {
    mongoose.connection.close();

    fruits.forEach(function(fruit) {
      console.log(fruit.name);
    });
  }
});

// Fruit.updateOne({_id: "5ebd61e1d5b4481b3d4d307b"}, {name: "Peach"}, function(err) {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("Successfully updated document");
//   }
// });

// Fruit.deleteOne({name: "Peach"}, function(err) {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("Successfully deleted the document");
//   }
// });

// Person.deleteMany({
//   name: "John"
// }, function(err) {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("Successfully deleted documents");
//   }
// });
