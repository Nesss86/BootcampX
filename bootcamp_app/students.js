const { Pool } = require("pg");

// Set up database connection
const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx",
});

console.log("Starting query...");

// Capture command-line arguments
const cohortName = process.argv[2];
const limit = process.argv[3] || 5; // Default limit is 5 if not provided

if (!cohortName) {
  console.error("Please provide a cohort name as the first argument.");
  process.exit(1);
}

const queryString = `
  SELECT students.id AS student_id, students.name AS name, cohorts._name AS cohort
  FROM students
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts._name LIKE $1
  LIMIT $2;
`;

const values = [`%${cohortName}%`, limit];

pool
  .query(queryString, values)
  .then((res) => {
    console.log("Query executed successfully!");
    if (res.rows.length === 0) {
      console.log("No results found.");
    } else {
      res.rows.forEach((user) => {
        console.log(
          `${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`
        );
      });
    }
  })
  .catch((err) => {
    console.error("Query error:", err.stack);
  })
  .finally(() => {
    console.log("Closing database connection...");
    pool.end();
  });



















  