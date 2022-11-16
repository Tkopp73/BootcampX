const {Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.connect()
.then(() => {
  console.log('CONNECTED!');
})
.catch(err => console.error('Error:', err));

const cohortName = process.argv[2];
const values = [cohortName]
const queryString = `
SELECT DISTINCT teachers.name, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN cohorts ON cohorts.name LIKE $1
WHERE teachers.start_date < cohorts.start_date
ORDER BY teachers.name;
`
pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.name}`);
  })
})
.catch(err => console.log(err));