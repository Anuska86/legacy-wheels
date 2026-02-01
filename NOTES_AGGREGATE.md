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
