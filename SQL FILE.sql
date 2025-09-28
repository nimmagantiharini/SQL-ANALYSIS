create database animals;
select * from animals;

create table animals (pet_id int,name varchar(40),kind varchar(30), gender varchar (30),age int, owner_id int)

insert into animals values(1,'Bella','Dog','Female',1,1)
insert into animals values(2,'kiki','Dog','Male',2,2)
insert into animals values (3,'pinky','parrot', 'Male', 1,3)
insert into animals values (4,'Green','Cat', 'Male', 2,5)
insert into animals values (5,'Raj','Dog','Male',3,4)
insert into animals values(16, 'Luna',  'Rabbit','Female', 2, 2)
insert into animals values (9,'Hita', 'Cat','Female',2,7)
insert into animals values(21,'priye','Dog','Female', 3,6)
insert into animals values(14, 'Rocky', 'Dog','Male', 4, 12)
insert into animals values(13, 'Coco','Parrot','Female', 2, 23)
insert into animals values(7, 'Max', 'Cat','Male',  2, 6)
insert into animals values(11, 'Maxxy', 'Cat','Female',  2, 19)
insert into animals values(17, 'Oxo', 'Rabbit','Male',  2, 16)
insert into animals values(17, 'Goldie', 'Fish','Male',  2, 19)
insert into animals values(7, 'Luna', 'Fish','Female',  1, 6)
insert into animals values(10, 'Oreo', 'Cat','Male',  2, 15)

select * from animals

CREATE TABLE owners2 (
    owner_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    city VARCHAR(50)
);

INSERT INTO owners2 VALUES (1, 'John', 'Smith', '9876543210', 'New York')
INSERT INTO owners2 VALUES(2, 'Emily', 'Johnson', '9123456789', 'Chicago')
INSERT INTO owners2 VALUES(3, 'David', 'Brown', '9988776655', 'Los Angeles')
INSERT INTO owners2 VALUES(5, 'Sophia', 'Miller', '9345627810', 'Houston')
INSERT INTO owners2 VALUES(4, 'Michael', 'Davis', '9456723891', 'Phoenix')
INSERT INTO owners2 VALUES(7, 'Daniel', 'Moore', '9678234590', 'San Antonio')
INSERT INTO owners2 VALUES(6, 'Ava', 'Taylor', '9789012345', 'San Diego')
INSERT INTO owners2 VALUES(12, 'James', 'Anderson', '9890123456', 'Dallas')
INSERT INTO owners2 VALUES(23, 'Isabella', 'Thomas', '9012345678', 'San Jose')
INSERT INTO owners2 VALUES(19, 'Mia', 'White', '9234567890', 'Jacksonville')
INSERT INTO owners2 VALUES(16, 'Ethan', 'Harris', '9345678901', 'Fort Worth')
INSERT INTO owners2 VALUES(15, 'Amelia', 'Garcia', '9678901234', 'Indianapolis')
INSERT INTO owners2 VALUES(11, 'Olivia', 'Wilson', '9567812340', 'Philadelphia')
INSERT INTO owners2 VALUES(14, 'Alexander', 'Thompson', '9567890123', 'San Francisco')
INSERT INTO owners2 VALUES(13,'William', 'Jackson', '9123450987', 'Austin')

select * from owners2

select * from animals;
---------------------------------------------SELECT----------------------------------------------------------------------------
select pet_id,gender,age,owner_id from animals

select * from animals;

select distinct kind from animals

select * from animals;

select distinct pet_id,Kind from animals
-------------------------------------------------------------------WHERE---------------------------------------------------------
select * from animals where pet_id = 2

select * from animals where age = 2
update animals set age = 3 where owner_id = 1

select * from animals;
--------------------------------------------------------------ORDER BY-------------------------------------------------------------------
select * from animals order by age asc

select * from animals order by owner_id ,kind asc
----------------------------------------------------------------GROUP BY ----------------------------------------------------------
select age,count(owner_id) as owner_ID
from animals
group by age
-------------------------------------------------------------AGGREGATE FUNCTIONS-------------------------------------------------
select MIN(age) from animals

select MAX(age) from animals

SELECT COUNT(pet_id) from animals

select avg(owner_id) as OWNER_ID
from animals

select sum(pet_id) from animals where kind = 'Cat'

select count(pet_id) from animals where kind = 'Cat'

select * from animals
--------------------------------------------------------------joints----------------------------------------------------------
SELECT p.pet_id, p.name AS pet_name, p.kind, p.age, p.gender,
       o.first_name, o.last_name, o.city
FROM animals p
INNER JOIN owners2 o ON p.owner_id = o.owner_id;

SELECT p.pet_id, p.name AS pet_name, p.kind, p.age, p.gender,
       o.first_name, o.last_name, o.city
FROM animals p
LEFT JOIN owners2 o ON p.owner_id = o.owner_id;

SELECT p.pet_id, p.name AS pet_name, p.kind, p.age, p.gender,
       o.first_name, o.last_name, o.city
FROM animals p
RIGHT JOIN owners2 o ON p.owner_id = o.owner_id;

SELECT o.first_name, o.last_name, p.name AS pet_name, p.kind
FROM owners2 o
JOIN animals p ON o.owner_id = p.owner_id
WHERE p.kind = 'Dog';

SELECT p.pet_id, p.name AS pet_name, p.kind, p.age, p.gender,
       o.owner_id, o.first_name, o.last_name, o.city
FROM animals p
CROSS JOIN owners2 o;
---------------------------------------------------------------subquery------------------------------------------------------
SELECT first_name, last_name
FROM owners2
WHERE owner_id IN (
    SELECT owner_id
    FROM animals
    WHERE kind = 'Dog'
);

SELECT name, kind, age
FROM animals
WHERE owner_id IN (
    SELECT owner_id
    FROM owners2
    WHERE city = 'New York'
);

SELECT name, kind, age
FROM animals
WHERE age > (SELECT AVG(age) FROM animals);
--------------------------------------------------------views-------------------------------------------------------------------
CREATE VIEW pets_with_owners AS
SELECT p.pet_id, p.name AS pet_name, p.kind, p.age, p.gender,
       o.first_name,last_name AS owner_name,
       o.city
FROM animals p
INNER JOIN owners2 o ON p.owner_id = o.owner_id;

SELECT * FROM pets_with_owners;

select * from animals

select * from owners2

CREATE VIEW pet_count_per_owner AS
SELECT o.owner_id, o.first_name, o.last_name, COUNT(p.pet_id) AS total_pets
FROM owners2 o
LEFT JOIN animals p ON o.owner_id = p.owner_id
GROUP BY o.owner_id, o.first_name, o.last_name;

SELECT * FROM pet_count_per_owner
-----------------------------------------------------INDEX-----------------------------------------------------------------------
CREATE INDEX idx_pets_owner_id ON animals(owner_id);

CREATE INDEX idx_owners_city ON owners(city);

