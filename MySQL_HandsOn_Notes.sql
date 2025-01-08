DROP TABLE IF EXISTS masterrates.information_data;

-- creating table in schema
CREATE TABLE IF NOT EXISTS masterrates.information_data(
Id INT NOT NULL,
Name VARCHAR(100),
amount INT NOT NULL,
incremental_amount INT NOT NULL, 
PRIMARY KEY(id)
);

-- inserting value in to table 
INSERT INTO masterrates.information_data (Id, Name, amount, incremental_amount)
VALUES  (1, 'Govinda', 200, 300),
		(2, 'Krishna', 400, 500);
        
-- verifying the data 
SELECT * FROM masterrates.information_data;

-- ALTER Functionalities - adding columns
ALTER TABLE masterrates.information_data 
ADD COLUMN decremental_amount INT NOT NULL, 
ADD COLUMN droping_name VARCHAR(100) NOT NULL;

-- verifying the data 
SELECT * FROM masterrates.information_data;

-- ALTER Functionalities - droping columns
ALTER TABLE masterrates.information_data
DROP COLUMN decremental_amount, 
DROP COLUMN droping_name;

-- verifying the data 
SELECT * FROM masterrates.information_data;

-- ALTER Functionalities - modifying columns datatypes
ALTER TABLE masterrates.information_data 
MODIFY amount BIGINT NOT NULL;

-- Get clear details of table 
DESCRIBE masterrates.information_data;

-- ALTER Functionalities - renaming the tables
ALTER TABLE masterrates.information_data 
RENAME TO masterrates.information_datacopy;

ALTER TABLE masterrates.information_datacopy 
RENAME TO masterrates.information_data;

-- ALTER Functionalities - renaming the column headers 
ALTER TABLE masterrates.information_data 
CHANGE COLUMN amount amount2 INT NOT NULL;

-- verifying the data 
SELECT * FROM masterrates.information_data;

/* Difference btw CHANGE AND RENAME 
CHANGE - we can also modify the data type of that column 
RENAME - we can just modify the name of the column */

ALTER TABLE masterrates.information_data 
CHANGE COLUMN id Sno INT AUTO_INCREMENT;

-- verifying the data 
SELECT * FROM masterrates.information_data;

ALTER TABLE masterrates.information_data  
RENAME COLUMN Sno TO id;

-- verifying the data 
SELECT * FROM masterrates.information_data;

-- checking the tables
SHOW TABLES IN masterrates;
-- alternative way
SHOW TABLES FROM masterrates;

-- creating tables for data formation
CREATE TABLE masterrates.userid(id INT);

CREATE TABLE masterrates.userinfo(id INT);

CREATE TABLE masterrates.datauser(id INT);

-- LIKE Operator 
USE masterrates;
SHOW TABLES LIKE '%user%';
-- or 
SHOW TABLES FROM masterrates LIKE '%user%';

-- droping tables 
DROP TABLE IF EXISTS masterrates.datauser;
DROP TABLE IF EXISTS masterrates.userinfo;
DROP TABLE IF EXISTS masterrates.userid;

-- Forming data
DROP TABLE IF EXISTS customer;

CREATE TABLE masterrates.customer(
	id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL, 
    product VARCHAR(100) DEFAULT NULL, 
    country VARCHAR(100) DEFAULT NULL,
    year INT NOT NULL
);

INSERT INTO masterrates.customer (id, name, product, country, year)
VALUES (1, 'Govinda', 'ShankaChakra', 'Vaikunta', 2001),
(2, 'Joseph', 'Laptop', 'India', 2016),     
(3, 'John', 'TV', 'USA', 2016),    
(4, 'Donald', 'Laptop', 'England', 2015),    
(5, 'Joseph', 'Mobile', 'India', 2015),    
(6, 'Peter', 'Mouse', 'England', 2016);  

-- verifying the data 
SELECT * FROM masterrates.customer;

-- Truncating the table - it will remove entire table data info but structure remains available for data addition
TRUNCATE TABLE masterrates.customer;

-- verifying the data - table data will be null
SELECT * FROM masterrates.customer;

-- describe the table for datatype info 
DESCRIBE TABLE masterrates.customer;

