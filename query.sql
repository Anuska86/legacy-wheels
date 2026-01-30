/*Select everything*/

/*

SELECT * FROM cars;

*/


/*
	Select the brand, model, condition and year from the cars table

SELECT brand, model, condition, year FROM cars;

*/


/*
	Our costumer only wants black cars: 

SELECT brand, model, color, year FROM cars

WHERE color='black';

*/

/*
SELECT brand, model, condition, price FROM cars
WHERE condition='0'
*/

/* Customer wants cars with price <50000 

SELECT brand, model, condition, price FROM cars

WHERE price < 50000; */


/*
	Filter out cars from 1965
		Select the brand, model, year and price


SELECT brand, model, year, price FROM cars

WHERE year!=1965; 
WHERE year <> 1965;

*/

/*
	Select the brand, model, color and year
		find any car where the color includes 'green'

        SELECT brand, model, color, year FROM cars
	WHERE color LIKE '%green%';

    WHERE color NOT LIKE '%green%';
*/

/*
	Select the brand, model, color and year for cars
		where the model is 'DB' followed by any other single character


        SELECT brand, model, color, year FROM cars
	WHERE model LIKE 'DB_';
*/

