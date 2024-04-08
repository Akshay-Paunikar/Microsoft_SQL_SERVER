
-------------------------
-- SQL CREATE DATABASE --
-------------------------

/*The "CREATE DATABASE" statement is used to create a new database in SQL. It is also used in MySQL and other relational database management systems (RDBMS) 
to create databases.*/

CREATE DATABASE testDB;

CREATE DATABASE testDB2;

---------------------------
-- List Databases in SQL --
---------------------------

/*We use the SHOW DATABASES command and it will return a list of databases that exist in our system (FOR MYSQL). For SQL Server use following:*/

SELECT name
FROM sys.databases;

-------------------------
-- USE Database in SQL --
-------------------------

/*To use a specific database in SQL, we use the USE Statement.*/

USE testDB;

USE testDB2;

-----------------------
-- SQL Drop Database --
-----------------------

/*In SQL, sometimes there is a need to delete or drop the database on which you are working. Deleting a database means deleting everything which includes all 
the data such as tables, views, indexes, schemas, constraints, etc. In order to delete a database we use the DROP DATABASE command. We generally delete a 
database when the database is no longer required and we want to free the memory that the database is consuming.*/

CREATE DATABASE deleteDB;

CREATE DATABASE deleteDB2;

SELECT name
FROM sys.databases;

DROP DATABASE deleteDB;
DROP DATABASE deleteDB2;

SELECT name
FROM sys.databases;