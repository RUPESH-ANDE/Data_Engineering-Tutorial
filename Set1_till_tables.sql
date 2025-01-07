DROP TABLE IF EXISTS masterdata.information_data;

CREATE TABLE masterdata.information_data (
id INT NOT NULL,
name VARCHAR(100) NOT NULL,
amount INT NOT NULL,
incremental_amount INT NOT NULL,
PRIMARY KEY(id));

INSERT INTO masterdata.information_data VALUES(
1, 'Govinda', 30, 40);

ALTER TABLE masterdata.information_data ADD COLUMN double_amount INT NOT NULL;

ALTER TABLE masterdata.information_data ADD COLUMN double1 INT NOT NULL, ADD COLUMN double2 INT NOT NULL;

ALTER TABLE masterdata.information_data DROP COLUMN double_amount, DROP COLUMN double1, DROP COLUMN double2; 

ALTER TABLE masterdata.information_data MODIFY amount SMALLINT;

DESCRIBE TABLE masterdata.information_data;

DROP TABLE IF EXISTS masterdata.information_bigdata;

ALTER TABLE masterdata.information_data RENAME TO masterdata.information_bigdata;

ALTER TABLE masterdata.information_bigdata CHANGE COLUMN amount amount2 INT NOT NULL;

SELECT * FROM masterdata.information_bigdata;

SHOW TABLES IN masterdata;

SHOW TABLES FROM masterdata;

CREATE TABLE userinfo(id INT);

CREATE TABLE userstudent(id INT);

SHOW TABLES LIKE "user%";

DROP TABLE userinfo;

DROP TABLE userstudent;

SHOW TABLES FROM masterdata LIKE "user%";

USE masterdata;

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (    
    Id int PRIMARY KEY NOT NULL,     
    Name varchar(45) NOT NULL,     
    Product varchar(45) DEFAULT NULL,     
    Country varchar(25) DEFAULT NULL,     
    Year int NOT NULL    
);    

INSERT INTO customer ( Id, Name, Product, Country, Year)     
VALUES (1, 'Stephen', 'Computer', 'USA', 2015),     
(2, 'Joseph', 'Laptop', 'India', 2016),     
(3, 'John', 'TV', 'USA', 2016),    
(4, 'Donald', 'Laptop', 'England', 2015),    
(5, 'Joseph', 'Mobile', 'India', 2015),    
(6, 'Peter', 'Mouse', 'England', 2016);  

SELECT * FROM masterdata.customer;

TRUNCATE TABLE masterdata.customer;

SELECT * FROM masterdata.customer;

DESCRIBE masterdata.customer;

INSERT INTO customer ( Id, Name, Product, Country, Year)     
VALUES (1, 'Stephen', 'Computer', 'USA', 2015),     
(2, 'Joseph', 'Laptop', 'India', 2016),     
(3, 'John', 'TV', 'USA', 2016),    
(4, 'Donald', 'Laptop', 'England', 2015),    
(5, 'Joseph', 'Mobile', 'India', 2015),    
(6, 'Peter', 'Mouse', 'England', 2016);  

EXPLAIN SELECT * from masterdata.customer;

CREATE TABLE userdata (    
    Id int PRIMARY KEY NOT NULL,     
    Name varchar(45) NOT NULL,     
    Product varchar(45) DEFAULT NULL,     
    Country varchar(25) DEFAULT NULL,     
    Year int NOT NULL    
); 

DROP TABLE IF EXISTS masterdata.information_bigdata, userdata;

SHOW TABLES IN masterdata;

SELECT * FROM masterdata.customer;

DELETE FROM masterdata.customer WHERE id>5;

SELECT * FROM masterdata.customer ORDER BY Name ASC, Product DESC LIMIT 3;

DELETE FROM masterdata.customer ORDER BY NAME DESC, Product ASC LIMIT 3;

/* Difference btw DROP, TRUNCATE, DELETE
DROP - It will remove everything structure and data of an table
DELETE - it will remove specific records depends upon the conditions 
TRUNCATE - it will remove entire table data info but structure remains available for data addition */


USE masterdata;

DROP TEMPORARY TABLE IF EXISTS tempdata;

CREATE TEMPORARY TABLE tempdata(id INT);

INSERT INTO tempdata VALUES(1),
(2),
(3),(4),(5);
 
SELECT * FROM tempdata; 

