SELECT AVG(total_duration) AS average_total_duration
FROM (SELECT cohorts._name AS cohort_name, SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
  FROM assistance_requests
  JOIN students 
  ON assistance_requests.student_id = students.id
  JOIN cohorts 
  ON students.cohort_id = cohorts.id
  WHERE assistance_requests.completed_at IS NOT NULL
    AND assistance_requests.started_at IS NOT NULL
  GROUP BY cohorts._name
) AS cohort_durations;
