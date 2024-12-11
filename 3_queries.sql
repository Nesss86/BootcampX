SELECT name, id, cohort_id
FROM students
WHERE email 
OR phone IS NULL;