DROP TEMPORARY TABLE tempdata;

USE masterdata;

SHOW TABLES;

CREATE TABLE customer_duplicate SELECT * FROM masterdata.customer;

SELECT * FROM masterdata.customer_duplicate;

CREATE TABLE customer_copy LIKE customer;

INSERT customer_copy SELECT * FROM masterdata.customer;

SELECT * FROM masterdata.customer_copy;

SHOW COLUMNS FROM masterdata.customer;

ALTER TABLE masterdata.customer CHANGE COLUMN id Sno INT auto_increment;

ALTER TABLE masterdata.customer RENAME COLUMN Sno TO id;

/* Difference btw CHANGE AND RENAME 
CHANGE - we can also modify the data type of that column 
RENAME - we can just modify the name of the column */

CREATE VIEW customer_updated AS SELECT * FROM masterdata.customer;

SELECT * FROM masterdata.customer_updated;

DROP VIEW masterdata.customer_updated;

LOCK TABLES masterdata.customer READ;

SELECT * FROM masterdata.customer;

INSERT INTO masterdata.customer VALUES(7, 'Nice', 'Amazon', 'India', 2024);

UNLOCK TABLES;

SELECT * FROM masterdata.customer;

UPDATE masterdata.customer SET Name='Kesava', Product='Bhakthi', Country='Vaikunta', Year=2100 WHERE id =2;

#CONSTRAINTS 

#NOT NULL 

CREATE TABLE NULLTABLE(
ID INT NOT NULL,
FIRSTNAME VARCHAR(255) NOT NULL,
LASTNAME VARCHAR(255) NOT NULL);

INSERT INTO NULLTABLE VALUES(1, NULL, 'ANDE'); #Will get an error as column FIRSTNAME cannot be null 

#UNIQUE 

CREATE TABLE BRANDINFO(
ID INT NOT NULL,
BRAND_NAME VARCHAR(255) UNIQUE,
AMOUNT INT NOT NULL);

INSERT INTO BRANDINFO VALUES(1, 'Raymond', 1000),
(2, 'Raymond', 2000);  #will get an error as duplicate entry 'Raymond' for key brandinfo 

#CHECK 

CREATE TABLE PERSONS(
ID INT NOT NULL, 
NAME VARCHAR(255) NOT NULL,
AGE INT CHECK(AGE>=18));

INSERT INTO PERSONS VALUES(1, 'Govinda', 45); #this record will get added easily without any issue bc age is >= 18

SELECT * FROM masterdata.PERSONS;

INSERT INTO PERSONS VALUES(2, 'Kesava', 15); #this record will give an error as age is violated

#DEFAULT 

CREATE TABLE PERSONSINFO(
ID INT NOT NULL, 
NAME VARCHAR(255) NOT NULL,
AGE INT CHECK (AGE>=18),
BELONGSTO VARCHAR(255) UNIQUE,
COMINGFROM VARCHAR(255) DEFAULT 'Hyderabad');

INSERT INTO PERSONSINFO VALUES(1, 'Madhava', 45, 'Vaikunta', 'Puri');

SELECT * FROM PERSONSINFO;

INSERT INTO PERSONSINFO(ID, NAME, AGE, BELONGSTO) VALUES(2, 'Achutha', 35, 'Brindavanam'); #As we haven't given the comingfrom it will be taken as hyderabad

SELECT * FROM PERSONSINFO;

#PRIMARY KEY 

CREATE TABLE PRIMARYINFO(
ID INT NOT NULL PRIMARY KEY,
NAME VARCHAR(255) NOT NULL, 
AGE INT CHECK (AGE>=20),
COMINGFROM VARCHAR(255) DEFAULT 'Hyderabad',
BELONGSTO VARCHAR(255) UNIQUE);

INSERT INTO PRIMARYINFO VALUES(1, 'Radha Krishna', 25, 'Vaikunta', 'Puri');

SELECT * FROM PRIMARYINFO;

INSERT INTO PRIMARYINFO VALUES(1, 'Damodaram', 35, 'Bhadrinath', 'Puri'); #It will not added bcz due to primary key duplciate

#AUTO_INCREMENT

CREATE TABLE INCREMENTAL(
ID INT NOT NULL AUTO_INCREMENT, 
NAME VARCHAR(255) NOT NULL,
PRIMARY KEY(ID));

