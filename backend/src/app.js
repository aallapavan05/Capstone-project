const express = require("express");
const { pool } = require("./db");

const app = express();
app.use(express.json());

app.get("/health", (req, res) => res.json({ status: "OK" }));
app.get("/users", async (req, res) => {
  const result = await pool.query("SELECT * FROM users");
  res.json(result.rows);
});

app.listen(5000, () => console.log("Backend running"));