-- seeting the data again for few more validations 
INSERT INTO masterrates.customer (id, name, product, country, year)
VALUES (1, 'Govinda', 'ShankaChakra', 'Vaikunta', 2001),
(2, 'Joseph', 'Laptop', 'India', 2016),     
(3, 'John', 'TV', 'USA', 2016),    
(4, 'Donald', 'Laptop', 'England', 2015),    
(5, 'Joseph', 'Mobile', 'India', 2015),    
(6, 'Peter', 'Mouse', 'England', 2016);  

-- verifying the data 
SELECT * FROM masterrates.customer;

-- describe the table for datatype info 
DESCRIBE TABLE masterrates.customer;

-- describe and explain both are same, gives same o/p
EXPLAIN SELECT * FROM masterrates.customer;

-- checking tables 
SHOW TABLES FROM masterrates;

-- Seeting new data for validations 
CREATE TABLE masterrates.userdata (
	id INT PRIMARY KEY NOT NULL, 
    name VARCHAR(25) NOT NULL,
    product VARCHAR(25) DEFAULT NULL,
    country VARCHAR(25) DEFAULT NULL,
    year INT NOT NULL
);

CREATE TABLE masterrates.fun(Id INT);

-- verifying tables 
SHOW TABLES FROM masterrates;

-- droping multiple tables 
DROP TABLE IF EXISTS masterrates.fun, masterrates.userdata;

-- verifying tables 
SHOW TABLES FROM masterrates;

-- verifying the data from customer table 
SELECT * FROM masterrates.customer;

-- DELETE Function
DELETE FROM masterrates.customer WHERE id>5;

-- verifying the data from customer table - a row will be deleted as previous it has 6 and we kept condition as id>5
SELECT * FROM masterrates.customer;

/* Difference btw DROP, TRUNCATE, DELETE
DROP - It will remove everything structure and data of an table
DELETE - it will remove specific records depends upon the conditions 
TRUNCATE - it will remove entire table data info but structure remains available for data addition */

-- TEMPORARY table validations 

-- droping if there is any temp data tables are there..
DROP TEMPORARY TABLE IF EXISTS masterrates.tempdata;

-- creating temp table 
CREATE TEMPORARY TABLE tempdata(id iNT);

-- INSERTING values in to temp table
INSERT INTO tempdata VALUES(1),
(2),
(3),(4),(5);
 
-- validating the data
SELECT * FROM tempdata; 

-- checking the tables -- temp tables will not shown or will not listed
SHOW TABLES FROM masterrates;

-- droping the temp tables 
DROP TEMPORARY TABLE tempdata;

-- Creating new table(kind of duplicate with data as well) by using the existing table 
CREATE TABLE masterrates.duplicate_customer 
SELECT * FROM masterrates.customer;

-- verifying the duplicate table data is formed or not 
SELECT * FROM masterrates.duplicate_customer;

-- Creating the new table which is kind of duplicate but not with data init 
CREATE TABLE masterrates.duplicate_cust LIKE customer;

-- verifying the duplicate table data is formed or not - it should not have data
SELECT * FROM masterrates.duplicate_cust;

-- if we want same data to be insert then we can use like this below 
INSERT masterrates.duplicate_cust SELECT * FROM customer;

-- verifying the duplicate table data is formed or not - it should have data now 
SELECT * FROM masterrates.duplicate_cust;

-- to get the columns names - which gives the detail information of each column 
SHOW COLUMNS FROM masterrates.duplicate_cust;

-- VIEWS Functionalities 

-- creating view 
CREATE VIEW masterrates.view_customer 
AS
SELECT * FROM masterrates.customer;

-- verying view data 
SELECT * FROM masterrates.view_customer;

-- droping view 
DROP VIEW masterrates.view_customer;

-- verying view data - it should throw an error as view not exists 
SELECT * FROM masterrates.view_customer;

-- locking and unlocking tables 
LOCK TABLES masterrates.customer READ;

-- verifying the data from customer table 
SELECT * FROM masterrates.customer;

-- inserting data - this will not possible because table is locked
INSERT INTO masterrates.customer 
VALUES(6, 'Nice', 'Amazon', 'India', 2024);

-- unlocking the tables
UNLOCK TABLES;

-- verifying the data from customer table 
SELECT * FROM masterrates.customer;

-- now updating the table as tables are unlocked
UPDATE masterrates.customer 
SET Name='Kesava', Product='Bhakthi', Country='Vaikunta', Year=2100 WHERE id =2;

-- verifying the data from customer table 
SELECT * FROM masterrates.customer;


#CONSTRAINTS 
#NOT NULL 

