const express = require("express");
const app = express();
const path = require("path");

// Serve the index.html file when the root route is requested
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

// Serve CSS files when requested
app.get("/css/:cssFile", (req, res) => {
  res.sendFile(path.join(__dirname, "css", req.params.cssFile));
});

// Serve images when requested
app.use("/img", express.static(path.join(__dirname, "img")));

const server = app.listen(5000);
const portNumber = server.address().port;
console.log(`port is open on ${portNumber}`);
