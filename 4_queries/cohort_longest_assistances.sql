SELECT cohorts._name AS cohort_name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_request_duration
FROM assistance_requests
JOIN students 
ON assistance_requests.student_id = students.id
JOIN cohorts 
ON students.cohort_id = cohorts.id
WHERE assistance_requests.completed_at IS NOT NULL
  AND assistance_requests.started_at IS NOT NULL
GROUP BY  cohorts._name
ORDER BY average_assistance_request_duration DESC
LIMIT 1;
