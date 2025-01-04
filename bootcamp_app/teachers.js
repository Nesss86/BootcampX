const { Pool } = require("pg");

// Database connection configuration
const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx",
});

const cohortName = process.argv[2] || "JUL02";

console.log("Starting query...");

const mainQuery = `
  SELECT DISTINCT teachers.name AS teacher, cohorts._name AS cohort
  FROM teachers
  JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts._name = $1
  ORDER BY teacher;
`;

pool
  .query(mainQuery, [cohortName])
  .then((res) => {
    if (res.rows.length === 0) {
      console.log(`No teachers found for the cohort: ${cohortName}`);
    } else {
      res.rows.forEach((row) => {
        console.log(`${row.cohort}: ${row.teacher}`);
      });
    }
  })
  .catch((err) => {
    console.error("Query error:", err);
  })
  .finally(() => {
    console.log("Closing database connection...");
    pool.end();
  });


















































