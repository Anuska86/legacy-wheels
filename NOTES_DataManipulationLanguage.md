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
