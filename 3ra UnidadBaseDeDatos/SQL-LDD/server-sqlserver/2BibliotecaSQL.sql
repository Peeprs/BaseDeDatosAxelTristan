-- Diagrama relacional a SQL de biblioteca

-- Crear base de datos de una Biblioteca
CREATE DATABASE Biblioteca;
GO

-- Utilizar base de datos de la biblioteca
USE Biblioteca;

-- Crear tabla de Lectores
CREATE TABLE Lectores
(
numLector int primary key,
nombre varchar(30) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30) not null,
numMembresia varchar(30) not null
);
GO

-- Crear tabla de Libro
CREATE TABLE Libro
(
numlibro int primary key,
numISBN int not null,
titulo varchar(30) not null,
autor varchar(30) not null,
numLector int not null,
FOREIGN KEY (numLector)
REFERENCES Lectores(numLector)
);
GO