INSERT INTO INCREMENTAL(NAME) VALUES('Govinda'), ('Madhava'), ('Kesava');

SELECT * FROM INCREMENTAL;

#ENUM 

CREATE TABLE ENUMCHECK(
ID INT NOT NULL AUTO_INCREMENT,
NAME VARCHAR(255) UNIQUE,
BELONGSTO ENUM('Vaikunta', 'Puri', 'Tirupati', 'Bhadrinath'),
PRIMARY KEY(ID));

INSERT INTO ENUMCHECK(NAME, BELONGSTO) VALUES('Govinda', 'Puri'), ('Achutha', 'Bhadrinath');

SELECT * FROM ENUMCHECK;

INSERT INTO ENUMCHECK VALUES(3, 'Krishna', 'Dwaraka'); #this will not execute bcz it is not listed in ENUM

#INDEX
#This constraint allows us to create and retrieve values from the table very quickly and easily

CREATE TABLE INDEXCHECK(
ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(255) NOT NULL, 
PLACEOFBRITH VARCHAR(255));

INSERT INTO INDEXCHECK(NAME, PLACEOFBRITH) VALUES('Govinda', 'Tirupathi'),
('Krishna', 'Dwaraka'),
('Jagantha', 'Puri');

CREATE INDEX index_no ON INDEXCHECK(NAME);

SELECT * FROM INDEXCHECK USE INDEX(index_no);

#FOREIGN KEY - Also called referencing key 

CREATE TABLE PERSONSDATA(
PERSON_ID INT PRIMARY KEY, 
NAME VARCHAR(255) NOT NULL,
AGE INT CHECK (AGE>=20),
LOCATION VARCHAR(255) NOT NULL);

CREATE TABLE WORKDETAILS(
WORK_ID INT PRIMARY KEY,
COMPANY_NAME VARCHAR(255) NOT NULL,
COMPANY_LOC VARCHAR(255) NOT NULL, 
PERSON_ID INT NOT NULL,
FOREIGN KEY(PERSON_ID) REFERENCES PERSONSDATA(PERSON_ID));

INSERT INTO PERSONSDATA VALUES(1, 'Krishna', 25, 'Dwaraka');

INSERT INTO WORKDETAILS VALUES(1, 'Bhakthi', 'Vaikunta', 1);

SELECT * FROM masterdata.PERSONSDATA;

SELECT * FROM masterdata.WORKDETAILS;


CREATE TABLE Person (  
  ID int AUTO_INCREMENT PRIMARY KEY,  
  Name varchar(45) DEFAULT NULL,  
  Email varchar(45) DEFAULT NULL UNIQUE,  
  City varchar(25) DEFAULT NULL  
);  

INSERT INTO Person(ID, Name, Email, City)   
VALUES (1,'Mike', 'mike@javatpoint.com', 'California'),   
(2, 'Alexandar', 'alexandar@javatpoint.com', 'New York'),   
(3, 'Adam', 'adam@javatpoint.com', 'Los Angeles'),  
(4, 'Peter', 'Peter@javatpoint.com', 'Alaska');  

REPLACE INTO Person (id, city)  
VALUES(4,'Amsterdam');  

SELECT * FROM Person;


#Topic - Indexing 

#Create index

CREATE TABLE IndexValidation(
id INT PRIMARY KEY AUTO_INCREMENT,
Amount INT NOT NULL,
Age INT NOT NULL,
Mobile_number BIGINT NOT NULL);

INSERT INTO IndexValidation(Amount, Age, Mobile_number) VALUES
(200, 12, 8899889988),
(300, 15, 8877887788),
(1200, 19, 7788778877),
(2200, 45, 8899889988),
(3200, 35, 8877887788),
(12200, 29, 7788778877),
(2020, 92, 8899889988),
(3030, 75, 8877887788),
(120330, 78, 7788778877);

CREATE INDEX Mobile_index ON IndexValidation(Mobile_number);

SELECT * FROM IndexValidation USE INDEX(Mobile_index);

DESCRIBE Indexvalidation;

SHOW INDEX FROM IndexValidation;

#DROP INDEX 

DROP INDEX Mobile_index ON IndexValidation;

#UNIQUE Index 

CREATE TABLE Employee_Detail(    
    ID int AUTO_INCREMENT PRIMARY KEY,     
    Name varchar(45),     
    Email varchar(45),    
    Phone varchar(15),     
    City varchar(25),  
    UNIQUE KEY unique_email (Email)  
);  

