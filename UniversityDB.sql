create database University
use University

create table Students (
	Id int primary key identity,
	Firstname nvarchar(20) not null,
	Lastname nvarchar(20) not null
)

create table Teachers (
	Id int primary key identity,
	Firstname nvarchar(20) not null,
	Lastname nvarchar(20) not null
)

create table TeacherStudents (
	Id int primary key identity,
	StudentId int references Students(Id),
	TeacherId int references Teachers(Id)
)

create table Groups (
	Id int primary key identity,
	Name nvarchar(20) not null
)

create table Departments (
	Id int primary key identity,
	Name nvarchar(20) not null
)

create table Subjects (
	Id int primary key identity,
	Name nvarchar(20) not null
)

create table TeacherGroups (
	Id int primary key identity,
	TeacherId int references Teachers(Id),
	GroupId int references Groups(Id)
)

alter table Students
add GroupId int references Groups(Id)

alter table Teachers
add DepartmentId int references Departments(Id)

alter table Teachers
add SubjectId int references Subjects(Id)

create table StudentSubjects (
	Id int primary key identity,
	StudentId int references Students(Id),
	SubjectId int references Students(Id)
)

alter table Departments
add SubjectId int references Subjects(Id)

alter table Subjects
add DepartmentId int references Departments(Id)

create table GroupSubjects (
	Id int primary key identity,
	GroupId int references Groups(Id),
	SubjectId int references Subjects(Id)
)