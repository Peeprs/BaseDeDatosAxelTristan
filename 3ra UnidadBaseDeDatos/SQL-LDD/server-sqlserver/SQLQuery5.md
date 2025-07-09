# Esquema de Base de Datos: Sucursal

## Objetivo
Modelar una sucursal con clientes y vehículos utilizando SQL Server y MySQL.

---

## Entidades y Relaciones

### Sucursal1
- `numSucursal`: ID único de la sucursal (clave primaria).
- `nombre`: Nombre de la sucursal.
- `ubicacion`: Ubicación de la sucursal.

### Clientes
- `numCliente`: ID único del cliente (clave primaria).
- `nombreC`: Nombre del cliente.
- `apellido1`, `apellido2`: Apellidos del cliente.
- `curp`: CURP único del cliente (único).
- `calle`: Calle de domicilio.
- `num`: Número de domicilio.
- `ciudad`: Ciudad de residencia.

### Vehiculo
- `numVehiculo`: ID único del vehículo (clave primaria).
- `placa`: Placa del vehículo.
- `marca`: Marca del vehículo.
- `modelo`: Modelo del vehículo.
- `anio`: Año del vehículo.
- `numCliente`: ID del cliente dueño (clave foránea a `Clientes`).
- `numSucursal`: ID de la sucursal asociada (clave foránea a `Sucursal1`).

---

## Compatibilidad SQL Server vs MySQL

| Característica          | SQL Server               | MySQL                    |
|------------------------|--------------------------|--------------------------|
| Separador de lotes `GO`| Sí                       | No                       |
| Tipo `nvarchar`        | Soportado                | Usar `VARCHAR`           |
| Restricción UNIQUE     | Soportada                | Soportada                |
| Llaves foráneas        | Soportadas               | Soportadas               |

---

## Notas
- El campo `curp` es único para garantizar la no duplicidad.
- Se usa `VARCHAR` en MySQL en lugar de `nvarchar`.
- No se utiliza `ON DELETE CASCADE` para mantener integridad manual.

---

## Script MySQL

```sql
CREATE DATABASE Sucursal;
USE Sucursal;

CREATE TABLE Sucursal1 (
  numSucursal INT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  ubicacion VARCHAR(30) NOT NULL
);

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
