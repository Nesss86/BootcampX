SELECT AVG(started_at - created_at) AS average_wait_time
FROM assistance_requests
WHERE created_at IS NOT NULL
  AND started_at IS NOT NULL;
