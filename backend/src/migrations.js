const { pool } = require("./db");
(async () => {
  await pool.query("CREATE TABLE IF NOT EXISTS users(id SERIAL PRIMARY KEY, name TEXT)");
  console.log("Migration completed");
  process.exit();
})();