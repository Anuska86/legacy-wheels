/*
	Select the brand, model, price, sold, sold_price columns
		from sold_cars
	Left join with cars
		matching sold_cars.cars_id to cars.id
*/

SELECT brand, model, price, sold, sold_price 
  FROM sold_cars SC
  LEFT JOIN cars C ON sold_cars.cars_id = cars.id;

  
SELECT brand, model, price, sold, sold_price 
  FROM sold_cars SC
  LEFT JOIN cars C ON SC.cars_id = C.id;  

  /*
	Select name, role, city, state
		From the staff table
	Left join with the dealerships table where the dealership_id in staff
			matches with the id in dealerships
*/


SELECT name, role, city, state
FROM staff S
LEFT JOIN dealerships D ON D.id=S.dealership_id; 

/*
	Select name, role from staff and city, state from dealerships
	Join the staff table to dealerships using full join
		match the staff.dealership_id to dealerships.id
*/

SELECT name, role, city, state FROM staff
FULL JOIN dealerships ON dealership_id = dealerships.id;



