-- Diagrama Relacional a SQL de Inscripcion

-- Crear Base de datos de Curso
CREATE DATABASE Escuela;
GO

-- Utilizar base de datos de la Escuela
USE Escuela;

-- Crear tabla Estudiante
CREATE TABLE Estudiante
(
numEstudiante int primary key,
nombreP varchar(30) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30) not null,
numMatricula int not null,
);
GO

-- Crear tabla del Curso
CREATE TABLE Curso(
numCurso int primary key,
nombre varchar(30) not null,
codigo int not null
);
GO

-- Crear tabla de Inscripcion
CREATE TABLE Inscripcion(
numCurso int,
numEstudiante int,
fechaInscripcion DATE,
PRIMARY KEY (numCurso, numEstudiante),
FOREIGN KEY(numCurso)
REFERENCES Curso(numCurso),
FOREIGN KEY (numEstudiante)
REFERENCES Estudiante(numEstudiante)
);
GO