-- creating null table
CREATE TABLE masterrates.null_table(
id INT NOT NULL, 
first_name VARCHAR(100) NOT NULL, 
last_name VARCHAR(100) NOT NULL
);

-- Inserting null data to verify the null functionality 
INSERT INTO masterrates.null_table VALUES (1, 'Rupesh', NULL); #IT Will throw an error 

# UNIQUE
-- creating table 
CREATE TABLE masterrates.unique_table(
id INT NOT NULL, 
first_name VARCHAR(100) NOT NULL, 
last_name VARCHAR(100) NOT NULL, 
phone_number VARCHAR(75) UNIQUE
);

-- INSERTING values of an persons data with same phone number will not be accepted 
INSERT INTO masterrates.unique_table(id, first_name, last_name, phone_number)
VALUES (1, 'Rupesh', 'Ande', '84660xxxxx'),
(2, 'Krishna', 'Govinda', '84660xxxxx'); #it will throw an error saying values are not unique 

#CHECK  and #DEFAULT

-- creating table 
CREATE TABLE masterrates.check_default_table(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
middle_name VARCHAR(25) DEFAULT NULL,
last_name VARCHAR(25) NOT NULL, 
phone_number VARCHAR(100) UNIQUE, 
age INT CHECK(age>=18)
);

-- Verifying check here 
-- Inserting values of an person, here check will verify the age of person while adding the table data
INSERT INTO masterrates.check_default_table VALUES(1, 'Krishna', 'vasudeva', 'Nanda', '84660xxxxx', 17); # return error saying condition failed

-- verifying default here 
-- Inserting values of an person, here default will verify the middle_name of person as if we are not given, it will consider as null
INSERT INTO masterrates.check_default_table VALUES(1, 'Krishna', null, 'Nanda', '84660xxxxx', 20); # return error saying condition failed

-- verying the data 
SELECT * FROM masterrates.check_default_table;

-- Other functionality of default 
-- creating table
CREATE TABLE masterrates.default_table(
ID INT NOT NULL, 
NAME VARCHAR(255) NOT NULL,
AGE INT CHECK (AGE>=18),
BELONGSTO VARCHAR(255) UNIQUE,
COMINGFROM VARCHAR(255) DEFAULT 'Hyderabad');

-- Inserting perfect values
INSERT INTO masterrates.default_table VALUES(1, 'Madhava', 45, 'Vaikunta', 'Puri');

-- verifying the data
SELECT * FROM masterrates.default_table;

-- Inserting values by missing belongs to so that it will take by default value as hyderabad.
INSERT INTO masterrates.default_table(ID, NAME, AGE, BELONGSTO) VALUES(2, 'Achutha', 35, 'Brindavanam'); #As we haven't given the comingfrom it will be taken as hyderabad

-- verifying the data
SELECT * FROM masterrates.default_table;

#PRIMARY KEY 

-- creating table 
CREATE TABLE masterrates.primary_table(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(255) NOT NULL, 
age INT CHECK (AGE>=20),
comingfrom VARCHAR(255) DEFAULT 'Hyderabad',
belongsto VARCHAR(255) UNIQUE);

-- Inserting values
INSERT INTO masterrates.primary_table VALUES(1, 'Radha Krishna', 25, 'Vaikunta', 'Puri');

-- verifying the data
SELECT * FROM masterrates.primary_table;

-- Inserting the value with same id for primary key column
#It will not added bcz due to primary key duplciate
INSERT INTO masterrates.primary_table VALUES(1, 'Damodaram', 35, 'Bhadrinath', 'Puri'); 

#AUTO_INCREMENT

-- Creating table 
CREATE TABLE masterrates.auto_increment_table(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL, 
PRIMARY KEY(id)
); 

-- Inserting values
INSERT INTO masterrates.auto_increment_table (name)
VALUES ('Govinda'),
('Krishna'),
('Vasudeva');

-- verifying the data
SELECT * FROM masterrates.auto_increment_table;

#ENUM 

-- Creating table 
CREATE TABLE masterrates.enum_table(
id INT NOT NULL AUTO_INCREMENT, 
name VARCHAR(50) NOT NULL,
belongs_to ENUM('Dwarka', 'Tirupati', 'Puri', 'Sri rangam'),
PRIMARY KEY(id)
);

-- inserting vlaues which are in list of enum -- it will passed 
INSERT INTO masterrates.enum_table (name, belongs_to)
VALUES('Govinda', 'Puri'),
('Rama', 'Sri rangam');

