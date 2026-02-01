DML (don´t return data)

---INSERT INTO---

    Retro rides have acquired two new cars this week:
    	1. A Ford Escort RS2000 from 1978 in blue
    			the car is from 1978, a 4/5 condition
    			the car has not been sold and is listed at $39,000
    	2. A 1977 Aston Martin V8 Vantage in dark green
    			The car is in perfect condition
    			and is listed for sale at $145,000

INSERT INTO cars (
brand, model, year, price, color, condition, sold
) VALUES (
'Ford', 'Escort RS2000', 1978, 39000, 'blue', 4, FALSE
), (
'Aston Martin', 'V8 Vantage', 1977, 145000, 'dark green', 5, FALSE
);

---UPDATE---

    Set the sold column to true for the Ford Escort RS2000

UPDATE cars SET
sold = TRUE
WHERE brand = 'Ford'
AND model = 'Escort RS2000';

    Update the record for the Aston Martin DB4 with ID 14
    	set the condition to 5
    	and the price to 465000

UPDATE cars SET
condition = 5,
price = 465000
WHERE
id = 14;
