Use studystics;

/*	- Statistics (university_code, year, total_participants, total _males, total_females, others)
Υποθέτουμε ότι ο διαχειριστής θέλει να δει από ποια πανεπιστήμια έχει εγγραφές στατιστικών όλα τα προηγούμενα 5 χρόνια. */

SELECT university_code
FROM statistics st1
GROUP BY st1.university_code
HAVING 5 = (
	SELECT COUNT(*)
    FROM statistics st2 
    WHERE year > 2018 AND st1.university_code = st2.university_code 
    );