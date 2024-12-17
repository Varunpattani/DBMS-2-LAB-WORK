--Lab - 2:





-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);

--Part – A
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.

--DEPARTMENT

--INSERT
create or alter procedure PR_DEPT_INS
@DepartmentID int,
@DepartmentName varchar(20)
as
begin
	insert into Department (DepartmentID,DepartmentName) values (@DepartmentID,@DepartmentName);
end

--UPDATE
create or alter procedure PR_DEPT_UP
@DepartmentID int,
@DepartmentName varchar(20)
as
begin
	update Department set DepartmentName = @DepartmentName where DepartmentID = @DepartmentID
end

--Delete
create or alter procedure PR_DEPT_DEL
@DepartmentID int
as
begin
	delete from Department where DepartmentID = @DepartmentID
end


--Designation

--Insert
create or alter procedure PR_DESI_INS
@DesignationID int,
@DesignationName varchar(20)
as
begin
	insert into Designation (DesignationID,DesignationName) values (@DesignationID,@DesignationName);
end

--Update
create or alter procedure PR_DESI_UP
@DesignationID int,
@DesignationName varchar(20)
as
begin
	update Designation set DesignationName = @DesignationName where DesignationID = @DesignationID
end

--Delete
create or alter procedure PR_DESI_DEL
@DesignationID int
as
begin
	delete from Designation where DesignationID = @DesignationID
end

--Person

--Insert
create or alter procedure PR_PER_INS
@FirstName varchar(100),
@LastName Varchar (100),
@Salary Decimal (8,2),
@JoiningDate Datetime,
@DepartmentID int,
@DesignationID int
as
begin
	insert into Person (FirstName,LastName,Salary,JoiningDate,DepartmentID,DesignationID) values (@FirstName,@LastName,@Salary,@JoiningDate,@DepartmentID,@DesignationID);
end

--Update
create or alter procedure PR_PER_UP
@PersonID int,
@FirstName varchar(100),
@LastName Varchar (100),
@Salary Decimal (8,2),
@JoiningDate Datetime,
@DepartmentID int,
@DesignationID int
as
begin
	update Person 
	set FirstName = @FirstName, LastName = @LastName, Salary = @Salary,JoiningDate = @JoiningDate, DepartmentID = @DepartmentID, DesignationID = @DesignationID
	where PersonID = @PersonID
end

--Delete

create or alter procedure PR_PER_DEL
@PersonID int
as
begin
	delete from Person where PersonID = @PersonID
end

exec PR_PER_INS 'Rahul', 'Anshu', 56000, '1990-01-01', 1, 12
exec PR_PER_INS	'Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11
exec PR_PER_INS 'Bhavin', 'Kamani', 25000, '1991-05-14', NULL, 11
exec PR_PER_INS 'Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13
exec PR_PER_INS 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15
exec PR_PER_INS 'Priya', 'Mehta', 25000, '1990-10-18', 2, NULL
exec PR_PER_INS 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15




exec PR_DEPT_INS 1, 'Admin'
exec PR_DEPT_INS 2, 'IT'
exec PR_DEPT_INS 3, 'HR'
exec PR_DEPT_INS 4, 'Account'



exec PR_DESI_INS 11, 'Jobber'
exec PR_DESI_INS 12, 'Welder'
exec PR_DESI_INS 13, 'Clerk'
exec PR_DESI_INS 14, 'Manager'
exec PR_DESI_INS 15,'CEO'


SELECT * FROM Department
SELECT * FROM Designation
SELECT * FROM Person
--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY
create or alter proc PR_PER_PK
@id int
as
begin
	select * from Person where PersonID = @id
end

create or alter proc PR_DEPT_PK
@id int
as
begin
	select * from Department where DepartmentID = @id
end

create or alter proc PR_DESI_PK
@id int
as
begin
	select * from Designation where DesignationID = @id
end


--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list)
CREATE OR ALTER PROC PR_JOIN_FK
AS 
BEGIN
	SELECT * FROM Person JOIN Department ON Person.DepartmentID = Department.DepartmentID JOIN Designation ON Person.DesignationID = Designation.DesignationID
END


--4. Create a Procedure that shows details of the first 3 persons.
CREATE OR ALTER PROC PR_FIRST_3_PER
AS 
BEGIN
	SELECT TOP 3* FROM Person JOIN Department ON Person.DepartmentID = Department.DepartmentID JOIN Designation ON Person.DesignationID = Designation.DesignationID
