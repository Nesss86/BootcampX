SELECT DISTINCT teachers.name AS instructor_name, cohorts._name AS cohort_name
FROM assistance_requests
JOIN teachers 
ON teachers.id = assistance_requests.teacher_id
JOIN students 
ON students.id = assistance_requests.student_id
JOIN cohorts 
ON students.cohort_id = cohorts.id
WHERE cohorts._name = 'JUL02'
ORDER BY instructor_name ASC;
