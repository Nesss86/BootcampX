SELECT COUNT(assistance_requests.id) AS total_assistances, teachers.name AS teacher_name
FROM assistance_requests
JOIN teachers 
ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;
