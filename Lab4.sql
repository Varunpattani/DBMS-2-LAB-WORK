--Part – A
--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_HELLO_WORLD()
RETURNS VARCHAR(25)
AS
BEGIN
	RETURN 'HELLO WORLD'
END
SELECT dbo.FN_HELLO_WORLD();

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_SUM_OF_TWO(@n1 int, @n2 int)
RETURNS INT
AS
BEGIN
	RETURN (@n1+@n2)
END
select dbo.FN_SUM_OF_TWO(10,20)

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_ODD_EVEN(@n int)
RETURNS VARCHAR(25)
AS
BEGIN
	DECLARE @ans VARCHAR(25)
	IF @n%2=0
		set @ans = 'EVEN'
	ELSE
		set @ans = 'ODD'
	RETURN @ans
END
select dbo.FN_ODD_EVEN(5)

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_NAME_B()
RETURNS Table
AS
return(
	select * from Person where FirstName like 'B%'
)

select * from dbo.FN_NAME_B()

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_FIRST_NAME()
RETURNS TABLE
AS
RETURN (
    SELECT DISTINCT FirstName
    FROM Person
)
SELECT * FROM dbo.FN_FIRST_NAME();

--6. Write a function to print number from 1 to N. (Using while loop)
create or alter function FN_1_TO_N(@n int)
returns varchar(200)
as
begin
	declare @msg varchar(200),@count int
	set @msg = ''
	set @count = 1
	while(@count<=@n)
		begin
			set @msg = @msg + cast(@count as varchar) + ' '
			set @count = @count + 1
		end
	return @msg
end
select dbo.FN_1_TO_N(5)

--7. Write a function to find the factorial of a given integer.
create or alter function FN_FACTORIAL(@n int)
returns INT	
as
begin
	declare @count int,@res int
	set @count = 2
	set @res = 1
	while(@count<=@n)
		begin
			set @res = @res * @count
			set @count = @count + 1
		end
	return @res
end
select dbo.FN_FACTORIAL(3)


--Part – B
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
create or alter function FN_COMPARE_TWO(@n1 int,@n2 int)
returns varchar(50)
as
begin
	return
		case
			when (@n1>@n2) then cast(@n1 as varchar) + ' is greater than ' + cast(@n2 as varchar)
			when (@n2>@n1) then cast(@n2 as varchar) + ' is greater than ' + cast(@n1 as varchar)
		end
end
select dbo.FN_COMPARE_TWO(7,3)
			
--9. Write a function to print the sum of even numbers between 1 to 20.
create or alter function FN_SUM_OF_EVEN()
returns int
as 
begin
	declare @sum int,@count int
	set @count = 1
	set @sum = 0

	while (@count<=20)
		begin
			if(@count%2 = 0)
				set @sum += @count
			set @count += 1
		end
	return @sum
end
select dbo.FN_SUM_OF_EVEN()

--10. Write a function that checks if a given string is a palindrome
create or alter function FN_PALINDROME(@str varchar(50))
returns varchar(25)
as
begin
	declare @res varchar(25),@msg varchar(25)
	set @res = reverse(@str)
	if(@res = @str)
		set @msg = 'Palindrome'
	else set @msg = 'Not Palindrome'
	return @msg
end
select dbo.FN_PALINDROME('aba')


--Part – C
--11. Write a function to check whether a given number is prime or not.
CREATE OR ALTER FUNCTION FN_PRIME(@n INT)
RETURNS VARCHAR(25)
AS
BEGIN
    DECLARE @msg VARCHAR(25), @count INT;
    
    
    SET @count = 2;
    SET @msg = 'Prime';

    
    IF (@n <= 1)
    BEGIN
        SET @msg = 'Not Prime';
        RETURN @msg;
    END

    
    WHILE (@count < @n)
    BEGIN
        IF (@n % @count = 0)
        BEGIN
            SET @msg = 'Not Prime';
            RETURN @msg; 
        END
        SET @count = @count + 1;
    END
	
	RETURN @msg
END

select dbo.FN_PRIME(13)
--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.
create or alter function FN_DIFF_DATES(@startDate DATE, @endDate DATE)
returns int
as
begin
	return datediff(day,@startDate,@endDate)
end
select dbo.FN_DIFF_DATES('2023-12-16','2023-12-25')
--13. Write a function which accepts two parameters year & month in integer and returns total days each
--year.
create or alter function FN_TOTAL_DAYS(@year int,@mth int)
returns int
as 
begin
	declare @ans varchar(25)
	declare @date date
	declare @days int

	set @ans = CAST(@year as varchar(25))+'-'+CAST(@mth as varchar(25))+'-'+CAST(1 as varchar(25))
	set @date = CAST(@ans as date)
	set @days = DAY(EOMONTH(@date)) 
	return @days

end
select dbo.FN_TOTAL_DAYS(2012,2)
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
create or alter function FN_DEPT(@id int)
returns table
as 
return (
	select PersonID,FirstName,LastName,Salary,JoiningDate 
	from Person JOIN Department
	on Person.DepartmentID = Department.DepartmentID 
	where Department.DepartmentID = @id
)
select * from dbo.FN_DEPT(1)
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.
create or alter function FN_JOIN_AFTER()
returns table
as
return(
	select * from Person where JoiningDate>'1991-01-01'
)
select * from dbo.FN_JOIN_AFTER()