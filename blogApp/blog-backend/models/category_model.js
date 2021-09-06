
const mongoose = require("mongoose");
const Categories = mongoose.Schema({
    
    title: {
      type: String,
      required: true,
    },
    
  });

module.exports = Category = mongoose.model("Categories", Categories);