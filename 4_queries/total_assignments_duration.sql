select assignments.day, count(assignments.*) as number_of_assignments, sum(assignments.duration) as duration
from assignments
GROUP BY assignments.day
ORDER BY assignments.day