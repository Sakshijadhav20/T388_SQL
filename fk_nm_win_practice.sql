-- Foreign Key = nulls are allowed no constrainst restrictions dupliactes are allowed 
-- if a record from parent table is deleted/updated then the same record will be deleted/updated from its child table 
-- this is ON UPDATE CASCADE AND ON DELETE CASCADE use this when table is having tight parent-child coupling
-- cannot add a new value in child table if the value is not present in parent table
-- set null = sets child fk to null when parent is deleted(on delete), 
-- set null= sets child fk values to null when parent pk changes (on update), use this when child entities can exist unassigned
-- restrict= blocks parent deletion/updation if child record exist, use when strict protection against data loss
-- if a column in parent table is not foreign key but is unique not null column can be used as foreign key in child table 
-- not necessary the foreign key has to be primary key in the parent table
create database FK_T388;
use fk_T388;
create table students (ID int Primary key auto_increment,name varchar(25));
insert into students values 
(1, "Kunal");
insert into students(name) values ("Sakshi"),("Jiya"),("Shruti"),("Suman");
select * from students;

create table info (id int, scores int, foreign key(id) references students(id)); 
insert into info values (1,300),(2,300),(3,400),(4,250),(5,500);
select * from info;

create database t388_fk_pk;
use t388_fk_pk;

CREATE TABLE Employee (
ID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Age INT,
Salary DECIMAL(10, 2)
);

CREATE TABLE Project (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(100) NOT NULL,
ID INT,
FOREIGN KEY (ID) REFERENCES Employee(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO Employee (ID, Name, Age, Salary) VALUES
(101, 'Alice Smith', 29, 75000.00),
(102, 'Bob Jones', 34, 82000.50),
(103, 'Charlie Brown', 41, 95000.00),
(104, 'Diana Prince', 26, 68000.00);

INSERT INTO Project (ProjectID, ProjectName, ID) VALUES
(1, 'Website Redesign', 101),
(2, 'Cloud Migration', 101),
(3, 'Mobile App Launch', 102),
(4, 'Data Analytics Pipeline', 103);

select * from employee;
select * from project;

update employee set id=500 where id=101;
update project set id=600 where id=102;

insert into employee values(666,"Kamlesh",34,50000);
insert into project values(5,"New Airport", 666);
delete from employee where id=666;


-- NORMALIZATION = systematic decomposing of data to reduce redundancy
-- purpose of normalization = eliminate repeated data, ensure data dependecies make logical sense
-- 1NF= tackles problem of atomicity(values in table should not be further divided/ a single cell cannot hold multiple values ), eliminates repeating data, ensures atomicity
-- 2NF= must be in 1NF +  no partial dependecy
-- 3NF = must be in 2NF + no transitive dependencies

-- WINDOW FUNCTION
select  *, row_number() over ( partition by department)from employee;