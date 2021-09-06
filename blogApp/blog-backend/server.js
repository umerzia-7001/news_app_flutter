const cors = require("cors");
const express = require("express");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const Post = require("./models/post_model");
const Editor = require("./models/editor_model");
const Category = require("./models/category_model");
const mongoose = require("mongoose");
const dotenv = require("dotenv")

dotenv.config({ path: "./config.env" });



const app = express();
app.use(bodyParser.json());
app.use(cors());

const port = process.env.PORT || 5000;


mongoose
  .connect(
    "mongodb+srv://umerzia:umer7001@cluster0.2xawq.mongodb.net/chat-flutter?retryWrites=true&w=majority",
    {
      useUnifiedTopology: true,
      useNewUrlParser: true,
      useCreateIndex: true,
      useUnifiedTopology: true,
      useFindAndModify: false,
    }
  )
  .then(() => console.log("Mongodb is connected..."))
  .catch((err) => console.log(err));

  if (process.env.NODE_ENV === "development") {
    app.use(morgan("dev"));
  }


app.use("/login", require("./routes/login"));
app.get("/", (req, res) => {
  res.send("homepage !!!");
});

app.use("/users", require("./routes/register"));
app.get("/users", (req, res) => {
  res.send("users !!!");
});

app.use(express.json());
const postRoute = require("./routes/post");
app.use("/posts",postRoute);

const editorRoute = require("./routes/editor");
app.use("/editors",editorRoute);

const categoryRoutes = require("./routes/category");
app.use("/categories",categoryRoutes);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});