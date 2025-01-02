SELECT cohorts._name AS cohort_name, COUNT(students.id) AS student_count
FROM cohorts
JOIN students
ON cohorts.id = students.cohort_id
GROUP BY cohorts.id, cohorts._name
HAVING COUNT(students.id) >= 18
ORDER BY student_count ASC;