SELECT name, email, phone
FROM students
WHERE github is NOT NULL
AND end-date IS NOT NULL;