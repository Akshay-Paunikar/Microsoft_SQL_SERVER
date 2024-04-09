
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

--------------------------
-- SELECT with HAVING ----
--------------------------

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