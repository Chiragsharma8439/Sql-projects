create database employee;

/*Basic querying*/
create table EmployeeDemographic
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
);


create Table EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int
);


Insert into EmployeeDemographic value
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);


SELECT * FROM EmployeeDemographic;
SELECT * FROM EmployeeSalary;

SELECT * FROM EmployeeSalary
WHERE Salary>60000;

SELECT DISTINCT(Gender) FROM EmployeeDemographic;

SELECT COUNT(EmployeeDemographic.LastName) FROM EmployeeDemographic;

SELECT Gender, COUNT(Gender) AS Number FROM EmployeeDemographic
WHERE Age>30
GROUP BY Gender
ORDER BY Number DESC;

SELECT EmployeeDemographic.Gender, MAX(EmployeeSalary.Salary) as MaximumSalary FROM EmployeeDemographic LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
Group BY EmployeeDemographic.Gender
order by MaximumSalary DESC;

SELECT EmployeeDemographic.Gender, avg(EmployeeSalary.Salary) as AverageSalary FROM EmployeeDemographic LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
Group BY EmployeeDemographic.Gender
order by AverageSalary DESC;


SELECT * FROM EmployeeDemographic as emp LEFT OUTER JOIN EmployeeSalary as sal
ON emp.EmployeeID = sal.EmployeeID
ORDER BY emp.EmployeeID ASC;

SELECT sal.JobTitle, AVG(sal.Salary) as AvgSalary FROM EmployeeDemographic as emp LEFT OUTER JOIN EmployeeSalary as sal
ON emp.EmployeeID = sal.EmployeeID
GROUP BY sal.JobTitle;

/without join /
SELECT EmployeeSalary.JobTitle, AVG(EmployeeSalary.Salary) as AvgSalary FROM EmployeeSalary
group by JobTitle;

/*Intermediate Query*/

Insert into employeedemographic value
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male');

Insert into EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000);


select * from employeedemographic;
select * from  employeesalary;


select * from employeedemographic inner join employeesalary
on employeedemographic.EmployeeID= employeesalary.EmployeeID;

select * from employeedemographic left join employeesalary
on employeedemographic.EmployeeID= employeesalary.EmployeeID;

select * from employeedemographic right join employeesalary
on employeedemographic.EmployeeID= employeesalary.EmployeeID;


select * from employeedemographic full join employeesalary
on employeedemographic.EmployeeID= employeesalary.EmployeeID;


Insert into EmployeeDemographic VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male');

Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
);

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female');


SELECT * FROM EmployeeDemographic;

SELECT * FROM EmployeeSalary;

SELECT * FROM WareHouseEmployeeDemographics;

Insert into EmployeeDemographic VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male');


SELECT * FROM EmployeeDemographic;

SELECT EmployeeDemographic.FirstName,EmployeeDemographic.LastName,EmployeeSalary.JobTitle,EmployeeSalary.Salary,
CASE
	WHEN Salary>60000 THEN 'High'
	WHEN Salary BETWEEN 50000 AND 60000 THEN 'Medium'
	WHEN Salary BETWEEN 40000 AND 50000 THEN 'Low'
	ELSE 'Very low'
END AS SalaryBand
FROM EmployeeDemographic INNER JOIN EmployeeSalary
ON EmployeeDemographic.EmployeeID=EmployeeSalary.EmployeeID
ORDER BY SalaryBand DESC;

SELECT JobTitle, AVG(Salary) as AVGSAL FROM EmployeeDemographic INNER JOIN EmployeeSalary
ON EmployeeDemographic.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle;

WITH salary_per_title(Title,Average_Salary)
AS 
(SELECT JobTitle, AVG(Salary) as AVGSAL FROM EmployeeDemographic INNER JOIN EmployeeSalary
ON EmployeeDemographic.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle)
SELECT * FROM salary_per_title
WHERE Title IN ('HR','Salesman');


/* Using Subqueries */

Select EmployeeID, JobTitle, Salary
From EmployeeSalary;


Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary











