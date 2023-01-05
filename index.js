//for use express with node.js
const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

//for te static documents
app.use(express.static(__dirname + "/public"));

//get the main rute
app.get('/', (req, res) => {
});

//for rutes not found
app.use((req, res, next) =>{
  res.status(404).sendFile(__dirname + "/public/404.html")
});

//turn on the server 
app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`);
});