#here unique index is created for email field

SHOW INDEX FROM Employee_Detail;

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

CREATE TABLE GROUPBYCHECK(
ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(255) DEFAULT NULL,
COMINGFROM VARCHAR(255) DEFAULT NULL,
BELONGSTO VARCHAR(255) DEFAULT NULL,
SAVINGSTOTRIP INT NOT NULL);

INSERT INTO GROUPBYCHECK(NAME, COMINGFROM, BELONGSTO, SAVINGSTOTRIP) VALUES
('Govinda', 'Dwaraka', 'Puri', 1200),
('Madhava', 'Dwaraka', 'Bhadrinath', 1400),
('Balaji', 'Tirupathi', 'Tirumala', 1200),
('Damodara', 'Dwaraka', 'Brindavanam', 2000),
('Govinda', 'Puri', 'Dwaraka', 1200),
('Madhava', 'Dwaraka', 'Bhadrinath', 1400),
('Balaji', 'Tirupathi', 'Tirumala', 2000),
('Damodara', 'Rameswaram', 'Brindavanam', 6000);

SELECT * FROM GROUPBYCHECK;

SELECT COMINGFROM, SUM(SAVINGSTOTRIP)
FROM GROUPBYCHECK
GROUP BY COMINGFROM;

SELECT BELONGSTO, COUNT(*) AS NUM_RECORDS, MAX(SAVINGSTOTRIP) AS MAX_SAVINGS
FROM GROUPBYCHECK
GROUP BY BELONGSTO;

SELECT BELONGSTO, COUNT(*) AS NUM_RECORDS, MAX(SAVINGSTOTRIP) AS MAX_SAVINGS
FROM GROUPBYCHECK
GROUP BY BELONGSTO
HAVING MAX_SAVINGS >1500;

#CONTROL FLOW 

#IF 

CREATE TABLE If_validation 
SELECT * FROM GROUPBYCHECK;

SELECT * FROM If_validation;

CREATE TABLE modified_ifdata2 AS
SELECT NAME, COMINGFROM, BELONGSTO, SAVINGSTOTRIP, 
IF(SAVINGSTOTRIP<1500,'Trip Possible', 'Trip Not Possible') AS TRIPDECISION
FROM masterdata.GROUPBYCHECK;

SELECT * FROM modified_ifdata2;

CREATE TABLE modified_ifdata LIKE GROUPBYCHECK;

ALTER TABLE modified_ifdata ADD COLUMN TRIPDECISION VARCHAR(255);

INSERT INTO modified_ifdata (NAME, COMINGFROM, BELONGSTO, SAVINGSTOTRIP, TRIPDECISION)
SELECT NAME, COMINGFROM, BELONGSTO, SAVINGSTOTRIP, 
       IF(SAVINGSTOTRIP < 1500, 'Trip Possible', 'Trip Not Possible')
FROM GROUPBYCHECK;

SELECT * FROM masterdata.modified_ifdata;

#IFNULL 

CREATE TABLE masterdata.employee_data(
ID INT PRIMARY KEY auto_increment, 
NAME VARCHAR(255) NOT NULL,
PHONE_NO BIGINT DEFAULT NULL,
MOBILE_NO BIGINT DEFAULT NULL);

INSERT INTO masterdata.employee_data(NAME, PHONE_NO, MOBILE_NO)
VALUES('Narayana', 8667774664, NULL),
('Vasudeva', 7788776655, NULL),
('Krishna', NULL, 5566776677);

SELECT * FROM masterdata.employee_data;

CREATE TABLE masterdata.updated_employee_data AS 
SELECT ID, NAME, IFNULL(MOBILE_NO, PHONE_NO) AS CONTACT 
FROM masterdata.employee_data;

SELECT * FROM masterdata.updated_employee_data;

#NULLIF

CREATE TABLE masterdata.nulls_employee_data(
ID INT PRIMARY KEY auto_increment, 
NAME VARCHAR(255) NOT NULL,
COMPANYNAME VARCHAR(255) DEFAULT NULL);

INSERT INTO masterdata.nulls_employee_data( NAME, COMPANYNAME)
VALUES('Narayana', 'Bhakthi'),
('Govinda', 'Yoga'),
('Sri rama', 'Good will'),
('Vasudeva', 'Bhakthi');

