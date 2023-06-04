const express = require("express");
const router = express.Router();
const mysql = require("mysql2");

router.post("/login", (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res
      .status(400)
      .json({ message: "Please provide both username and password" });
  }
  const connection = mysql.createConnection({
    host: "127.0.0.1",
    port: "3306",
    user: "root",
    password: "root",
    database: "database_7",
  });
  connection.connect((err) => {
    if (err) {
      console.error("Error connecting to MySQL:", err);
      return res.status(401).json({ message: "Invalid username or password" });
    }

    // Query the credentials table to check the username and password
    const query =
      "SELECT isaOperator, isaUser, isaAdministrator FROM credentials WHERE username = ? AND password = ?";
    connection.query(query, [username, password], (error, results) => {
      connection.end(); // Close the database connection

      if (error) {
        console.error("Error executing query:", error);
        return res.status(500).json({ message: "An error occurred" });
      }

      if (results.length === 0) {
        return res
          .status(401)
          .json({ message: "Invalid username or password" });
      }

      const credentials = results[0];
      console.log(credentials);
      if (credentials.isaOperator === 1) {
        res.json({ redirectUrl: "/Operator", role: "Operator" });
      } else if (credentials.isaUser === 1) {
        res.json({ redirectUrl: "/User", role: "User" });
      } else if (credentials.isaAdministrator === 1) {
        res.json({ redirectUrl: "/Administrator", role: "Administrator" });
      } else {
        res.status(401).json({ message: "Invalid user role" });
      }
    });
  });

  console.log(req.body);
  // Validate the username and password (e.g., check for required fields)

  // Check the username and password against your database or authentication system
  // Replace this with your actual authentication logic
});

module.exports = router;
