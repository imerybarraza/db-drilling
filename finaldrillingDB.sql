--Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.

--insert  customer
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (600, 1, 'Jorge', 'Milla', 'jmillar@gmail.com', 600, true, '2006-02-13', now(), 1);

--update customer
UPDATE customer SET first_name= 'Juan',last_name = 'Millar' WHERE customer_id = 600;

--delete customer
DELETE FROM customer WHERE customer_id = 600;


--insert staff
INSERT INTO staff
(first_name, last_name, address_id, email, store_id, active, username, "password", last_update, picture)
VALUES('Osvaldo', 'Peluso', 7, 'Ova@gmail.com', 2, true, 'Ozzy', '9999', now(), null);

--update staff
UPDATE staff
SET first_name='Javier', last_name='Peluso'
WHERE staff_id=3;

--delete staff
DELETE FROM staff
WHERE staff_id= 3;


--insert actor
INSERT INTO actor
(first_name, last_name, last_update)
VALUES('Brad', 'Pit', now());

--update actor
UPDATE actor
SET first_name='Brad', last_name='Pitt', last_update=now()
WHERE actor_id=201;

--delete actor
DELETE FROM actor
WHERE actor_id= 201;

--Listar todas las “rental” con los datos del “customer” dado un año y mes.
SELECT
customer.first_name,
customer.last_name,
customer.customer_id,
rental.rental_id,
rental.rental_date,
customer.store_id,
customer.email,
customer.address_id,
customer.create_date
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2005
AND EXTRACT(MONTH FROM rental.rental_date) = 5;

--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”

SELECT payment_id, payment_date, amount 
FROM payment
GROUP BY payment_id;

--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.

select *
from film
where release_year = 2006 
and rental_rate > 4.0;


-- crear diccionario 
SELECT
 t1.TABLE_NAME AS tabla_nombre,
 t1.COLUMN_NAME AS columna_nombre,
 t1.COLUMN_DEFAULT AS columna_defecto,
 t1.IS_NULLABLE AS columna_nulo,
 t1.DATA_TYPE AS columna_tipo_dato,
 COALESCE(t1.NUMERIC_PRECISION,
 t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
 PG_CATALOG.COL_DESCRIPTION(t2.OID,
 t1.DTD_IDENTIFIER::int) AS columna_descripcion,
 t1.DOMAIN_NAME AS columna_dominio
FROM
 INFORMATION_SCHEMA.COLUMNS t1
 INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
 t1.TABLE_SCHEMA = 'public'
ORDER BY
 t1.TABLE_NAME;