SELECT * FROM masterdata.nulls_employee_data;

CREATE TABLE masterdata.nulls_formations AS
SELECT ID, NAME, COMPANYNAME, NULLIF(COMPANYNAME, 'Bhakthi') AS qualified_company
FROM masterdata.nulls_employee_data;

CREATE TABLE masterdata.qualified_company_decision
SELECT ID,NAME,COMPANYNAME, qualified_company, 
IF(qualified_company IS NULL,"Right path","Change the path") AS DECISIONMAKING
FROM masterdata.nulls_formations;

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

CREATE TABLE masterdata.case_employee_data(
ID INT PRIMARY KEY auto_increment, 
NAME VARCHAR(255) NOT NULL,
COMPANYNAME VARCHAR(255) DEFAULT NULL);

INSERT INTO masterdata.case_employee_data( NAME, COMPANYNAME)
VALUES('Narayana', 'Bhakthi'),
('Govinda', 'Yoga'),
('Sri rama', 'Good will'),
('Vasudeva', 'Bhakthi');

SELECT * FROM masterdata.case_employee_data;

CREATE TABLE masterdata.case_data_result2
SELECT ID, NAME, COMPANYNAME,
CASE 
	WHEN COMPANYNAME ='Bhakthi' THEN 'You are in Right Path'
	WHEN COMPANYNAME != 'Bhakthi' THEN 'You are in Wrong Path'
    ELSE 'Needs to check'
END AS DECISIONMAKING 
FROM masterdata.case_employee_data;
    
SELECT * FROM masterdata.case_data_result2;

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

SELECT TRUE, FALSE, true, false, True, FALse;

#JOINS
#INNER JOIN (SIMPLE JOIN)

CREATE TABLE masterdata.students(
stud_id INT PRIMARY KEY AUTO_INCREMENT,
stud_name VARCHAR(255) NOT NULL,
stud_age INT CHECK (stud_age>18), 
stud_phone INT UNIQUE,
course_key INT NOT NULL,
act_key INT NOT NULL);

INSERT INTO masterdata.students(stud_name, stud_age, stud_phone, course_key, act_key)
VALUES('Krishna', 20, 998899, 1, 1),
('Govinda', 25, 887766, 3, 3),
('Madhava', 23, 776677, 2, 1),
('Achutha', 45, 887755, 4, 2),
('Vishnu', 34, 665566, 4, 1),
('Sri hari', 45, 445533, 1, 3),
('Narayana', 65, 335544, 2, 1);

CREATE TABLE masterdata.coursedetails(
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(255) NOT NULL,
course_fee INT NOT NULL);

INSERT INTO masterdata.coursedetails(course_name, course_fee)
VALUES('Bhakti', 2000),
('Sankirthan', 4000),
('Abhishekam', 2500),
('Vedas', 5000);

CREATE TABLE masterdata.activites(
act_id INT PRIMARY KEY AUTO_INCREMENT, 
act_name VARCHAR(255) UNIQUE NOT NULL,
act_code INT UNIQUE NOT NULL);

INSERT INTO masterdata.activites(act_name, act_code)
VALUES('Being near your feet', 510),
('Seeing your face', 502),
('Keeping you in heart', 524);

SELECT stud_id, stud_name, stud_age, stud_phone, course_name, course_fee, act_name, act_code
FROM masterdata.students As s
INNER JOIN masterdata.coursedetails AS c
ON c.course_id = s.course_key
INNER JOIN masterdata.activites AS a
ON a.act_id = s.act_key;

SELECT stud_id, stud_name, stud_age, stud_phone, 
	course_name, course_fee, act_name, act_code
FROM masterdata.students As s
INNER JOIN masterdata.coursedetails AS c
ON c.course_id = s.course_key
INNER JOIN masterdata.activites AS a
ON a.act_id = s.act_key;

#WHERE CONDITION
SELECT stud_id, stud_name, stud_age, stud_phone, 
	course_name, course_fee, act_name, act_code
FROM masterdata.students As s
INNER JOIN masterdata.coursedetails AS c
ON c.course_id = s.course_key
INNER JOIN masterdata.activites AS a
ON a.act_id = s.act_key 
WHERE course_fee <3000;

#ORDER BY
SELECT stud_id, stud_name, stud_age, stud_phone, 
	course_name, course_fee, act_name, act_code
