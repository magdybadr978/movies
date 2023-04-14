const express = require("express");
const app = express();

app.use(express.json());

const magdy = require("./routes/magdy");
const rates = require("./routes/rates");

app.listen(4000, "localhost" , () => {
  console.log("server is running ");
});

 app.use("/cinema", magdy);
 app.use("/cinema", rates);