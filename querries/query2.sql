USE studystics;

/*  - MastersProgram(master_id, name, duration, thesis, internship, delivered, price)
	- Requirements(requirement_id, work_experience, english_degree,
standarized_test_score, recommendation_letters, lowest_bachelor_score)
Υποθέτουμε ότι ο client θέλει να δει τα μεταπτυχιακά προγράμματα που έχουν lowest_bachelor_score κάτω από 6.5.*/

SELECT name AS 'Program Name' , lowest_bachelor_score AS 'Required Bachelor Score'
FROM mastersprogram JOIN requirements ON mastersprogram.requirement_id = requirements.requirements_id
WHERE lowest_bachelor_score <= 6.5 ;