-- Diagrama relacional de Empresa

-- Crear base de datos de Empresa

CREATE DATABASE Empresa1;
GO

-- Utilizar base de datos

USE Empresa1;

-- Crear tabla Department
CREATE TABLE Department
(
numberDepta int primary key,
NameDepto varchar(20) UNIQUE NOT NULL,
ssn char(12),
stardate DATE,

);
GO

-- Crear tabla de Employee
CREATE TABLE Employee
(
ssn CHAR(12) primary key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
Address1 varchar(50) not null,
BirtDate date,
Salary money not null,
Sex char(1) not null,
NumDepto  int not null,
NameDepto varchar(20) not null,
supervisor CHAR(12),
CHECK (Sex in('M', 'F')),
FOREIGN KEY(NumDepto)
REFERENCES Department(numberDepta),
FOREIGN KEY(supervisor)
REFERENCES Employee(ssn)
);
GO



-- CREAR tabla DeptLocation
CREATE TABLE DeptLocation
(
NumDepto int not null,
NameDepto varchar(20) not null,
DLocation nvarchar(20) not null,
FOREIGN KEY(numDepto)
REFERENCES Department(numberDepta),

);
GO

-- Crear tabla Project
CREATE TABLE Project
(
numberProject int primary key,
nameProject nvarchar(40),
location1 nvarchar(40),
numDepto int,
nameNumber nvarchar(30),
FOREIGN KEY (numDepto)
REFERENCES Department(numberDepta)
);
GO

-- Crear tabla Works_On
CREATE TABLE Works_On
(
ssn char(12),
numProject int,
nameProject nvarchar(20),
horas DECIMAL(5,2),
PRIMARY KEY (ssn, numProject),
FOREIGN KEY (ssn)
REFERENCES Employee(ssn),
FOREIGN KEY (numProject)
REFERENCES Project(numberProject)
);
GO

-- Crear tabla Dependent
CREATE TABLE Dependent1
(
ssn char(12),
name1 varchar(20),
relationship char(1) not null,
sex char(1),
birthdate DATE,
CHECK (relationship in('C', 'D', 'S', 'V')),
CHECK (sex in('M', 'F')),
PRIMARY KEY (ssn, name1),
FOREIGN KEY (ssn)
REFERENCES Employee(ssn)
);
GO