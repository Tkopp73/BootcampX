SELECT name, id, cohort_id
FROM students
WHERe end_date IS NULL
ORDER BY cohort_id;