-- verifying the values 
SELECT * FROM masterrates.enum_table;

-- inserting values which are not in list of enum - it will failed 
INSERT INTO masterrates.enum_table(name, belongs_to)
VALUES('Srinivasa', 'Thiruvanthapuram');

-- verifying the values 
SELECT * FROM masterrates.enum_table;

#INDEX
#This constraint allows us to create and retrieve values from the table very quickly and easily

-- creating table
CREATE TABLE masterrates.index_table(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL, 
placeofbrith VARCHAR(255));

-- inserting values
INSERT INTO masterrates.index_table(name, placeofbrith) VALUES('Govinda', 'Tirupathi'),
('Krishna', 'Dwaraka'),
('Jagantha', 'Puri');

-- creating index
CREATE INDEX index_no ON masterrates.index_table(name);

-- fectching values 
SELECT * FROM masterrates.index_table USE INDEX(index_no);

#FOREIGN KEY - Also called referencing key 

-- creating table
CREATE TABLE masterrates.persons_data(
person_id INT PRIMARY KEY, 
name VARCHAR(255) NOT NULL,
age INT CHECK (age>=20),
location VARCHAR(255) NOT NULL);

-- creating refrence table
CREATE TABLE masterrates.workers_data(
work_id INT PRIMARY KEY,
company_name VARCHAR(255) NOT NULL,
company_loc VARCHAR(255) NOT NULL, 
person_id INT NOT NULL,
FOREIGN KEY(person_id) REFERENCES masterrates.persons_data(person_id));

-- inserting values into main table
INSERT INTO masterrates.persons_data VALUES(1, 'Krishna', 25, 'Dwaraka');

-- inserting values into refrence table
INSERT INTO masterrates.workers_data VALUES(1, 'Bhakthi', 'Vaikunta', 1);

-- fecthing values 
SELECT * FROM masterrates.persons_data;

-- fetching values 
SELECT * FROM masterrates.workers_data;

# REPLCAE 
-- Creating table
CREATE TABLE person_table (  
  ID int AUTO_INCREMENT PRIMARY KEY,  
  Name varchar(45) DEFAULT NULL,  
  Email varchar(45) DEFAULT NULL UNIQUE,  
  City varchar(25) DEFAULT NULL  
);  

-- inserting values
INSERT INTO person_table(ID, Name, Email, City)   
VALUES (1,'Mike', 'mike@javatpoint.com', 'California'),   
(2, 'Alexandar', 'alexandar@javatpoint.com', 'New York'),   
(3, 'Adam', 'adam@javatpoint.com', 'Los Angeles'),  
(4, 'Peter', 'Peter@javatpoint.com', 'Alaska');  

-- replacing the data using REPLACE
REPLACE INTO person_table (id, city)  
VALUES(4,'Amsterdam');  

-- Fetching vlaues 
SELECT * FROM person_table;

#Topic - Indexing 
-- Create index table
CREATE TABLE masterrates.index_validation(
id INT PRIMARY KEY AUTO_INCREMENT,
Amount INT NOT NULL,
Age INT NOT NULL,
Mobile_number BIGINT NOT NULL);

-- Inserting values 
INSERT INTO masterrates.index_validation(Amount, Age, Mobile_number) VALUES
(200, 12, 8899889988),
(300, 15, 8877887788),
(1200, 19, 7788778877),
(2200, 45, 8899889988),
(3200, 35, 8877887788),
(12200, 29, 7788778877),
(2020, 92, 8899889988),
(3030, 75, 8877887788),
(120330, 78, 7788778877);

-- creating index
CREATE INDEX Mobile_index ON masterrates.index_validation(Mobile_number);

-- fecthing the values using index
SELECT * FROM masterrates.index_validation USE INDEX(Mobile_index);

-- getting details
DESCRIBE masterrates.index_validation;

-- fectching list of indexes 
SHOW INDEX FROM masterrates.index_validation;

#DROP INDEX 
DROP INDEX Mobile_index ON masterrates.index_validation;

#UNIQUE Index 
-- creating index table
CREATE TABLE masterrates.employee_detail(    
    ID int AUTO_INCREMENT PRIMARY KEY,     
    Name varchar(45),     
    Email varchar(45),    
    Phone varchar(15),     
    City varchar(25),  
    UNIQUE KEY unique_email (Email)  
);  

