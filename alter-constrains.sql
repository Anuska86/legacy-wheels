/*
	Alter the staff table
		alter the dealership_id column
		dropping the NOT NULL constraint
*/


ALTER TABLE staff
ALTER COLUMN dealership_id DROP NOT NULL; 

-- New salespeople
INSERT INTO staff (name, role)
 VALUES
 ('Tony Turner', 'Salesperson'),
 ('Axel Grimes', 'Salesperson'),
 ('Elle Bowgrease', 'Salesperson');