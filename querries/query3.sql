USE studystics;

/*  - University ( university_code, name, country, city, rank)
	- Statistics (university_code, year, total_participants, total _males, total_females, others)

Υποθέτουμε ότι ο διαχειριστής θέλει να δει από ποιο πανεπιστήμιο δεν έχουν περαστεί στην βάση το σύνολο των μαθητών για το έτος 2023.*/

SELECT name, university.university_code
FROM statistics RIGHT JOIN university ON university.university_code = statistics.university_code
WHERE total_participants IS NULL AND year = 2023;