SELECT teachers.name AS instructor_name, cohorts._name AS cohort_name,
  COUNT(assistance_requests.id) AS total_assistances
FROM assistance_requests
JOIN teachers 
ON teachers.id = assistance_requests.teacher_id
JOIN students 
ON students.id = assistance_requests.student_id
JOIN cohorts 
ON students.cohort_id = cohorts.id
WHERE cohorts._name = 'JUL02'
GROUP BY teachers.name, cohorts._name
ORDER BY instructor_name ASC;
