-- Diagrama Relacional a SQL de una Sucursal

-- CREAR BASE DE DATOS DE UNA SUCURSAL
CREATE DATABASE Sucursal;
GO

-- Utilizar base de datos de la sucursal
USE Sucursal;

-- Crear tabla de Sucursal
CREATE TABLE Sucursal1
(
numSucursal int primary key,
nombre varchar(30) not null,
ubicacion varchar(30) not null,

);
GO

-- Crear tabla de Clientes
CREATE TABLE Clientes
(
numCliente int primary key,
nombreC varchar(30) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30) not null,
curp char(12) not null,
calle nvarchar(50) not null,
num int not null,
ciudad varchar(30) not null,
CONSTRAINT unique_curp
UNIQUE(curp)
);
GO

-- Crear tabla de Vehiculo
CREATE TABLE Vehiculo
(
numVehiculo int primary key,
placa nvarchar(10) not null,
marca nvarchar(30) not null,
modelo nvarchar(10) not null,
anio int not null,
numCliente int not null,
numSucursal int not null,
FOREIGN KEY (numCliente)
REFERENCES Clientes(numCliente),
FOREIGN KEY (numSucursal)
REFERENCES Sucursal1(numSucursal)
);
GO