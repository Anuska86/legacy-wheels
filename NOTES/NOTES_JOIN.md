They are four main types of JOIN in SQL:

1. INNER JOIN (return matching values)
2. LEFT JOIN (all the records from the left table and matching records from right table)
3. RIGHT JOIN (all the records from the right table and matching records from left table)
4. FULL JOIN (return recors where there's a match in either table)

SQL JOIN clauses have two sides:

- LEFT is the table we selected FROM
- RIGHT is the table we JOIN WITH

Joining multiple tables:

/_
List: - the brand and model of cars - include the name of the seller, - the city they work in - the date of the sale
Format the sold_date as DD-MM-YYYY using TO_CHAR()
Use sold_cars as the left table and join other tables
show sold_cars when we have no record of the seller
_/

SELECT
C.brand,
C.model,
S.name AS seller_name,
D.city,
TO_CHAR(SC.sold_date, 'DD-MM-YYYY') AS date_of_sale
FROM sold_cars SC
INNER JOIN cars C ON SC.cars_id = C.id
LEFT JOIN staff S ON SC.seller = S.id
LEFT JOIN dealerships D ON S.dealership_id = D.id;
LEFT JOIN dealerships D ON S.dealership_id = D.id;

    /*
    Select the name, role and city from sold_cars

    Join with the staff and dealerships tables
    	use appropriate joins to show staff who have no dealership_id

    Include a where clause to find
    	- null values in sold_cars
    	- staff who have the role 'Salesperson'

\*/

SELECT
S.name,
S.role,
D.city
FROM sold_cars SC
FULL JOIN staff S ON SC.seller=S.id
LEFT JOIN dealerships D ON S.dealership_id = D.id
WHERE SC.id IS NULL
AND S.role='Salesperson';

/_
Show the city and state of dealerships
with a count of the cars sold
aliased as cars_sold
Select from sold_cars
join with the relevant tables
Include dealerships which have no sold cars
Order the count in descending order
Hint: you may need to join using a table not included in our columns
_/

SELECT
D.city,
D.state,
COUNT(SC.id) AS cars_sold
FROM sold_cars SC
LEFT JOIN cars C ON SC.cars_id = C.id
RIGHT JOIN dealerships D ON C.dealership_id = D.id
GROUP BY D.city, D.state
ORDER BY cars_sold DESC;
