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
select Artists.Artist_name,count(Albums.Album_id) 
from Artists join Albums 
on Artists.Artist_id = Albums.Artist_id
group by Artists.Artist_name
--13
select Albums.Album_id,count(Songs.Song_title)
from Albums join Songs
on Albums.Album_id = Songs.Album_id
group by Albums.Album_id
having count(Songs.Song_title) > 5
--14
select * from Songs where Album_id in (Select Album_id from Albums where Album_title='Album1')
--15
select Album_title from Albums where Artist_id in (Select Artist_id from Artists where Artist_name = 'Aparshakti Khurnana')
--16
select Songs.Song_title,Albums.Album_title from Songs join Albums on Albums.Album_id = Songs.Album_id
--17
select Songs.Song_title from Songs join Albums on Albums.Album_id = Songs.Album_id where Albums.Release_year = 2020
--18
Create view Fav_Songs
as
select * from Songs where Song_id between 101 and 105
--19
update Fav_Songs set Song_title = 'Jannat' where Song_id = 101
--20
select Artists.Artist_name 
from Artists join Albums 
on Artists.Artist_id = Albums.Artist_id
where Albums.Release_year = 2020
--21
select Song_title,Duration from Songs where Album_id in 
(select Albums.Album_id from Albums join Artists on Artists.Artist_id = Albums.Artist_id where Artist_name = 'Shreya Ghoshal')
order by Duration

--Part – B
--22. Retrieve all song titles by artists who have more than one album.
select Artists.Artist_name,Songs.Song_title from Songs join Artists on 
--23. Retrieve all albums along with the total number of songs.
--24. Retrieve all songs and release year and sort them by release year.
--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
--26. List all artists who have albums that contain more than 3 songs.
--Part – C
--27. Retrieve albums that have been released in the same year as 'Album4'
--28. Find the longest song in each genre
--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.

