''' sql
 
 -- Lenguaje SQL-LDD (create, alter, drop)

 -- Crear la abse de datos empresaG2

 CREATE DATABASE empresag2;
 GO

 -- Utilizar base de datos
USE empresag2;

-- Crear la tabla categorias
CREATE TABLE Categorias
(
CategotiaId int primary key,
NombreCategoria nvarchar(30) not null unique

);
GO

-- Crear tabla empleado
CREATE TABLE empleado
(
EmpleadoId int not null identity(1,1),
Nombre nvarchar(20),
ApellidoPaterno nvarchar(15) not null,
curp char(18) not null,
telefono char(15),
sexo char(1) not null,
activo bit not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoId),
CONSTRAINT unique_curp
UNIQUE(curp),
CONSTRAINT chk_sexo
CHECK (sexo in ('M', 'F'))
);
GO

-- Insert en categorias
INSERT INTO Categorias(CategotiaId, NombreCategoria)
VALUES(1, 'CARNES FRIAS');
GO

INSERT INTO Categorias(CategotiaId, NombreCategoria)
VALUES(2, 'VINOS Y LICORES');
GO

SELECT * FROM Categorias
GO

-- INSERTAR EMPLEADO
INSERT INTO empleado(Nombre, ApellidoPaterno, curp, telefono, sexo, activo)
VALUES('Mico','Panfilo', 'SEMA123456789', '5520119554', 'M', 1);
GO

INSERT INTO empleado(Nombre, ApellidoPaterno, curp, telefono, sexo, activo)
VALUES('Mico','Panfilo', 'SEMA123456789', '5520119554', 'M', 1);
GO

SELECT * FROM empleado;
GO
-- Crear tabla Cliente

'''