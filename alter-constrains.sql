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

 -- Insert new dealerships opening 2027
INSERT INTO dealerships ( city, state, established )
	VALUES
	( 'Houston', 'TX', '2027-07-04' ),
	( 'Phoenix', 'AZ', '2027-07-04' ),
	( 'Dallas', 'TX', '2027-07-04' ),
	( 'Austin', 'TX', '2027-07-04' ),
	( 'Boston', 'MA', '2027-07-04');