create database dbms2

use dbms2

--Part - A:
--1
select distinct Genre from Songs
--2
select  top 2*  from Albums where Release_year < 2010 
--3
insert into Songs values (1245,'Zaroor',2.55,'Feel Good',1005)
--4
Update Songs set Genre = 'Happy' where Song_title = 'Zaroor'
--5
delete from Artists where Artist_name = 'Ed Sheeran'
--6
Alter table Songs add Rating Decimal(3,2)
--7
select * from Songs where Song_title like 'S%'
--8
select * from Songs where Song_title like '%Everybody%'
--9
Select UPPER(Artist_name) from Artists
--10
Select Sqrt(Duration) from Songs where Song_title = 'Good Luck'
--11
Select GETDATE()
--12

