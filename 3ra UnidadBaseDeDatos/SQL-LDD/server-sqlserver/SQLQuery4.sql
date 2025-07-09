-- Diagrama relacional a SQL de Doctor

-- Crear base de datos de un doctor
CREATE DATABASE Doctor;
GO

-- Utilizar base de datos de un doctor
USE Doctor;

-- Crear tabla de Doctor
CREATE TABLE Doc
(
numDoc int primary key,
nombre varchar(30) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30) not null,

);
GO

-- Crear tabla de paciente
CREATE TABLE Paciente(
numPaciente int primary key,
nombreP varchar(30) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30) not null,
);
GO

-- Crear TABLE de Atender
CREATE TABLE Atiende
(
numDoc int not null,
numPaciente int not null,
diagnostico nvarchar(500) not null,
fecha DATE,
PRIMARY KEY (numDoc, numPaciente, fecha),
FOREIGN KEY (numDoc)
REFERENCES Doc(numDoc),
FOREIGN KEY (numPaciente)
REFERENCES Paciente(numPaciente)
);
GO