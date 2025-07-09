# Esquema de Base de Datos: Doctor

## Objetivo
Modelar la relación entre doctores, pacientes y sus atenciones utilizando SQL Server y MySQL.

---

## Entidades y Relaciones

### Doc
- `numDoc`: ID único del doctor (clave primaria).
- `nombre`: Nombre del doctor.
- `apellido1`, `apellido2`: Apellidos del doctor.

### Paciente
- `numPaciente`: ID único del paciente (clave primaria).
- `nombreP`: Nombre del paciente.
- `apellido1`, `apellido2`: Apellidos del paciente.

### Atiende
- Registra las atenciones médicas.
- Llave primaria compuesta por `numDoc`, `numPaciente` y `fecha`.
- `diagnostico`: Diagnóstico del paciente.
- Llaves foráneas a `Doc` y `Paciente`.

---

## Compatibilidad SQL Server vs MySQL

| Característica          | SQL Server              | MySQL                    |
|------------------------|-------------------------|--------------------------|
| Separador de lotes `GO`| Sí                      | No                       |
| Tipo `nvarchar`        | Soportado               | Usar `VARCHAR`           |
| Llaves primarias compuestas | Soportadas          | Soportadas               |
| Llaves foráneas        | Soportadas              | Soportadas               |

---

## Notas
- Se utiliza `VARCHAR(500)` para el campo `diagnostico`.
- El campo `fecha` permite identificar distintas atenciones en diferentes días.
- No se utiliza `ON DELETE CASCADE` para mantener integridad referencial manual.

---

## Script MySQL

```sql
CREATE DATABASE Doctor;
USE Doctor;

CREATE TABLE Doc (
  numDoc INT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL
);

CREATE TABLE Paciente (
  numPaciente INT PRIMARY KEY,
  nombreP VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL
);

CREATE TABLE Atiende (
  numDoc INT NOT NULL,
  numPaciente INT NOT NULL,
  diagnostico VARCHAR(500) NOT NULL,
  fecha DATE,
  PRIMARY KEY (numDoc, numPaciente, fecha),
  FOREIGN KEY (numDoc) REFERENCES Doc(numDoc),
  FOREIGN KEY (numPaciente) REFERENCES Paciente(numPaciente)
);
