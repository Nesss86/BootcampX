SELECT COUNT(assistance_requests.id) AS total_assistances, students.name AS student_name
FROM students
JOIN assistance_requests 
ON students.id = assistance_requests.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;
