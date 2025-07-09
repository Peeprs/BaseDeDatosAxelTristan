-- Crear base de datos de la Escuela
CREATE DATABASE Escuela;

-- Utilizar base de datos de la Escuela
USE Escuela;

-- Crear tabla Estudiante
CREATE TABLE Estudiante (
  numEstudiante INT PRIMARY KEY,
  nombreP VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL,
  numMatricula INT NOT NULL
);

-- Crear tabla Curso
CREATE TABLE Curso (
  numCurso INT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  codigo INT NOT NULL
);

-- Crear tabla Inscripcion
CREATE TABLE Inscripcion (
  numCurso INT,
  numEstudiante INT,
  fechaInscripcion DATE,
  PRIMARY KEY (numCurso, numEstudiante),
  FOREIGN KEY (numCurso) REFERENCES Curso(numCurso),
  FOREIGN KEY (numEstudiante) REFERENCES Estudiante(numEstudiante)
);
