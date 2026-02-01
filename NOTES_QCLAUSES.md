Query Clauses (LIMIT, OFFSET, ORDER BY,)

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
