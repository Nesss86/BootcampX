SELECT name, email, id, cohort_id
FROM students 
WHERE email is NOT LIKE '%gmail.com' 
AND phone is NULL;