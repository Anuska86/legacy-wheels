Query Clauses (LIMIT, OFFSET, ORDER BY, GROUP BY)

---ORDER BY---

Select the brand, model and year from the cars table
order by the brand

SELECT brand, model, year FROM cars
ORDER BY brand;

DESC --> to reverse the order

Select the brand, model, condition and price from cars
order the table by condition in descending order
and by price in ascending order

SELECT brand, model, condition, price FROM cars
WHERE sold IS FALSE
ORDER BY condition DESC, price;

---LIMIT---

Select the brand, model, color and price from cars
where the color is a shade of 'red' and sold is false
order by price
limit the results to 5

SELECT brand, model, color, price FROM cars
WHERE sold IS FALSE
AND color LIKE '%red%'
ORDER BY price
LIMIT 5;

---GROUP BY---

Select the brand, and a count of the brand from cars
alias the count as brand_count
group by the brand column

SELECT brand, count(brand) AS brand_count FROM cars
GROUP BY brand;

Select the condition, and a count of the condition from cars
group by the condition column

SELECT condition, count(condition) FROM cars
GROUP BY condition;

    Select:
    	* the brand
    	* a count of the brand
    	* and an average of the price for each brand
    	* round the average down to the nearest number
    	* alias the average as 'AVG' in your output
    From cars where
    	the car has not been sold
    Group the table by brand.

SELECT brand, count(brand), FLOOR(AVG(price)) AS AVG
FROM cars
WHERE sold IS FALSE
GROUP BY brand;

---HAVING---

    Select:
    	* year
    	* a count of cars from that year, aliased as car_count
    	* the maximum price
    	* the minimum price
    from the table cars
    	where the car has been sold
    group by year
    	only show years where more than one car has been sold from that year
    order the result by car_count

    SELECT year,
    count(year) AS car_count,
    MAX(price),
    MIN(price)

FROM cars
WHERE sold IS TRUE
GROUP BY year
HAVING count(year) > 1
ORDER BY car_count;
