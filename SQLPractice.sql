create database CourseDatabase

use CourseDatabase

create table Teachers(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[Surname] nvarchar(50),
	[Email] nvarchar(100) unique,
	[Age] int
)

create table Students(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(50),
	[Age] int,
	[Address] nvarchar(100)
)

insert into Teachers([Name],[Surname],[Email],[Age])
values('Rashad','Aghayev','rashad@gmail.com',21),
	  ('Ilqar','Shiriyev','ilqar@gmail.com',26),
	  ('Behruz','Eliyev','behruz@gmail.ru',18),
	  ('Hacixan','Hacixanov','hacixan@gmail.com',19)

insert into Students([FullName],[Address],[Age])
values('Rashad Aghayev','Neftciler',21),
	  ('Ilqar Shiriyev','Yasamal',26),
	  ('Behruz Eliyev', 'Kurdexani',18),
	  ('Hacixan Hacixanov', 'Zaqatala',19)

select SUBSTRING([Email],1,CHARINDEX('@',[Email]) - 1) from Teachers

select SUBSTRING(
[Email],CHARINDEX('@',[Email]) + 1,LEN([Email])-CHARINDEX('@',[Email])) from Teachers

select * from Students

truncate table Students

alter table Students
add SoftDeleted bit default 0

select * from Students where [SoftDeleted] ='false'

update Students
set [SoftDeleted] = 1
where [Id] > 2

create table Countries(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50)
)

create table Cities(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[CountryId] int,
	foreign key ([CountryId]) references Countries(Id)
)


insert into Countries([Name])
values('Azerbaycan'),
	  ('Turkiye'),
	  ('Ingiltere')

select * from Countries

select * from Cities

insert into Cities([Name],[CountryId])
values('Baki',1),
	  ('Gence',1),
	  ('Zaqatala',1),
	  ('Istanbul',2),
	  ('Bursa',2),
	  ('London',3)

select * from Cities where [CountryId] = 1


create table Books(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50)
)

create table Authors(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[Email] nvarchar(100)
)

create table BookAuthors(
	[Id] int primary key identity(1,1),
	[BookId] int,
	[AuthorId] int
	foreign key ([BookId]) references Books(Id),
	foreign key ([AuthorId]) references Authors(Id)
)

select * from Books
select * from Authors
select * from BookAuthors

insert into Books([Name])
values('Ali ve Nino'),
	  ('Leyli ve Mecnun'),
	  ('Isgendername')

insert into Authors([Name],[Email])
values('Author1','author1@gmail.com'),
	  ('Author2','author1@gmail.com'),
	  ('Author3','author1@gmail.com')

insert into BookAuthors([BookId],[AuthorId])
values (1,1),
       (2,1),
	   (3,2),
	   (1,2)


select * from Cities
select * from Countries

select ct.Name as 'City', ctr.Name as 'Country' from Cities ct
inner join Countries ctr
on ct.CountryId = ctr.Id

select ct.Name as 'City', ctr.Name as 'Country' from Cities ct
left join Countries ctr
on ct.CountryId = ctr.Id

select ct.Name as 'City', ctr.Name as 'Country' from Cities ct
right join Countries ctr
on ct.CountryId = ctr.Id

select ct.Name as 'City', ctr.Name as 'Country' from Cities ct
full join Countries ctr
on ct.CountryId = ctr.Id

select a.Name as 'Author name',a.Email as 'Author email', b.Name as 'Book name' from Authors a
join BookAuthors ba
on a.Id = ba.BookId
join Books b
on b.Id = ba.BookId

create table Employees(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[ManagerId] int
	)

select em1.Name as 'manager name', em2.Name as 'employee name'
from Employees em1
 join Employees em2 
 on em1.Id=em2.ManagerId
