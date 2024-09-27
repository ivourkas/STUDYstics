/*Απλός χρήστης: Έχει την δυνατότητα να εισέρχεται στην βάση και να βλέπει τα δεδομένα
της, αλλά δεν μπορεί να τα τροποποιήσει.*/

DROP USER IF EXISTS'ExampleSimpleUser'@'%';
CREATE USER 'ExampleSimpleUser'@'%' IDENTIFIED BY 'simplepassword';
GRANT SELECT ON studystics.* TO 'ExampleSimpleUser'@'%';


/* Εκπρόσωπος πανεπιστημίου: Έχει ως ευθύνη τη διαχείριση των μεταπτυχιακών προγραμ-
μάτων που εκπροσωπεί το ίδρυμα στο οποίο ανήκει. */

DROP USER IF EXISTS'AuthAdmin'@'%';
CREATE USER 'AuthAdmin'@'%' IDENTIFIED BY 'securepassword';
GRANT SELECT ON studystics.* TO 'AuthAdmin';
GRANT INSERT, UPDATE ON studystics.statistics TO 'AuthAdmin';
GRANT UPDATE ON studystics.university TO 'AuthAdmin';
GRANT INSERT, UPDATE, DELETE ON studystics.mastersprogram TO 'AuthAdmin';

/*Υποσημείωση: Δεν βρίκαμε τρόπο να του δώσουμε δικαιώματα να πειράζει συγκεκριμένες σειρές μόνο, και όχι όλο τον πίνακα.
 Ως εκ τούτου του δίνουμε δικαιώματα για όλον τον πίνακα και θα φιλτράρουμε στο backend αν θα έχει πρόσβαση σε όλες τις σειρές. */


/*Διαχειριστής: Έχει ως ευθύνη την πλήρη διαχείριση της βάσης δεδομένων, αρκεί να τα ασκεί μόνο όμως μέσα από το μηχάνημα που βρίσκεται η βάση */

DROP USER IF EXISTS'LocalAdmin'@'localhost';
CREATE USER 'LocalAdmin'@'localhost' IDENTIFIED BY 'superpass';
GRANT ALL PRIVILEGES ON studystics.* TO 'LocalAdmin'@'localhost';