#here unique index is created for email field
SHOW INDEX FROM masterrates.employee_detail;

/*
revive the knowledge of 
WHERE with 
AND
OR 
Combintion of AND OR

Functionlaity of 
DISTINCT 

Functionlaity of 
FORM 

Functionlaity of 
ORDER BY DESC/ASC

Functionlaity of 
GROUP BY

Functionlaity of 
GROUP BY

*/

#GROUP BY
-- creating table
CREATE TABLE masterrates.groupby_table(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) DEFAULT NULL,
coming_from VARCHAR(255) DEFAULT NULL,
belongs_to VARCHAR(255) DEFAULT NULL,
savings_to_trip INT NOT NULL);
 
-- Inseting values into table
INSERT INTO masterrates.groupby_table(name, coming_from, belongs_to, savings_to_trip) VALUES
('Govinda', 'Dwaraka', 'Puri', 1200),
('Madhava', 'Dwaraka', 'Bhadrinath', 1400),
('Balaji', 'Tirupathi', 'Tirumala', 1200),
('Damodara', 'Dwaraka', 'Brindavanam', 2000),
('Govinda', 'Puri', 'Dwaraka', 1200),
('Madhava', 'Dwaraka', 'Bhadrinath', 1400),
('Balaji', 'Tirupathi', 'Tirumala', 2000),
('Damodara', 'Rameswaram', 'Brindavanam', 6000);

-- verifying the table 
SELECT * FROM masterrates.groupby_table;

-- grouping queries 
SELECT coming_from, belongs_to, max(savings_to_trip) as highest_amount 
FROM masterrates.groupby_table
GROUP BY belongs_to, coming_from;

SELECT coming_from, sum(savings_to_trip) as budget 
FROM masterrates.groupby_table
GROUP BY coming_from;

#CONTROL_FLOW
-- Creating table 
CREATE TABLE masterrates.if_validation
SELECT * FROM masterrates.groupby_table;

-- fecthing the data 
SELECT * FROM masterrates.if_validation;

# IF CONDITION
-- if condition 
CREATE TABLE masterrates.if_datafetching
SELECT id, name, coming_from, belongs_to, savings_to_trip,
	IF(savings_to_trip > 1200, 'Trip is cancelled', 'We can plan for Trip') 
    AS trip_decision
FROM masterrates.if_validation;

-- validating the data 
SELECT * FROM masterrates.if_datafetching;

-- other way when table is empty 
CREATE TABLE masterrates.if_datafetching2 
LIKE masterrates.groupby_table;

-- Inserting values with IF Condition by altering the new column as trip decision 
ALTER TABLE masterrates.if_datafetching2 ADD COLUMN trip_decision VARCHAR(255) NOT NULL;

-- validating the table 
SELECT * FROM masterrates.if_datafetching2;

INSERT INTO masterrates.if_datafetching2 (id, name, coming_from, belongs_to, savings_to_trip, trip_decision)
	SELECT id, name, coming_from, belongs_to, savings_to_trip,
		IF(savings_to_trip > 1200, 'Trip is cancelled', 'We can plan for Trip') 
	FROM masterrates.groupby_table;
    
-- validating the table and data
SELECT * FROM masterrates.if_datafetching2;
    
#IFNULL 
-- Creating table
CREATE TABLE masterrates.ifnull_data(
id INT PRIMARY KEY auto_increment, 
name VARCHAR(255) NOT NULL,
phone_no BIGINT DEFAULT NULL,
mobile_no BIGINT DEFAULT NULL);

-- Inserting values
INSERT INTO masterrates.ifnull_data(name, phone_no, mobile_no)
VALUES('Narayana', 8667774664, NULL),
('Vasudeva', 7788776655, NULL),
('Krishna', NULL, 5566776677);

-- Validating values
SELECT * FROM masterrates.ifnull_data;

-- IFNULL condition
CREATE TABLE masterrates.ifnull_fetching
SELECT id, name, IFNULL(phone_no, mobile_no) AS number
FROM masterrates.ifnull_data;

-- validating values 
SELECT * FROM masterrates.ifnull_fetching;

#NULL_IF condition
-- creating table
CREATE TABLE masterrates.nullif_data(
id INT PRIMARY KEY auto_increment, 
name VARCHAR(255) NOT NULL,
company_name VARCHAR(255) DEFAULT NULL);

