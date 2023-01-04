const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.static(__dirname + "/public"));

app.get('/', (req, res) => {
  
});

app.use((req, res, next) =>{
  res.status(404).sendFile(__dirname + "/public/404.html")
});

app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`);
});