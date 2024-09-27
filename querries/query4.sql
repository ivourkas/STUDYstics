USE studystics;

/*Ακολουθήσαμε άλλη διαδρομή από αυτή που εμφανίζεται στο pdf*/

/*  - MastersProgram(master_id, name, duration, thesis, internship, delivered, price)
	- JobOpportunity(job_id, name, junior_salary, scientific_field)
	- ApplicationTerms(application_id, deadline, price)
Υποθέτουμε ότι ο client θέλει να δει ποιο μεταπτυχιακό πρόγραμμα του προσφέρει την υψηλότερη αμοιβόμενη εργασιακή ευκαιρία με την χαμηλότερη τιμή αίτησης.*/

/* Table with highest Salary */
SET @A  := (SELECT MAX(jobopportunity.junior_salary)
			FROM jobopportunity);
            
/* Table of Jobs with highest Salary */
DROP TEMPORARY TABLE IF EXISTS B;
CREATE TEMPORARY TABLE B AS
    SELECT DISTINCT J1.job_id, J1.name, J1.junior_salary
    FROM jobopportunity J1
    JOIN jobopportunity J2 ON J1.junior_salary = J2.junior_salary
    WHERE J1.junior_salary = @A;

/* Table with masters that can bring job with highest Salary */
DROP TEMPORARY TABLE IF EXISTS C;
CREATE TEMPORARY TABLE C AS
	SELECT mastersprogram.master_id, mastersprogram.name, mastersprogram.application_id, B.name AS JOB, B.junior_salary
	FROM mastersprogram JOIN mastersprogram_brings_jobopportunity ON mastersprogram.master_id = mastersprogram_brings_jobopportunity.master_id 
	JOIN B ON mastersprogram_brings_jobopportunity.job_id = B.job_id; 


/* Table with price of the cheapest application of any master that brings the highest Salary */
SET @D := ( SELECT MIN( applicationterms.price)
			FROM applicationterms JOIN mastersprogram ON applicationterms.application_id = mastersprogram.application_id
			JOIN C ON mastersprogram.master_id = C.master_id);
    
    
SELECT C.name AS 'Program Name', applicationterms.price AS 'Application Price', C.job, C.junior_salary
FROM applicationterms JOIN C ON applicationterms.application_id = C.application_id
WHERE applicationterms.price IN (@D);
    