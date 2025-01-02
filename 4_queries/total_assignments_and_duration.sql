SELECT day, COUNT(id) AS total_assignments, SUM(duration) AS total_duration
FROM assignments
GROUP BY day
ORDER BY day ASC;
