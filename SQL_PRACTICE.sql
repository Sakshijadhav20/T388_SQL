create database T388;
use T388;
show databases;

CREATE TABLE Employee (
  EmployeeId INT PRIMARY KEY,
  FullName VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary float NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL);

select * from employee;
delete from employee;

insert into Employee values 
(2005," Sakshi Jadhav", "IT", 50000, "Female", 24);

delete from employee;

INSERT INTO Employee values
(1001,"John Doe","IT",35000,"Male",25), 
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27), 
(1003, 'James Brown', 'Finance', 50000, 'Male', 28), 
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26), 
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25), 
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27), 
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28), 
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28), 
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);

select * from employee;
delete from employee where Gender="Male";
delete from employee where Age>=25;
INSERT INTO Employee values
(1001,"John Doe","IT",35000,"Male",25), 
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27), 
(1003, 'James Brown', 'Finance', 50000, 'Male', 28), 
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26), 
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25), 
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27), 
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28), 
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28), 
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);

Truncate Table employee;
Drop Table employee;

Alter table employee add Location varchar(10);
Alter table employee add Bonus float after salary;
Alter table employee add Title varchar(10) first;

DESC employee;

Alter table employee modify FullName  varchar(35);
Alter table employee change column Location Address varchar(35);

Update employee set address="Thane";
Update employee set address="Dombivli" where department="IT";
Update employee set Title="Mrs" where Gender="Female";
Update employee set Title="Mr" where Gender="male";
update employee set bonus= salary*0.5;

-- constraints are the conditions that we apply to columns/database kindof data validation like excel data validation
create table Kisaan_Info(kisaan_id int unique not null, Kisaan_name varchar (45), age int check (age>=18), Email_Id varchar(45) default "abc2026@gmail.com");
select * from Kisaan_Info;
desc Kisaan_Info;
insert into Kisaan_Info(kisaan_id,kisaan_name,age) values(101,"Ram", 25);
insert into Kisaan_Info(kisaan_id,kisaan_name,age) values(102,"Shyam", 17);
insert into Kisaan_Info(kisaan_id,kisaan_name,age) values(102,"Rohit", 30);
insert into Kisaan_Info values(103,"Medha", 35, default);

alter table Kisaan_Info modify age int check (age>=40);
delete from Kisaan_Info where kisaan_id=104;
insert into Kisaan_Info values(104,"Sagar", 35, default);

create table Kisaan_details(
Main_id int unique not null,
Kisaan_id int primary key, 
Kisaan_name varchar (45), 
age int check (age>=18), 
Email_Id varchar(45) default "abc2026@gmail.com");
show create table Kisaan_Info;

-- distinct- whenever we want to know uniques values of a column use distinct
select distinct department from employee;
select distinct gender from employee;
select *from employee where department="IT" or department="HR";
select * from employee where department in ("IT","Finance");

show tables;
-- order by to show data in a order--
select *from employee order by fullname;
select *from employee order by age desc;
select *from employee where gender="Male" order by fullname desc;

-- Group by is grouping coumn using aggrating function like avg,max,count,sum. Works like Pivot table--
-- W G H O --
select department, count(EmployeeId) from employee group by department;
select gender, count(EmployeeId) from employee group by gender;
select department, sum(Salary) from employee group by department;
select department, max(Salary) from employee group by department;
select department, avg(Salary), max(Salary) from employee group by department;
select department, avg(Salary) as AverageSalary, max(Salary) as TotalSalary from employee group by department;
select department, count(*) from employee group by department;

-- Having clause if we want to apply filter on group by we will use Having , Having will always run on aggregate function --
select department, count(*) from employee group by department having avg(age) >25;
select department, avg(salary), count(*) from employee group by department having sum(Salary)>=100000;
select department, avg(salary), count(*) from employee where gender="Male" group by department having sum(Salary)>=100000;

CREATE TABLE Projects (
ProjectId INT PRIMARY KEY AUTO_INCREMENT,
ProjectName VARCHAR(200) NOT NULL,
EmployeeId INT,
StartDate DATETIME,
EndDate DATETIME
);

