-- Crear base de datos de una Biblioteca
CREATE DATABASE Biblioteca;

-- Utilizar base de datos de la biblioteca
USE Biblioteca;

-- Crear tabla de Lectores
CREATE TABLE Lectores (
  numLector INT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL,
  numMembresia VARCHAR(30) NOT NULL
);

-- Crear tabla de Libro
CREATE TABLE Libro (
  numlibro INT PRIMARY KEY,
  numISBN INT NOT NULL,
  titulo VARCHAR(30) NOT NULL,
  autor VARCHAR(30) NOT NULL,
  numLector INT NOT NULL,
  FOREIGN KEY (numLector) REFERENCES Lectores(numLector)
);
