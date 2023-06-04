const express = require("express");
const router = express.Router();
const mysql = require("mysql2");

// Create a MySQL connection pool
const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "root",
  database: "database_7",
  /* connectionLimit: 10, // Adjust as per your requirement */
});
router.post("/query", (req, res) => {
  const { username, password, sqlQuery, role } = req.body;
  console.log("In backend, I received the query: " + sqlQuery);
  const query = "SELECT * FROM book"; // Replace with your query

  // Execute the query
  pool.query(sqlQuery, (error, results, fields) => {
    if (error) {
      console.error("Error executing query:", sqlQuery);
      return res
        .status(500)
        .json({ message: "SQL error", error: error.message });
    }

    // Process the query results
    if (results && results.length > 0) {
      // If the query returned any results, send them to the frontend
      return res.status(200).json(results);
    } else {
      // If the query did not return any results, send an appropriate message to the frontend
      return res.status(200).json({ message: "No results found" });
    }
  });
});

module.exports = router;
