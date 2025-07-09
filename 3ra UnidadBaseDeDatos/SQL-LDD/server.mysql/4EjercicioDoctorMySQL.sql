-- Crear base de datos Doctor
CREATE DATABASE Doctor;

-- Usar base de datos Doctor
USE Doctor;

-- Crear tabla Doc
CREATE TABLE Doc (
  numDoc INT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL
);

-- Crear tabla Paciente
CREATE TABLE Paciente (
  numPaciente INT PRIMARY KEY,
  nombreP VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL
);

-- Crear tabla Atiende
CREATE TABLE Atiende (
  numDoc INT NOT NULL,
  numPaciente INT NOT NULL,
  diagnostico VARCHAR(500) NOT NULL,
  fecha DATE,
  PRIMARY KEY (numDoc, numPaciente, fecha),
  FOREIGN KEY (numDoc) REFERENCES Doc(numDoc),
  FOREIGN KEY (numPaciente) REFERENCES Paciente(numPaciente)
);
