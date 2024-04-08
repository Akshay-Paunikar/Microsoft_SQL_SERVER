
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