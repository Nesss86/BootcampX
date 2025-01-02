SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment,
  TO_CHAR(assistance_requests.completed_at - assistance_requests.started_at, 'HH24:MI:SS') AS duration
FROM assistance_requests
JOIN teachers 
ON teachers.id = assistance_requests.teacher_id
JOIN students 
ON students.id = assistance_requests.student_id
LEFT JOIN assignments 
ON assignments.id = assistance_requests.assignment_id
WHERE assistance_requests.completed_at IS NOT NULL
  AND assistance_requests.started_at IS NOT NULL
  AND assignments.name IS NOT NULL
ORDER BY duration ASC;

