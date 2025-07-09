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

-- Creacion de primary keys compuestas
CREATE TABLE Tabla1
(
Tablaid1 int not null,
Tablaid2 int not null,
Nombre nvarchar(20) not null,
CONSTRAINT pk_tabla1
PRIMARY KEY(Tablaid1, Tablaid2)
)
GO

-- Razon de cardinalidad 1:N
CREATE TABLE tabla2
(
Tabla2id int not null identity(1,1),
Nombre nvarchar(20),
Tablaid1 int,
Tablaid2 int,
CONSTRAINT pk_tabla2
PRIMARY KEY(Tabla2id),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY (Tablaid1, Tablaid2)
REFERENCES Tabla1(Tablaid1, Tablaid2)

)
GO

-- Razon de cardinalidad 1:1 (Fidelidad)
CREATE TABLE  Employee
(
Id int not null identity (1,1),
Nombre varchar(20) not null,
Ap1 varchar(20) not null,
Ap2 varchar(15),
Sexo char(1) not null,
Salario money not null,
CONSTRAINT pk_employee
PRIMARY KEY(Id),
CONSTRAINT chk_Sexo2
CHECK(sexo in('M','F')),
CONSTRAINT chk_salario
CHECK (Salario>0.0)
);
GO

-- 
CREATE TABLE Department
(
Id int not null identity(1,1),
NomProyecto nvarchar(20) not null,
Ubicacion varchar(15) not null,
FechaInicio date not null,
IdEmployee int not null,
CONSTRAINT pk_department
PRIMARY KEY(Id),
CONSTRAINT unique_NomProyecto
UNIQUE(NomProyecto),
CONSTRAINT unique_idemployee
UNIQUE (IdEmployee),
CONSTRAINT fk_department_employee
FOREIGN KEY (IdEmployee)
REFERENCES Employee(Id)
);
GO



CREATE TABLE Project
(

);
GO

CREATE TABLE Project
(
    ProjectId INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(30) NOT NULL,
    CONSTRAINT pk_project 
	PRIMARY KEY(ProjectId)
);
GO

CREATE TABLE Works_On
(
    EmployeeId INT NOT NULL,
    ProjectId INT NOT NULL,
    Horas INT NOT NULL 
	CHECK (Horas > 0),
    CONSTRAINT pk_workson
	PRIMARY KEY (EmployeeId, ProjectId),
    CONSTRAINT fk_workson_employee 
	FOREIGN KEY (EmployeeId)
    REFERENCES Employee(Id),
    CONSTRAINT fk_workson_project 
	FOREIGN KEY (ProjectId)
    REFERENCES Project(ProjectId)
);
GO
