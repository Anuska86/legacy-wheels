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
