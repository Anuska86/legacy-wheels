-- ANY --

/_
Select the brand, model and price from cars
where the price is greater than the sold price
of any car that was sold by Frankie Fender
and the car has not been sold
_/

SELECT brand, model, price FROM cars
WHERE price > ANY (
SELECT SC.sold_price FROM sold_cars SC
JOIN staff S ON SC.seller = S.id
WHERE S.name = 'Frankie Fender'
) AND sold IS FALSE;

/_
Select the brand, model and price where
_ the price is lower than any Ford
_ the brand is Volkswagen
_/

SELECT brand, model, price FROM cars
WHERE price < ANY (
SELECT price FROM cars
WHERE brand ='Ford'
) AND brand='Volkswagen';

/_
Select the name, and sold price
from the staff table, joined with sold_cars
on matches between staff(id) and sold_cars(seller)
Where the seller has sold a car for a price greater than
any sum of a salesperson's total sales
_/

SELECT S.name, SC.sold_price
FROM staff S
JOIN sold_cars SC ON S.id = SC.seller
WHERE SC.sold_price > ANY (
SELECT SUM(sold_price) FROM sold_cars
GROUP BY seller
);

/_
Select the brand, model and price from cars
Where the price of the car is greater
than the total sales of any dealership
_/

SELECT brand, model, price FROM cars
WHERE price > ANY (
SELECT SUM(sold_price) FROM sold_cars
JOIN staff ON staff.id = sold_cars.seller
GROUP BY staff.dealership_id
);

-- ALL --

/_
Select brand, model, condition and price from cars
where the price is less than all cars which are in average condition (3)
_/

SELECT brand, model, condition, price
FROM cars
WHERE price < ALL (
SELECT price FROM cars
WHERE condition = 3
);

/_
Select the brand, model and year from cars
Where the year is before all cars with a brand of 'Ford'
Order the results by year
_/

SELECT brand, model, year
FROM cars
WHERE year < ALL (
SELECT year FROM cars WHERE brand = 'Ford'

) ORDER BY year;

/_
Select the brand, model, city, and price from cars
joined with dealerships where cars(dealership_id) matches dealerships(id)
where the price is greater than the price of all sold cars
order the results by city
_/

SELECT brand, model, city, price FROM cars
JOIN dealerships ON dealership_id = dealerships.id
WHERE price > ALL (
SELECT sold_price FROM sold_cars
)
ORDER BY city;
