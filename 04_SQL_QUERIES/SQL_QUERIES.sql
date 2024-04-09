
------------------
-- SELECT QUERY --
------------------

/* The SELECT Statement in SQL is used to retrieve or fetch data from a database. We can fetch either the entire table or according to some specified rules. */
/* The select clause is the first clause and is one of the last clauses of the select statement that the database server evaluates. The reason for this is that 
before we can determine what to include in the final result set, we need to know all of the possible columns that could be included in the final result set. */

USE LearnMSSQL;
SELECT name FROM sys.tables;

/* To fetch all columns from table */

SELECT * FROM OrderItems;

------------------------------
-- SELECT with WHERE clause --
------------------------------

SELECT prod_id, quantity, item_price
FROM OrderItems
WHERE quantity > 200;

--------------------------
-- SELECT with GROUP BY --
--------------------------

SELECT prod_id, SUM(quantity) AS Total
FROM OrderItems
GROUP BY prod_id;

------------------------
-- SELECT with HAVING --
------------------------

SELECT prod_id, item_price, SUM(quantity) AS Total
FROM OrderItems
GROUP BY prod_id, item_price
HAVING item_price > 10;

--------------------------
-- SELECT with ORDER BY --
--------------------------

SELECT prod_id, item_price, SUM(quantity) AS Total
FROM OrderItems
GROUP BY prod_id, item_price
ORDER BY Total DESC;

---------------------
-- SELECT with TOP --
---------------------

SELECT TOP 10 * 
FROM OrderItems
WHERE quantity > 50
ORDER BY item_price DESC;

SELECT TOP 50 PERCENT *
FROM OrderItems
WHERE quantity > 100;

/* To SELECT 3rd Highest */

SELECT TOP 1 item_price
FROM 
	(SELECT TOP 3 item_price
	FROM OrderItems
	ORDER BY item_price DESC) AS SALARY
ORDER BY item_price ASC;

---------
-- IN --
---------

SELECT * FROM customer;

SELECT * FROM customer
WHERE CustomerName IN ('Shubham', 'Aditya');

------------
-- UPDATE --
------------

UPDATE customer
SET LastName = 'Gaur'
WHERE CustomerId = 1;

SELECT * FROM customer;

UPDATE customer
SET LastName = 'Gupta', Country = 'India'
WHERE CustomerId = 2;

SELECT * FROM customer;

------------
-- DELETE --
------------

INSERT INTO customer
VALUES
(6, 'Akshay', 'Kumar', 'Canada', 45, '6666666666'),
(7, 'Priya', 'Kumar', 'Sri Lanka', 35, '7777777777'),
(8, 'Anushka', 'Singh', 'Canada', 25, '8888888888');

SELECT * FROM customer;

DELETE FROM customer
WHERE CustomerName = 'Priya';

SELECT * FROM customer;

DELETE FROM customer
WHERE Country = 'Canada';

SELECT * FROM customer;

---------------------------
-- Delete Duplicate Rows --
---------------------------

CREATE TABLE DETAILS (
SN INT IDENTITY(1,1) PRIMARY KEY,
EMPNAME VARCHAR(25) NOT NULL,
DEPT VARCHAR(20) NOT NULL,
CONTACTNO BIGINT NOT NULL,
CITY VARCHAR(15) NOT NULL
);

INSERT INTO DETAILS (EMPNAME, DEPT, CONTACTNO, CITY)
VALUES 
('VISHAL', 'SALES', 9193458625, 'GAZIABAD'),
('VIPIN', 'MANAGER', 7352158944, 'BAREILLY'),
('ROHIT', 'IT', 7830246946, 'KANPUR'),
('RAHUL', 'MARKETING', 9635688441, 'MEERUT'),
('SANJAY', 'SALES', 9149335694, 'MORADABAD'),
('VIPIN', 'MANAGER', 7352158944, 'BAREILLY'),
('VISHAL', 'SALES', 9193458625, 'GAZIABAD'),
('AMAN', 'IT', 78359941265, 'RAMPUR');

SELECT * FROM DETAILS;

SELECT EMPNAME,DEPT,CONTACTNO,CITY, 
COUNT(*) FROM DETAILS
GROUP BY EMPNAME,DEPT,CONTACTNO,CITY
HAVING COUNT(*)>1

DELETE FROM DETAILS
WHERE SN NOT IN (
    SELECT MIN(SN)
    FROM DETAILS
    GROUP BY EMPNAME, DEPT, CONTACTNO, CITY
);

Select * FROM DETAILS;