SELECT students.name AS student_name, AVG(assignment_submissions.duration) AS avg_completion_time, (SELECT AVG(duration) FROM assignments) AS avg_suggested_time
FROM students
JOIN assignment_submissions 
ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < (SELECT AVG(duration) FROM assignments)
ORDER BY avg_completion_time ASC;