INSERT INTO Projects VALUES
(1,'Develop Ecommerse Website from
scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(2,'WordPress Website for our company',
1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(3,'Manage our Company Servers', 1007,
NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(4,'Hosting account is not working', 1009,
NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(5,'MySQL database from my desktop
application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
(6,'Develop new WordPress plugin for my business
website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
(7,'Migrate web application and database to
new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
(8,'Android Application development', 1004,
NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(9,'Hosting account is not working', 1001,
NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(10,'MySQL database from my desktop
application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
(11,'Develop new WordPress plugin for my
business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));

select * from Projects;
select now();

select *,datediff(enddate,startdate) as Duration from Projects;
select * from Projects where datediff(enddate,startdate)= 45;
alter table projects add Duration int;
Update projects set Duration = (datediff(enddate,startdate));
insert into projects(Duration) values(datediff(enddate,startdate));

ALTER TABLE projects DROP COLUMN Duration;

select duration, Count(projectname) from projects group by duration;
select duration, Count(*) from projects group by duration having count(*)>=2;
select duration, Count(*) from projects group by duration having count(*)>=2 limit 3;
select duration, Count(*) from projects where duration>=20 group by duration having count(*)>=2 order by duration desc limit 1;


select * from employee;
select * from employee  order by EmployeeId desc limit 5;
select * from employee limit 2,3; -- limit 2,3 mhnje pahile 2 record sodun next 3 records --
select * from employee limit 3,5;

select distinct department from employee;
select * from employee where employeeid is not null; -- to show record where employeeid is null--
select * from projects where employeeid is not null;
update projects set employeeid = 1003 where projectid=6;

-- In, Between, and Like--
select * from employee where age between 25 and 28; -- in numerical ranges  --
select * from employee where employeeid between 1002 and 1006; -- when required values in range --
select * from employee where employeeid in (1002,1005,1006); -- when required specific values use in , not in range--
select * from employee where age in (25,27) and department='IT';
select * from employee where age between 25 and 27 and department='IT' and gender='male';
select * from employee where FullName like 'M%';-- like operator, Fullname starting with M--
select * from employee where FullName like '%Y';-- Fullname ending with y--
select * from employee where FullName like '%i%';-- full name having i anywhere in name--
select * from employee where FullName like '_a%';-- fullname having a as second character--
select * from employee where FullName like '%a_';-- fullname having a as second last character--

select * from ssimple;
alter table simple rename ssimple;
select * from ssimple where FULLNAME Like "A%";
select * from ssimple where FULLNAME Like "_U%";
select * from ssimple where FULLNAME Like "%A";
select * from ssimple where FULLNAME Like "%t%";
select * from ssimple where FULLNAME Like "A_%"; -- fullname starts with a and has atleast one character after A--
select * from ssimple where FULLNAME Like "A%t";-- fullname starts with a and ends with t--
select * from ssimple where FULLNAME Not Like "A%"; -- fullname that does not starts with A--


-- Built in function String(), math(), aggreagte(), Date() --
-- Aggreagte function= Avg(), Count(), Min(), Sum(),Max()--
select avg(salary) from employee;
select max(salary) from employee;
select min(salary) from employee;
select count(*) from employee;
select sum(salary) from employee;
select avg(salary),max(salary),min(salary),count(*),sum(salary) from employee;

-- Math Function = abs() absolute,returns absolute number /unsigned number, mod(),ceil(),floor() --
select abs(500-800);
select (500-800);
select abs(datediff(startdate,enddate)) as duration from projects;
-- modulus= mod() = takes modulus--
select mod(12,7);
-- ceiling= ceil() and floor= floor()--
select ceil(25.8);
select floor(38.6);
-- truncate() --
select truncate(123456.678945,4);-- takes only 4 numbers after decimal--
select truncate(123456.678945,0); -- no decimal to be taken --
select truncate(123456.678945,-1); -- removes the number before decimal and replace it with 0 --
-- exp()= exponential --
select exp(2); -- e^2--
-- power= power()/ pow() --
select power(3,2); -- 3^2--
-- square root= sqrt() --
select sqrt(169);
select *,sqrt(salary) from employee;

-- String Functions --
-- concat()- to join two strings --
select concat('Good', ' ','Morning');
select concat(fullname,' - ',department) as code from employee;
select concat(fullname,'@itvedant.com') as email from employee;
alter table employee add Email varchar(50);
update employee set email= concat(fullname,'@itvedant.com');
select * from employee;
-- lower() --
select lower(fullname)as lower from employee;
-- upper() --
select upper(fullname) as Caps from employee;
-- replace() = replace(text, texttoreplace, replacingtext), replaces text --
select replace ("Hello everyone, good morning",'morning','night');-- replaced morning with night--
select *, replace(fullname, 'Mohanty', 'Patil') from employee; 
-- reverse() --
select reverse(fullname) from employee;
-- length() --
select length(fullname) from employee; -- length of text including space--
-- substring(string,start,end) extract --
select substring("maharashtra", 1,3);-- in string 'maharashtra' extract the starting 1 character and next 3 characters --
-- trim()--
select length(" aniket"), ltrim(" Aniket ") as lefttrim, length(ltrim("Aniket ")) as lefttrimlen;
select length(" aniket"), rtrim(" Aniket ") as righttrim, length(rtrim("Aniket ")) as righttrimlen;
select length(" Aniket "), ltrim(" Aniket ") as lefttrim, length(ltrim(" Aniket ")) as lefttrimlen,
length(" Aniket "), rtrim(" Aniket ") as righttrim, length(rtrim(" Aniket ")) as righttrimlen;
select * from trimmer;
select ename, length(ename), ltrim(ename) as lefttrim, length(ltrim(ename)) as lefttrimlen, rtrim(ename) as righttrim, length(rtrim(ename)) as righttrimlen from trimmer;
select ename,length(ename), trim(ename) as bothsidetrim, length(trim(ename)) as bothsidetrimlen from trimmer;

-- single row subqueries **do not use order by in inner query** ** inner query when executed gives only one value**  --
select age from employee where employeeid=1002;
select age from employee where fullname='Mary Smith';
select * from employee where age= (select age from employee where fullname='Mary Smith'); -- query to find the age or info of other employee have age same as mary smith --
select fullname,age from employee where age=27;
select * from employee where salary=(select salary from employee where fullname="John Doe");-- salary same as john doe --
select * from employee where department=(select department from employee where fullname="John Doe");
select salary from employee order by salary desc;
select max(salary) from employee;
select max(salary) from employee where salary < (select max(salary) from employee); -- second highest salary --
select max(salary) from employee where salary < (select max(salary) from employee where salary < (select max(salary) from employee)); -- third highest salary--

-- Multiple row subquery ** inner query when executed gives two or more value**  --
-- multi row sub query (inner querry when executed gives more than two values) 
select age from employee where employeeId in (1002,1003); 
select * from employee where age in(select age from employee where employeeid in (1002,1003)); -- use to get info of all employee whoes employeeid is 1002,1003
-- Any subquerry >any= more than minimum/  <any= less athan maximum ** any uses 'or' logic**
select * from employee where salary>any(select Salary from employee where EmployeeId in ("1001","1002","1003")); -- any uses greater than minimum and less then maximum also it uses "or" logic
select * from employee where salary<any(select Salary from employee where EmployeeId in ("1001","1002","1003"));
select * from employee where salary>=any(select Salary from employee where EmployeeId in ("1001","1002","1003"));
-- all subquerry >all= more than maximum/ <all= less than minimum ** all uses 'and' logic**
select * from employee where salary>All(select Salary from employee where EmployeeId between 1001 and 1003); -- All uses greater than maximum and less than minimum also it usses "and" logic 
select * from employee where salary<All(select Salary from employee where EmployeeId between 1001 and 1003);

-- joins subquerry 
-- inner join  **only shows similar and intersecting records**
select name_t388.id, name_,salary from name_t388 join salary_t388 on name_t388.id=salary_t388.id;
select a.id, name_,salary from name_t388 as a join salary_t388 as b on a.id=b.id; -- alias on table name
-- left join ** all records from left table and intersecting/ similar records with right table** **always take common column from the table used in left/ right  join
select name_t388.id, name_,salary from name_t388 left join salary_t388 on name_t388.id=salary_t388.id;
select a.id, name_,salary from name_t388 as a left join salary_t388 as b on a.id = b.id; -- alias on table name
-- right join **always take common column from the table used in left/ right  join
select name_t388.id, name_,salary from salary_t388 right join name_t388 on name_t388.id=salary_t388.id;
select salary_t388.id,name_,salary from salary_t388 right join name_t388 on salary_t388.id=name_t388.id;


CREATE TABLE Handsets (
    SetCode VARCHAR(10) PRIMARY KEY,
    SetName VARCHAR(50),
    TouchScreen CHAR(1),
    PhoneCost INT
);
INSERT INTO Handsets (SetCode, SetName, TouchScreen, PhoneCost)
VALUES
('N1', 'Nokia 2G', 'N', 5000),
('N2', 'Nokia 3G', 'Y', 8000),
('B1', 'BlackBerry', 'N', 14000);
CREATE TABLE Customer (
    CustNo INT PRIMARY KEY,
    SetNo VARCHAR(10),
    CustAddress VARCHAR(50)
);
INSERT INTO Customer (CustNo, SetNo, CustAddress)
VALUES
(1, 'N2', 'Delhi'),
(2, 'B1', 'Mumbai'),
(3, 'N2', 'Mumbai'),
(4, 'N1', 'Kolkata'),
(5, 'B1', 'Delhi');
select * from handsets;
select * from customer;

select custno,setno,custaddress from customer inner join handsets on setno=setcode where setname like 'Nokia%' ;
select custno,setno,custaddress from customer left join handsets on setno=setcode where setname like 'Nokia%' ;


-- OUTER JOIN (outer join/full outer join no keywords in mysql but can use in other dbms like oracle, microsoft servers
select * from name_t388;
select * from salary_t388;

select name_t388.ID , name_, salary from name_t388 left join salary_t388 on name_t388.id=salary_t388.id;
select name_t388.ID ,salary_t388.id, name_, salary from name_t388 left join salary_t388 on name_t388.id=salary_t388.id union all 
select name_t388.ID ,salary_t388.id, name_, salary from name_t388 right join salary_t388 on name_t388.id=salary_t388.id; -- outer=union(unique value) do not gives duplicate and full outer=union all(do not give unique values) gives duplicate


 -- WINDOW FUNCTION 
 -- row_number()= gives row rank
 -- rank() = gives rank like if 2 record shares same rank like 1 1 then the next record will get rank as 3, 2 is skipped
 -- dense_rank()= does not skip goes in sequence if 2 record
 -- partition works like group by but gives result in single row wise
select * from employee;
select  *, row_number() over ( partition by department) as rankindepartment from employee;
select  *, row_number() over ( partition by salary) as rankinsalary from employee order by salary desc;

select fullname, salary, rank() over (order by salary desc) as rankindept from employee order by department ;
select *, avg(salary) over (partition by department) as departmentavgsalary,
sum(salary) over (partition by department) as departmentsumsalary  from employee order by department, salary desc ;

select employeeid,fullname,department, salary, 
avg(salary) over (partition by department) as departmentavgsalary,
sum(salary) over (partition by department) as departmentsumsalary  from employee where gender= "female" order by department, salary desc ;

select 
employeeid, 
fullname, 
department, 
age, 
salary, 
lag(salary,1,0) over(partition by department order by age asc) as previousemployeesalarybyage
from employee 
order by department, age;

select 
employeeid, 
fullname, 
department, 
age, 
salary, 
lag(salary,2,0) over(order by salary) as previousemployeesalarybyage
from employee 
order by salary;

select 
employeeid, 
fullname, 
department, 
age, 
salary, 
lag(salary,1,"-") over(order by salary) as previousemployeesalarybyage,
(Salary - "previousemployeesalarybyage") as diff
from employee 
order by salary;

select 
employeeid, 
fullname, 
department, 
age, 
salary, 
lead(salary,1,"-") over(order by salary) as nextemployeesalarybyage
from employee 
order by salary;

-- SELF JOIN
Create table empmgr(Emp_ID int, Emp_name varchar(20), Manager_ID int);
insert into empmgr values(1,"Amar",4),(5,"Akbar",4),(7,"Anthony", Null),(4,"Tom",7);
select * from empmgr;

select 
e.emp_id,
e.emp_name as Employee_Name,
m.emp_name as Manager_Name
from empmgr as e
left join 
empmgr as m
on 
m.emp_id=e.Manager_id;

-- CROSS JOIN/ cardinal join  == no "on" is required because each record is comapred with every other record 
create table chessteamA(Team_A_ID int, Player_Name varchar (20));
insert into chessteamA values (101,"kunal"),(102,"kiran"),(103,"suman"),(104,"shekhar");
create table chessteamB(Team_B_ID int, Player_Name varchar(20));
insert into chessteamB values (1,"amir"),(2,"Salman"),(3,"aditya");

select * from chessteamA;
select * from chessteamB;

select team_A_id, team_B_ID, A.player_name,B.Player_name
from chessteamA as A
cross join chessteamB as B;

-- VIEW -- view temporary data stored in sql database & can be used further in other queries
create view t388_view1 as 
select team_A_id, team_B_ID, A.player_name as Name_A, B.Player_name as Name_B
from chessteamA as A
cross join chessteamB as B;

select * from T388_view1;

-- CTE --- cannot be used further in other queries 
with T388_CTE as (select team_A_id, team_B_ID, A.player_name as Name_A, B.Player_name as Name_B
from chessteamA as A
cross join chessteamB as B)
select * from T388_CTE;
