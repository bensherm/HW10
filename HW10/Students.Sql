Create Database CollegeDB
go

use CollegeDB

create table Students(
StuId int identity Primary Key not null,
Fname varchar(25)not null,
Lname Varchar(25) not null,
SSN int not null,
Address Varchar(100) not null,
City varchar(25)not null,
State varchar (25) not null,
Zip int not null,
Phone bigint not null);
go

create table Classes(
ClassesId int identity primary key not null,
Title varchar(25) not null,
Number int not null,
DepartmentTypeId int constraint Fk_Classes_DepartmentTypeID foreign key references CollegeDB.dbo.Department(DeptID)not null,
);
go

create table Scores(
ScoresId int Identity primary key not null,
ScoresTypeID int constraint Fk_Scores_ScoresTypeID foreign key references CollegeDB.dbo.Type(typeId)not null,
Description varchar(25) not null,
Assigned dateTime not null,
Due dateTime not null,
Submitted dateTime not null,
PointsEarned int not null,
PointsPossible int not null,
);
go


create table StudentClasses(
StudentClassesID int identity primary key,
StudentsID int constraint Fk_StudentClasses_StuId foreign key references CollegeDb.dbo.Students(StuID) not null,
ClassesId int constraint FK_StudentClasses_ClassesID foreign key references CollegeDB.dbo.Classes(ClassesId)not null,
ScoresId int constraint FK__StudentClasses_ScoresID Foreign Key References CollegeDB.dbo.Scores(ScoresId)not null,
);
go

insert into StudentClasses(ClassesId, StudentsID, ScoresId)
values(2,1,2 ),
	(3,2,3),
	(4,3,4);

create table Type(
typeId int identity primary key,
WorkType varchar(25) not null);
go

create table Department(
DeptID int identity primary key,
DepartmentType varchar(25) not null);

insert into students(Fname, Lname, SSN, Address, City, State, Zip, Phone)
	values ('Dwight','Schrute','123456963','123 FakeStreet','Scranton','Pennsylvania', '75245',
 '7245756951'),
 ('Michael','Scott','222664444','123 NotStreet','Scranton','Pennsylvania', '75245',
 '7246631122'),
 ('Jim','Halpert','333965522','123 AStreet','Scranton','Pennsylvania', '75245',
 '7242287744');

 insert into Classes(Title, Number, DepartmentTypeId)
	values ('Algebra1','01', 1),
	('Chemisty','22',2),
	('Philosophy','44',3);

insert into Scores(ScoresTypeId, Description, Assigned, Due, Submitted, PointsEarned, PointsPossible)
	Values( 1, 'Hw5', '2017-07-27','2017-07-30', '2017-07-29', '93','100'),
		(2,'Final', '2017-08-05','2017-08-05', '2017-08-05', '88','100'),
			(3, 'Tables', '2017-08-10','2017-08-10', '2017-08-10', '85','100');

insert into Department(DepartmentType)
values ('Math'),
		('Science'),
		('English');

insert into Type(WorkType)
values ('Hw'),
	('Essay'),
	('Exam');

--drop table Classes
--drop table ClassGrades
--drop table Students
--drop table Scores
--drop table type
--drop table Department
--drop table stud