FROM masterdata.students As s
INNER JOIN masterdata.coursedetails AS c
ON c.course_id = s.course_key
INNER JOIN masterdata.activites AS a
ON a.act_id = s.act_key
ORDER BY stud_age ASC;

#GROUP BY 
SELECT stud_id, stud_name, stud_age, stud_phone, 
       course_name, course_fee, act_name, act_code,
       SUM(course_fee) AS all_together 
FROM masterdata.students As s
INNER JOIN masterdata.coursedetails AS c
ON c.course_id = s.course_key
INNER JOIN masterdata.activites AS a
ON a.act_id = s.act_key
GROUP BY stud_id, stud_name, stud_age, stud_phone, 
         course_name, course_fee, act_name, act_code;

#All columns display 
SELECT *
FROM masterdata.students As s
INNER JOIN masterdata.coursedetails AS c
ON c.course_id = s.course_key
INNER JOIN masterdata.activites AS a
ON a.act_id = s.act_key;

#LEFT JOIN - LEFT OUTER JOIN 

CREATE TABLE masterdata.studentsleft(
stud_id INT PRIMARY KEY AUTO_INCREMENT,
stud_name VARCHAR(255) NOT NULL,
stud_age INT CHECK (stud_age>18), 
stud_phone INT UNIQUE,
order_key INT NOT NULL);

INSERT INTO masterdata.studentsleft(stud_name, stud_age, stud_phone, order_key)
VALUES('Krishna2', 20, 998892, 0),
('Govinda', 25, 887766, 3),
('Madhava', 23, 776677, 2),
('Achutha', 45, 887755, 4),
('Vishnu', 34, 665566, 4),
('Sri hari', 45, 445533, 1),
('Narayana', 65, 335544, 2);

CREATE TABLE masterdata.orderdetails(
order_key INT PRIMARY KEY AUTO_INCREMENT,
order_name VARCHAR(255) NOT NULL,
order_fee INT NOT NULL);

INSERT INTO masterdata.orderdetails(order_name, order_fee)
VALUES('Books', 2000),
('Bags', 4000),
('Kits', 2500),
('Dress', 5000);

#LEFT JOIN ON TABLE 1
SELECT stud_id, stud_name, stud_age, 
	order_name, order_fee
FROM masterdata.studentsleft AS s
LEFT JOIN masterdata.orderdetails AS o
ON s.order_key = o.order_key;

SELECT stud_id, stud_name, stud_age, 
	order_name, order_fee
FROM masterdata.orderdetails AS o
LEFT JOIN masterdata.studentsleft AS s
ON s.order_key = o.order_key
ORDER BY stud_id ASC;

#RIGHT JOIN - RIGHT OUTER JOIN 

CREATE TABLE masterdata.studentsright(
stud_id INT PRIMARY KEY AUTO_INCREMENT,
stud_name VARCHAR(255) NOT NULL,
stud_age INT CHECK (stud_age>18), 
stud_phone INT UNIQUE,
order_key INT NOT NULL);

INSERT INTO masterdata.studentsright(stud_name, stud_age, stud_phone, order_key)
VALUES('Krishna', 20, 998899, 1),
('Govinda', 25, 887766, 3),
('Madhava', 23, 776677, 2),
('Achutha', 45, 887755, 4),
('Vishnu', 34, 665566, 4),
('Sri hari', 45, 445533, 1),
('Narayana', 65, 335544, 2);

CREATE TABLE masterdata.orderdetailsright(
order_key INT PRIMARY KEY AUTO_INCREMENT,
order_name VARCHAR(255) NOT NULL,
order_fee INT NOT NULL);

INSERT INTO masterdata.orderdetailsright(order_name, order_fee)
VALUES('Books', 2000),
('Bags', 4000),
('Kits', 2500),
('Dress', 5000);

SELECT stud_id, stud_name, stud_age, 
	order_name, order_fee
FROM masterdata.studentsright AS s
RIGHT JOIN masterdata.orderdetailsright AS o
ON s.order_key = o.order_key
ORDER BY stud_id ASC;

SELECT stud_id, stud_name, stud_age, 
	order_name, order_fee
FROM masterdata.orderdetailsright AS o
RIGHT JOIN masterdata.studentsright AS s
ON s.order_key = o.order_key;

#CROSS JOIN 

SELECT * FROM 
masterdata.students
CROSS JOIN masterdata.coursedetails;
















