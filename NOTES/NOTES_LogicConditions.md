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

-- EXITS --

/_
Select colors of car where there has been a sale of that color car
_/

SELECT DISTINCT color FROM cars
WHERE EXISTS (
SELECT 1 FROM sold_cars WHERE cars_id = cars.id
)
ORDER BY color;

/_
Select the city, state and date established of dealerships
Where there are no existing cars in stock
Format the date in 'YYYY-MM-DD' format using TO_CHAR()
and alias it as 'est'
_/

SELECT city, state, TO_CHAR(established,'YYYY-MM-DD') AS est
FROM dealerships D
WHERE NOT EXISTS (
SELECT 1 FROM cars WHERE dealership_id=D.id
);

/_
Select the city and state of dealerships
Where there exists a car priced at more than $50,000
Hint: you'll need to match cars(dealership_id) with dealerships(id)
and then check for car price in your subquery
_/

SELECT city, state
FROM dealerships D
WHERE EXISTS (
SELECT 1 FROM cars C
WHERE C.dealership_id = D.id AND C.price > 50000
);

/_
Select the name of salespeople
(role = 'Salesperson')
who have not sold a car for more than $45,000
_/

SELECT name FROM staff S
WHERE role = 'Salesperson'
AND NOT EXISTS (
SELECT 1 FROM sold_cars SC
WHERE SC.seller = s.id AND SC.sold_price > 45000
) AND EXISTS (
SELECT 1 FROM sold_cars SC where seller = s.id
);

-- CASE --

/_
Select the brand, model, condition from cars
Based on the car's condition level, output the following:
_ 'Excellent' when 4 or greater
_ 'Fair' when 3 or greater
_ 'Poor' when 1 or greater
_ 'Wrecked' for all other cases
Aliased as 'condition label'
From cars
Order by the condition in descending order
_/

SELECT brand, model, condition,
CASE
WHEN condition >= 4 THEN 'Excellent'
WHEN condition >= 3 THEN 'Fair'
WHEN condition >= 1 THEN 'Poor'
ELSE 'Wrecked'
END AS condition_label
FROM cars
ORDER BY condition DESC;

/_
Rodney is assigning bonuses for his staff on the following terms: - Salespeople who have made more than $100,000 in sales receive $10,000 - Salespeople who have made more than $75,000 in sales receive $5,000 - Every other staff member gets a bonus of $1,000
Select from the sold_cars table, joined with staff where
sold_cars(seller) = staff(id)
Show all staff, even if they have made no sales
Select:
_ staff(name)
_ staff(role)
_ staff(dealership\*id)

- the sum of the staff member's sales - alias as total*sales
  Use CASE to select the correct value, as defined above, aliased as bonus
  Use GROUP BY to format the output, and ORDER BY bonus then dealership_id
  */

SELECT S.name, S.role, S.dealership_id,
SUM(SC.sold_price) AS total_sales,
CASE
WHEN SUM(SC.sold_price) >= 100000 THEN 10000
WHEN SUM(SC.sold_price) >= 75000 THEN 5000
ELSE 1000
END AS bonus
FROM sold_cars SC
RIGHT JOIN staff S ON SC.seller = S.id
GROUP BY (S.name, S.role, S.dealership_id)
ORDER BY bonus, dealership_id;

-- CASE in WHERE --

/_
Select brand, model, condition, year and price from cars
Only select cars which have not been sold, and:
_ If the year is 1960 or earlier, the condition must be 4 or greater
_ If the year is 1970 or earlier, the condition must be 3 or greater
_ If the year is 1980 or earlier, the condition must be 2 or greater
_ If the year is 1990 or earlier, the condition must be 1 or greater
_ and any other cars (ELSE TRUE)
Order by year then condition
\*/

SELECT brand, model, condition, year, price
FROM cars
WHERE
sold IS FALSE
AND CASE
WHEN year <= 1960 THEN condition >= 4
WHEN year <= 1970 THEN condition >= 3
WHEN year <= 1980 THEN condition >= 2
WHEN year <= 1990 THEN condition >= 1
ELSE TRUE
END
ORDER BY year, condition;

/_
Select the brand, model, condition and price from cars
Only select cars if sold is false, and:
_ The condition is >= 4 then the price is below 100000
_ The condition is >= 3 then the price is below 50000
_ The condition is >= 1 then the price is below 20000
_ and any other cars (ELSE TRUE)
Order by condition
_/

SELECT brand, model, condition, price
FROM cars WHERE
sold IS FALSE
AND CASE
WHEN condition >= 4 THEN price < 100000
WHEN condition >= 3 THEN price < 50000
WHEN condition >= 1 THEN price < 20000
ELSE TRUE
END
ORDER BY condition;

-- CASE UPDATE --

/_
Update the price of Aston Martin brand cars:
_ If the car is a DB5, increase the price by 15%
_ If the model is 'DB' followed by another single character, increase by 10%
_ Increase others by 5%
Only update unsold cars
\*/

UPDATE cars
SET price = price \* CASE
WHEN model = 'DB5' THEN 1.15
WHEN model LIKE 'DB\_' THEN 1.1
ELSE 1.05
END
WHERE sold IS FALSE
AND brand = 'Aston Martin';

/_
Alter the price of cars:
_ For cars in Chicago, increase the price by 20%
_ For cars in Detroit, decrease the price by 20%
_ Any other car should keep the same price
Only update unsold cars
Hint: you can use dealership_id in your update without a JOIN
\*/

UPDATE cars
SET price = price \* CASE
WHEN dealership_id = 1 THEN 1.2
WHEN dealership_id = 3 THEN 0.8
ELSE 1.0
END
WHERE sold IS FALSE;
