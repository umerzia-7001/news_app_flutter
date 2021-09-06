const express = require("express");
const router = express.Router();
const Editors = require("../models/editor_model");
const mongoose = require("mongoose");

router.get("/", (req, res) => {

  Editors.find()
    .then((doc) => {
      res.statusCode(200), res.send(doc.id);
    })
    .catch((error) => {
      res.status(400).send(err);
    });
});
router.post('/id', (req, res) => {
//  if( !mongoose.Types.ObjectId.isValid(req.body.id) ) return false;
  Editors.findById(req.body.id).then((doc) => {
      console.log("Specific Author");
      res.send(doc);
  }).catch((err) => {
      res.status(400).send(err);
  });
});
// router.post("/id", (req, res) => {
//   try{
//   if (id.match(/^[0-9a-fA-F]{24}$/)) {
//   Editors.findById(req.body.id)
//     .then((doc) => {
//       res.statusCode(200), res.send(doc), console.log("Specific Author");
//     })
//   }}
//   catch(error) {
//       res.status(400).send("error is "+error);
//     }
// // });

router.post('/new', (req, res) => {
    Editors.create(req.body).then((doc) => {
        console.log(doc.id),
      
        res.send("Editor created: " + doc.id);
    }).catch((error) => {
        res.status(400).send("error is "+error);
    });
});

module.exports = router;
