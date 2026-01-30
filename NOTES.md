Select everything

SELECT \* FROM cars;

Select the brand, model, condition and year from the cars table

SELECT brand, model, condition, year FROM cars;

Our costumer only wants black cars:

SELECT brand, model, color, year FROM cars

WHERE color='black';

SELECT brand, model, condition, price FROM cars
WHERE condition='0'

Customer wants cars with price <50000

SELECT brand, model, condition, price FROM cars

WHERE price < 50000;

Filter out cars from 1965
SELECT brand, model, year, price FROM cars

WHERE year!=1965;
WHERE year <> 1965;

Select the brand, model, color and year
find any car where the color includes 'green'

    SELECT brand, model, color, year FROM cars
    WHERE color LIKE '%green%';

    WHERE color NOT LIKE '%green%';

Select the brand, model, color and year for cars
where the model is 'DB' followed by any other single character

    SELECT brand, model, color, year FROM cars
    WHERE model LIKE 'DB_';

Select the brand, model, color and year from cars
exclude any green car show models which are 'DB' followed by any other single character

    SELECT brand, model, color, year FROM cars
    WHERE color NOT LIKE '%green%'
    AND model LIKE 'DB_'
    AND year > 1964;

Select cars made between 1980 and 1989 show the brand, model, year and price

    SELECT brand, model, year, price FROM cars
    WHERE year BETWEEN 1980 AND 1989;

Select brand, model, condition, color and price from cars where the price is between $20,000 and $60,000
and the condition is between 1 and 3 and the color contains red

SELECT brand,model,condition, color, price FROM cars
WHERE price BETWEEN 20000 AND 60000
AND condition BETWEEN 1 AND 3
AND color LIKE '%red%';

Find the brand, model, condition and price of cars where the price is less than $250,000 or the brand is Porsche only show cars with condition > 3

SELECT brand, model, condition, price FROM cars
WHERE (price < 250000
OR brand = 'Porsche')
AND condition > 3;

Search for columns: brand, model, color, year, price, sold from the table cars
where the color is a shade of red
or the year is between 1960 and 1969
and sold is false

SELECT brand, model, color, year, price, sold FROM cars
WHERE (color LIKE '%red%'
OR year BETWEEN 1960 AND 1969)
AND sold IS FALSE;