-- inserting values
INSERT INTO masterrates.nullif_data( name, company_name)
VALUES('Narayana', 'Bhakthi'),
('Govinda', 'Yoga'),
('Sri rama', 'Good will'),
('Vasudeva', 'Bhakthi');

-- fetching values
SELECT * FROM masterrates.nullif_data;

-- null if condition 
CREATE TABLE masterrates.nullif_fetching
	SELECT id, name, company_name, 
		NULLIF(company_name, 'Bhakthi') AS new_company
	FROM masterrates.nullif_data;
    
-- fetching values
SELECT * FROM masterrates.nullif_fetching;

-- using nulls for making decision 
CREATE TABLE masterrates.nullif_fetching2
	SELECT id, name, company_name, new_company, 
		IF(new_company IS NULL, "Let's drop", "Let's Plan") AS decision_making
	FROM masterrates.nullif_fetching;
    
-- fetching values
SELECT * FROM masterrates.nullif_fetching2;

-- other examples
SELECT IFNULL(5, NULL) AS Result; #--> RESULT = 5

SELECT IFNULL(NULL, 5) AS Result; #--> RESULT = 5

/*Difference between IFNULL & NULLIF 
IFNULL:
Syntax: IFNULL(Exp1, Exp2);
if exp1 is NULL and exp2 is NOT NULL then it will return NOT NULL value 
and vice versa 

NULLIF:
Syntax: NULLIF(Exp1, Exp2);
if exp1 - condition is equal to exp2 then it will return NULL as result */
    
#CASE STATEMENTS
-- creating table
CREATE TABLE masterrates.case_table(
id INT PRIMARY KEY auto_increment, 
name VARCHAR(255) NOT NULL,
company_name VARCHAR(255) DEFAULT NULL);

-- inserting values
INSERT INTO masterrates.case_table( name, company_name)
VALUES('Narayana', 'Bhakthi'),
('Govinda', 'Yoga'),
('Sri rama', 'Good will'),
('Vasudeva', 'Bhakthi');

-- validating data
SELECT * FROM masterrates.case_table;

-- case conditions
CREATE TABLE masterdata.case_table_result
SELECT id, name, company_name,
CASE 
	WHEN company_name ='Bhakthi' THEN 'You are in Right Path'
	WHEN company_name != 'Bhakthi' THEN 'You are in Wrong Path'
    ELSE 'Needs to check'
END AS decision_making 
FROM masterrates.case_table;

-- validating the data
SELECT * FROM masterdata.case_table_result;

/*
revive the knowledge of 
AND Condition

Functionlaity of 
OR Condition 

Functionlaity of 
AND OR Condition

Functionlaity of 
BOOLEAN Condition

Functionlaity of 
LIKE Condition

Functionlaity of 
IN Condition

Functionlaity of 
NOT Condition

Functionlaity of 
NOT EQUAL Condition (<>)

Functionlaity of 
IS NULL Condition

Functionlaity of 
IS NOT NULL Condition

Functionlaity of 
BETWEEN Condition

Functionlaity of 
ANY Condition

Functionlaity of 
EXISTS Condition

*/
    
#JOINS
-- Data formation
-- creating table1 for join 
CREATE TABLE masterrates.students_table(
stud_id INT PRIMARY KEY AUTO_INCREMENT,
stud_name VARCHAR(255) NOT NULL,
stud_age INT CHECK (stud_age>18), 
stud_phone INT UNIQUE,
course_key INT NOT NULL,
act_key INT NOT NULL);

-- inserting data in table1
INSERT INTO masterrates.students_table(stud_name, stud_age, stud_phone, course_key, act_key)
VALUES('Krishna', 20, 998899, 1, 1),
('Govinda', 25, 887766, 3, 3),
('Madhava', 23, 776677, 2, 1),
('Achutha', 45, 887755, 4, 2),
('Vishnu', 34, 665566, 4, 1),
('Sri hari', 45, 445533, 1, 3),
('Narayana', 65, 335544, 2, 1);

-- creating table2 for join
CREATE TABLE masterrates.coursedetails_table(
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(255) NOT NULL,
course_fee INT NOT NULL);

-- inserting data in table2
INSERT INTO masterrates.coursedetails_table(course_name, course_fee)
VALUES('Bhakti', 2000),
('Sankirthan', 4000),
('Abhishekam', 2500),
('Vedas', 5000);

-- creating table3 for join
CREATE TABLE masterrates.activites_table(
act_id INT PRIMARY KEY AUTO_INCREMENT, 
act_name VARCHAR(255) UNIQUE NOT NULL,
act_code INT UNIQUE NOT NULL);

