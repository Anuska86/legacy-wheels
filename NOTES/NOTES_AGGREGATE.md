Aggregate Functions (COUNT, SUM, AVG, MIN, MAX):

---COUNT---

Count the number of cars
where sold is true

SELECT COUNT(\*) AS total_sold FROM cars
WHERE sold IS TRUE;

---SUM---

Sum the price of cars
where sold is true
Use the alias total_earnings in your output

SELECT SUM(price) AS total_earnings FROM cars
WHERE sold IS TRUE

---MAX---

Select the maximum retail price
where sold is true
Use most_expensive as an alias

SELECT MAX(price) AS most_expensive FROM cars
WHERE sold IS TRUE;

---AVERAGE (AVG)---

Use the AVG aggregate function to find the average price
where the brand is Bentley

We can use FLOOR and CEIL to round the average down or up
to the nearest whole number

SELECT FLOOR(AVG(price)) AS average FROM cars
WHERE brand LIKE ('%Bentley%')

---AVG, MIN, MAX---

Select the average, minimum and maximum price from cars
where sold is true
Round the average up to the nearest whole number
and use 'avg' as the alias for that result

SELECT
CEIL(AVG(price)) AS avg,
MIN(price),
MAX(price)
FROM cars
WHERE sold IS TRUE;

EXAMPLES:

/_
Select the city and average car price
Round that car price to a whole number
Only show dealerships which have cars
Group by dealership city and state
_/

SELECT city, state,
ROUND(AVG(price)) AS avg_price
FROM cars
LEFT JOIN dealerships ON dealership_id=dealerships.id
GROUP BY city,state;

/_
Select the name and role, alongside a total_sales:
this is the sum of sales by a member of staff
Use staff as your left table and sold_cars as your right table
Include a where clause to select only staff with the role 'Salesperson'
Group by staff name and role
Order by the total_sales from high to low
_/

SELECT name, role,
SUM(sold_price) AS total_price_sales
FROM staff
LEFT JOIN sold_cars ON staff.id=sold_cars.seller
WHERE role ='Salesperson'
GROUP BY name, role
ORDER BY total_price_sales DESC;

/_
Select the city, state and
count the total number of cars in each dealership
alias the count as car_count
Use cars as the left table, and dealerships as the right table
choosing a join which will show every dealership
Include a condition to count unsold cars
Group by dealership city and state
Order by the car_count
_/

SELECT city, state, COUNT(cars.id) AS car_count
FROM cars
RIGHT JOIN dealerships ON dealership_id=dealerships.id
WHERE sold IS NOT TRUE (para incluir los NULL values)
GROUP BY dealerships.city, dealerships.state
ORDER BY car_count;
