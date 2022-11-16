SELECT DISTINCT teachers.name, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN cohorts ON cohorts.name = 'JUL02'
WHERE teachers.start_date < cohorts.start_date
ORDER BY teachers.name;