-- inserting data in table3
INSERT INTO masterrates.activites_table(act_name, act_code)
VALUES('Being near your feet', 510),
('Seeing your face', 502),
('Keeping you in heart', 524);

-- validating table1, table2 and table3 data 
SELECT * FROM masterrates.students_table;
SELECT * FROM masterrates.coursedetails_table;
SELECT * FROM masterrates.activites_table;

#INNER JOIN (SIMPLE JOIN)
SELECT stud_name, stud_age, stud_phone, course_name, course_fee, act_name, act_code
FROM masterrates.students_table 
INNER JOIN masterrates.coursedetails_table 
ON course_key = course_id
INNER JOIN masterrates.activites_table
ON act_key = act_id;

-- using WHERE condition 
SELECT stud_name, stud_age, stud_phone, course_name, course_fee, act_name, act_code
FROM masterrates.students_table 
INNER JOIN masterrates.coursedetails_table 
ON course_key = course_id
INNER JOIN masterrates.activites_table
ON act_key = act_id
WHERE course_fee<2500;

-- using ORDER BY condition
SELECT stud_name, stud_age, stud_phone, course_name, course_fee, act_name, act_code
FROM masterrates.students_table 
INNER JOIN masterrates.coursedetails_table 
ON course_key = course_id
INNER JOIN masterrates.activites_table
ON act_key = act_id
ORDER BY stud_age;

-- using GROUP BY condition
SELECT sum(course_fee) as total_fee, act_name, act_code
FROM masterrates.students_table 
INNER JOIN masterrates.coursedetails_table 
ON course_key = course_id
INNER JOIN masterrates.activites_table
ON act_key = act_id
GROUP BY act_code;

-- Data formation
-- creating table1 for join 
CREATE TABLE masterrates.join_students_table(
stud_id INT PRIMARY KEY AUTO_INCREMENT,
stud_name VARCHAR(255) NOT NULL,
stud_age INT CHECK (stud_age>18), 
stud_phone INT UNIQUE,
order_key INT NOT NULL);

-- Inserting data for table1
INSERT INTO masterrates.join_students_table(stud_name, stud_age, stud_phone, order_key)
VALUES('Krishna2', 20, 998892, 1),
('Govinda', 25, 887766, 3),
('Madhava', 23, 776677, 2),
('Achutha', 45, 887755, 4),
('Vishnu', 34, 665566, 5),
('Sri hari', 45, 445533, 1),
('Narayana', 65, 335544, 2);

-- creating table2 for join
CREATE TABLE masterrates.join_order_table(
order_key INT PRIMARY KEY AUTO_INCREMENT,
order_name VARCHAR(255) NOT NULL,
order_fee INT NOT NULL);

-- inserting data for table2
INSERT INTO masterrates.join_order_table(order_name, order_fee)
VALUES('Books', 2000),
('Bags', 4000),
('Kits', 2500),
('Dress', 5000);

-- verifying the table data's
SELECT * FROM masterrates.join_students_table;
SELECT * FROM masterrates.join_order_table;

#LEFT JOIN - LEFT OUTER JOIN 
-- Left join - table1 on table2
SELECT stud_id, stud_name, stud_age, stud_phone, order_name, order_fee
FROM masterrates.join_students_table AS s
LEFT JOIN masterrates.join_order_table AS o
ON s.order_key = o.order_key;

-- Left join - table2 on table1
SELECT stud_id, stud_name, stud_age, stud_phone, order_name, order_fee
FROM masterrates.join_order_table AS o
LEFT JOIN masterrates.join_students_table AS s 
ON o.order_key = s.order_key;

#RIGHT JOIN - RIGHT OUTER JOIN 
-- Right join - table1 on table2
SELECT stud_id, stud_name, stud_age, stud_phone, order_name, order_fee
FROM masterrates.join_students_table AS s
RIGHT JOIN masterrates.join_order_table AS o
ON s.order_key = o.order_key;

-- Right join - table2 on table1
SELECT stud_id, stud_name, stud_age, stud_phone, order_name, order_fee
FROM masterrates.join_order_table AS o
RIGHT JOIN masterrates.join_students_table AS s 
ON o.order_key = s.order_key;

#CROSS-JOIN
SELECT * FROM masterrates.join_students_table
CROSS JOIN masterrates.join_order_table;






















