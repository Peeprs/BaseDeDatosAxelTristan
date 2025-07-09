# Esquema de Base de Datos: Escuela

## Objetivo
Modelar una escuela con estudiantes, cursos e inscripciones utilizando SQL Server y MySQL.

---

## Entidades y Relaciones

### Estudiante
- `numEstudiante`: ID único del estudiante (clave primaria).
- `nombreP`: Nombre del estudiante.
- `apellido1`, `apellido2`: Apellidos del estudiante.
- `numMatricula`: Número de matrícula.

### Curso
- `numCurso`: ID único del curso (clave primaria).
- `nombre`: Nombre del curso.
- `codigo`: Código identificador del curso.

### Inscripcion
- Relación muchos a muchos entre `Estudiante` y `Curso`.
- `fechaInscripcion`: Fecha en que el estudiante se inscribió al curso.
- Clave primaria compuesta por `numCurso` y `numEstudiante`.
- Llaves foráneas a `Curso` y `Estudiante`.

---

## Compatibilidad SQL Server vs MySQL

| Característica          | SQL Server              | MySQL                    |
|------------------------|-------------------------|--------------------------|
| Separador de lotes `GO`| Sí                      | No                       |
| Coma final en columnas | No permitida            | No permitida (evitado aquí) |
| Claves primarias compuestas | Soportadas          | Soportadas               |
| Llaves foráneas        | Soportadas              | Soportadas               |

---

## Notas
- La tabla `Inscripcion` representa una relación muchos a muchos entre estudiantes y cursos.
- Se usa tipo `INT` para identificadores y fechas con tipo `DATE`.
- No se usa `ON DELETE CASCADE` para preservar integridad referencial manualmente.

---

## Script MySQL

```sql
CREATE DATABASE Escuela;
USE Escuela;

CREATE TABLE Estudiante (
  numEstudiante INT PRIMARY KEY,
  nombreP VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL,
  numMatricula INT NOT NULL
);

CREATE TABLE Curso (
  numCurso INT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  codigo INT NOT NULL
);

CREATE TABLE Inscripcion (
  numCurso INT,
  numEstudiante INT,
  fechaInscripcion DATE,
  PRIMARY KEY (numCurso, numEstudiante),
  FOREIGN KEY (numCurso) REFERENCES Curso(numCurso),
  FOREIGN KEY (numEstudiante) REFERENCES Estudiante(numEstudiante)
);
