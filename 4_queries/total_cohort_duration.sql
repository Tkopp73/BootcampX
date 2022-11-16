SELECT avg(sum) AS average_total_duration
FROM (SELECT cohorts.name AS name, sum(completed_at-started_at) AS sum
FROM students
JOIN assistance_requests ON student_id = students.id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name) AS anything;