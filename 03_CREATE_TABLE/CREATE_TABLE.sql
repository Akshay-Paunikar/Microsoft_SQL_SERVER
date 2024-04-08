
------------------
-- CREATE TABLE --
------------------

/*A Table is a combination of rows and columns. For creating a table we have to define the structure of a table by adding names to columns and providing data 
type and size of data to be stored in columns. In the SQL database for creating a table, we use a command called CREATE TABLE. */

USE LearnMSSQL;

CREATE TABLE customer(
CustomerId INT PRIMARY KEY,
CustomerName VARCHAR(50),
LastName VARCHAR(50),
Country VARCHAR(50),
Age INT NOT NULL CHECK (Age BETWEEN 1 AND 125),
Phone VARCHAR(10) CHECK (LEN(Phone)=10)
);

SELECT * FROM customer;

----------------------------
-- INSERT DATA INTO TABLE --
----------------------------

/*To add data to the table, we use INSERT INTO, the syntax is as shown below:

Insert into Table_name(Column1, Column2, Column3)
Values (Value1, value2, value3);

//Below query adds data in table in sequence of column name(Value1 will be 

added in Column1 and so on)//

Insert into Table_name

Values (Value1, value2, value3);

//Adding multiple data in the table in one go//

Insert into Table_name

Values (Value01, value02, value03),

(Value11, value12, value13),

(Value21, value22, value23),

(ValueN1, valueN2, valueN3)
*/

INSERT INTO customer (CustomerId, CustomerName, LastName, Country, Age, Phone)
VALUES
(1, 'Shubham', 'Thakur', 'India', 23, '1111111111'),
(2, 'Aman ', 'Chopra', 'Australia', 21, '2222222222'),
(3, 'Naveen', 'Tulasi', 'Sri lanka', 24,'3333333333'),
(4, 'Aditya', 'Arpan', 'Austria', 21,'4444444444'),
(5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain', 22,'5555555555');

SELECT * FROM customer;

/*Now let's check the conditions that we have applied on columns */

INSERT INTO customer (CustomerId, CustomerName, LastName, Country, Age, Phone)
VALUES (6, 'Anushka', 'Thakur', 'India', 0, '1111111111');

INSERT INTO customer (CustomerId, CustomerName, LastName, Country, Age, Phone)
VALUES (7, 'Reet', 'Kaur', 'India', 21, '11111111111');

----------------------------------------
-- Create a Table Using Another Table --
----------------------------------------

/* The SELECT INTO statement copies data from one table into a new table. */

SELECT CustomerID, CustomerName
INTO student
FROM customer;

SELECT * FROM student;

/* We can use * instead of column name to copy whole table to another table.*/

SELECT *
INTO customer_copy
FROM customer;

SELECT * FROM customer_copy;

/* The following SQL statement uses the INTO clause to copy the table into a new table in another database: */

SELECT * INTO testDB.dbo.customer_copy
FROM LearnMSSQL.dbo.customer;

/* The following SQL statement copies data into a new table based on some condition */

SELECT * INTO customer_copy_2
FROM customer
WHERE Age > 22;

SELECT * FROM customer_copy_2;

/* The following SQL statement copies data from more than one table into a new table */
SELECT customer.CustomerId, customer_copy_2.Age
INTO customer_copy_3
FROM customer
LEFT JOIN customer_copy_2
ON customer.CustomerId = customer_copy_2.CustomerId;

SELECT * FROM customer_copy_3;

----------------
-- DROP TABLE --
----------------

/* The drop command in SQL is used to remove the whole table including data present inside it, indexes, triggers, constraints, and permission specifications for 
that particular table. It is basically a DDL(data definition language) which is irreversible in nature. It means that once the user drops a table, there is no way 
to undo the command. Therefore, the drop command must be used with extensive care. It can also delete a whole database or can simply delete a table, it depends on 
the wish of the user.*/

DROP TABLE customer_copy_2;
DROP TABLE customer_copy_3;
DROP TABLE student;

------------------
-- DELETE TABLE --
------------------

/*SQL DELETE is a basic SQL operation used to delete data in a database. SQL DELETE is an important part of database management. 
DELETE can be used to selectively remove records from a database table based on certain conditions. This SQL DELETE operation is 
important for database size management, data accuracy, and integrity.*/

SELECT * FROM customer_copy;

/*let's delete record where CustomerName = Aditya.*/

DELETE FROM customer_copy
WHERE CustomerName = 'Aditya';

SELECT * FROM customer_copy;

/* Multiple Records Deletion */

DELETE FROM customer_copy
WHERE Age < 23;

SELECT * FROM customer_copy;

/* DELETE ALL RECORDS */

DELETE FROM customer_copy;

/* NOTE: DELETE is a Data Manipulation Language (DML). Hence operations performed by DELETE can be rolled back or undone. */

------------------
-- RENAME TABLE --
------------------

/* SQL Server provides a standard stored procedure called SP_RENAME for renaming the user-created object in the current database. 
The user-created object can be a table or column. */

CREATE TABLE kids (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT,
email VARCHAR(50),
phone VARCHAR(10)
);

INSERT INTO kids (id, name, age, email, phone)
VALUES
(1, 'Amit', 20, 'amit@gmail.com', '9999999999'),
(2, 'Rahul', 22, 'rahul@yahoo.com', '8888888888'),
(3, 'Priya', 21, 'priya@hotmail.com', '7777777777'),
(4, 'Sonia', 23, 'sonia@gmail.com', '6666666666'),
(5, 'Kiran', 19, 'kiran@yahoo.com', '5555555555');

SELECT * FROM kids;

EXEC SP_RENAME 'kids', 'student';

SELECT * FROM student;

/* RENAME COLUMN NAME */

EXEC SP_RENAME 'student.phone', 'contact', 'COLUMN';

SELECT * FROM student;

--------------------
-- TRUNCATE TABLE --
--------------------

/* TRUNCATE statement is a Data Definition Language (DDL) operation that is used to mark the extent of a table for deallocation (empty for reuse). 
The result of this operation quickly removes all data from a table, typically bypassing several integrity-enforcing mechanisms. The major difference 
between TRUNCATE and DROP is that truncate is used to delete the data inside the table not the whole table.*/

TRUNCATE TABLE student;

SELECT * FROM student;

