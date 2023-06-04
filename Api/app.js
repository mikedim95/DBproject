const express = require("express");

const app = express();
const port = 4000;
const cors = require("cors");
app.use(cors());

app.use(express.json());
const privateRoutes = require("./routes/private");
const authRoutes = require("./routes/auth");
app.use("/private", privateRoutes);
app.use("/auth", authRoutes);
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
