USE studystics;

/*  - MastersProgram(master_id, name, duration, thesis, internship, delivered, price)
	- Lesson(lesson_id, name)
	- MasterProgram_Contains_Lesson(lesson_id, master_id, is_core)
Υποθέτουμε ότι ο client θέλει να δει ποια μεταπτυχιακά προγράμματα περιλαμβάνουν μόνο υποχρεωτικά μαθήματα */

SELECT DISTINCT mastersprogram.master_id, mastersprogram.name
FROM mastersprogram JOIN mastersprogram_contains_lesson ON mastersprogram.master_id = mastersprogram_contains_lesson.master_id
WHERE mastersprogram.name NOT IN (
	SELECT mastersprogram.name
	FROM mastersprogram JOIN mastersprogram_contains_lesson ON mastersprogram.master_id = mastersprogram_contains_lesson.master_id
	WHERE is_core = 0
);