END

--Part – B

--5. Create a Procedure that takes the department name as input and returns a table with all workers working in that department.
create or alter proc PR_DEPT_WORKERS
@dpt_name varchar(25)
as
begin
	select * from Person join Department on Person.DepartmentID = Department.DepartmentID where Department.DepartmentName = @dpt_name
end


--6. Create Procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name.
create or alter proc PR_DEPT_DESI
@dept_name varchar(20),
@desi_name varchar(20)
as 
begin
	select Person.FirstName,Person.Salary,Person.JoiningDate,Department.DepartmentName
	from Person JOIN Department ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation ON Person.DesignationID = Designation.DesignationID
	where Department.DepartmentName = @dept_name and Designation.DesignationName = @desi_name
end



--7. Create a Procedure that takes the first name as an input parameter and display all the details of the worker with their department & designation name.
create or alter proc PR_FIRSTNAME_INPUT
@fnam varchar(25)
as
begin
	select Person.PersonID, Person.FirstName, Person.LastName, Person.JoiningDate, Person.Salary,
	Department.DepartmentName,Designation.DesignationName
	from Person JOIN Department ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation ON Person.DesignationID = Designation.DesignationID
	where Person.FirstName = @fnam
end


--8. Create Procedure which displays department wise maximum, minimum & total salaries.
create or alter proc PR_DEPT_WISE_SAL
as
begin
	select Department.DepartmentName,MAX(Person.Salary) as Max_SAL,min(Person.Salary) AS Min_SAL,sum(Person.Salary) as Total_SAL 
	from Person join Department on Person.DepartmentID = Department.DepartmentID
	group by Department.DepartmentName
end

exec PR_DEPT_WISE_SAL
--9. Create Procedure which displays designation wise average & total salaries.
create or alter proc PR_DESI_WISE_SAL
as
begin
	select Designation.DesignationName,avg(Person.Salary) AS AVG_SAL,sum(Person.Salary) AS TOTAL_SAL
	from Person join Designation on Person.DesignationID = Designation.DesignationID
	group by Designation.DesignationName
end


--Part – C
--10. Create Procedure that Accepts Department Name and Returns Person Count.
create or alter proc PR_PERSON_COUNT
@dept_name varchar(25)
as
begin
	select count(*) as Person_count from Person join Department on Person.DepartmentID = Department.DepartmentID
	where Department.DepartmentName = @dept_name
end

--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than input salary value along with their department and designation details.
create or alter proc PR_SAL_INPUT
@sal int
as
begin
	select Person.PersonID, Person.FirstName, Person.LastName, Person.JoiningDate, Person.Salary,
	Department.DepartmentName,Designation.DesignationName from Person JOIN Department ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation ON Person.DesignationID = Designation.DesignationID where Person.Salary = @sal
end
	

--12. Create a procedure to find the department(s) with the highest total salary among all departments.
create or alter proc PR_MAX_TOTAL_SAL
as
begin
	select top 1 DepartmentName, sum(Salary) as 'Total Salary' from
	Person p join Department d
	on p.DepartmentID = d.DepartmentID
	group by DepartmentName
	order by 'Total Salary' desc
end
--13. Create a procedure that takes a designation name as input and returns a list of all workers under that designation who joined within the last 10 years, along with their department.
create or alter PROC PR_DESI_10YEARS
@desi_name varchar(25)
as 
begin
	select Person.FirstName,Department.DepartmentName 
	from Person join Department 
	on Person.DepartmentID = Department.DepartmentID 
	join Designation on Person.DesignationID = Designation.DesignationID
	where Designation.DesignationName = @desi_name and Person.JoiningDate > (SELECT dateadd(year, -10, getdate()))
end
EXEC PR_DESI_10YEARS 'CEO'



--14. Create a procedure to list the number of workers in each department who do not have a designation assigned.
create or alter proc PR_NO_DESI
as 
begin
	select Person.FirstName, Department.DepartmentName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID
	where Person.DesignationID is null
end


--15. Create a procedure to retrieve the details of workers in departments where the average salary is above
--12000.
create or alter proc PR_DEPT_AVG_SAL
as
begin
	select FirstName, Salary, DepartmentName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID
	group by Department.DepartmentName,FirstName,salary
	having avg(Person.Salary) > 12000;
end
