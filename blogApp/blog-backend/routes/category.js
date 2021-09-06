const express = require("express");
const { findById } = require("../models/category_model");
const router = express.Router();
const Category = require("../models/category_model");

router.get("/", (req, res) => {
  Category.find()
    .then((doc) => {
      res.send(doc);
    })
    .catch((error) => {
      res.status(400).send("error is " + error);
    });
});
router.post('/new', (req, res) => {
  Category.create(req.body).then((doc) => {
      res.send("Category created: " + doc.id);
  }).catch((err) => {
      res.status(400).send(err);
  })
});
// router.post("new", (req, res) => {
//   Category.create(req.body)
//     .then(
//       (doc) => console.log("doc with id created" + doc.id),
//       res.statusCode(200),
//       res.send("Category Created: " + doc.id)
//     )
//     .catch((err) => {
//       console.log(err);
//       res.status(400).send("Error creating post");
//     });
// });

router.post("/id", (req, res) => {
  Category.findById(req.body.id, function (err, doc) {
    if (err) return res.status(400).send("Can't find " + req.body.id);
    res.send(doc);
  }).catch((err) => {
    console.log(err);
    res.status(400).send("Error getting post by id");
  });
});

module.exports = router;
