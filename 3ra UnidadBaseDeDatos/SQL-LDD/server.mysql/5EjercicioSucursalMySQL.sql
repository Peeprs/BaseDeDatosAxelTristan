-- Crear base de datos Sucursal
CREATE DATABASE Sucursal;

-- Usar base de datos Sucursal
USE Sucursal;

-- Crear tabla Sucursal1
CREATE TABLE Sucursal1 (
  numSucursal INT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  ubicacion VARCHAR(30) NOT NULL
);

-- Crear tabla Clientes
CREATE TABLE Clientes (
  numCliente INT PRIMARY KEY,
  nombreC VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL,
  curp CHAR(12) NOT NULL UNIQUE,
  calle VARCHAR(50) NOT NULL,
  num INT NOT NULL,
  ciudad VARCHAR(30) NOT NULL
);

-- Crear tabla Vehiculo
CREATE TABLE Vehiculo (
  numVehiculo INT PRIMARY KEY,
  placa VARCHAR(10) NOT NULL,
  marca VARCHAR(30) NOT NULL,
  modelo VARCHAR(10) NOT NULL,
  anio INT NOT NULL,
  numCliente INT NOT NULL,
  numSucursal INT NOT NULL,
  FOREIGN KEY (numCliente) REFERENCES Clientes(numCliente),
  FOREIGN KEY (numSucursal) REFERENCES Sucursal1(numSucursal)
);
