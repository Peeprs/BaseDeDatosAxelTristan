-- Crear base de datos
CREATE DATABASE Empresa1;
USE Empresa1;

-- Tabla Department
CREATE TABLE Department (
    numberDepta INT PRIMARY KEY,
    NameDepto VARCHAR(20) UNIQUE NOT NULL,
    ssn CHAR(12),
    stardate DATE
);

-- Tabla Employee
CREATE TABLE Employee (
    ssn CHAR(12) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Address1 VARCHAR(50) NOT NULL,
    BirtDate DATE,
    Salary DECIMAL(15,2) NOT NULL,
    Sex CHAR(1) NOT NULL,
    NumDepto INT NOT NULL,
    NameDepto VARCHAR(20) NOT NULL,
    supervisor CHAR(12),
    CONSTRAINT chk_sex CHECK (Sex IN ('M', 'F')),
    FOREIGN KEY (NumDepto) REFERENCES Department(numberDepta),
    FOREIGN KEY (supervisor) REFERENCES Employee(ssn)
);

-- Tabla DeptLocation
CREATE TABLE DeptLocation (
    NumDepto INT NOT NULL,
    NameDepto VARCHAR(20) NOT NULL,
    DLocation VARCHAR(20) NOT NULL,
    FOREIGN KEY (NumDepto) REFERENCES Department(numberDepta)
);

-- Tabla Project
CREATE TABLE Project (
    numberProject INT PRIMARY KEY,
    nameProject VARCHAR(40),
    location1 VARCHAR(40),
    numDepto INT,
    nameNumber VARCHAR(30),
    FOREIGN KEY (numDepto) REFERENCES Department(numberDepta)
);

-- Tabla Works_On
CREATE TABLE Works_On (
    ssn CHAR(12),
    numProject INT,
    nameProject VARCHAR(20),
    horas DECIMAL(5,2),
    PRIMARY KEY (ssn, numProject),
    FOREIGN KEY (ssn) REFERENCES Employee(ssn),
    FOREIGN KEY (numProject) REFERENCES Project(numberProject)
);

-- Tabla Dependent1
CREATE TABLE Dependent1 (
    ssn CHAR(12),
    name1 VARCHAR(20),
    relationship CHAR(1) NOT NULL,
    sex CHAR(1),
    birthdate DATE,
    CONSTRAINT chk_relationship CHECK (relationship IN ('C', 'D', 'S', 'V')),
    CONSTRAINT chk_sex_dependent CHECK (sex IN ('M', 'F')),
    PRIMARY KEY (ssn, name1),
    FOREIGN KEY (ssn) REFERENCES Employee(ssn)
);
