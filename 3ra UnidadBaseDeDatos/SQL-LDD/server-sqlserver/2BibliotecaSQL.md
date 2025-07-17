# Esquema de Base de Datos: Biblioteca

## Objetivo
Modelar una biblioteca con sus lectores y libros utilizando SQL Server y MySQL.

---

## Entidades y Relaciones

### Lectores
- `numLector`: ID único del lector (clave primaria).
- `nombre`: Nombre del lector.
- `apellido1`, `apellido2`: Apellidos del lector.
- `numMembresia`: Número de membresía.

### Libro
- `numlibro`: ID único del libro (clave primaria).
- `numISBN`: Código ISBN del libro.
- `titulo`: Título del libro.
- `autor`: Autor del libro.
- `numLector`: ID del lector que tiene el libro prestado (clave foránea a `Lectores`).

---

## Compatibilidad SQL Server vs MySQL

| Característica         | SQL Server               | MySQL                    |
|------------------------|--------------------------|--------------------------|
| `GO`                   | Separador de lotes       | No soportado             |
| `VARCHAR(n)`           | Soportado                | Soportado                |
| Clave foránea          | Soportado                | Soportado                |
| Referencias cruzadas   | Soportado                | Soportado                |

---

## Notas
- La relación entre `Libro` y `Lectores` es de muchos libros a un lector.
- No se incluye control de fechas de préstamo o devolución.
- Se evita el uso de `ON DELETE CASCADE` para mantener la integridad referencial de forma manual.
- El campo `numISBN` es de tipo `INT` por simplicidad, aunque normalmente se usa `VARCHAR` si se incluyen guiones o caracteres.

---

## Script MySQL

```sql
-- Crear base de datos
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Crear tabla de Lectores
CREATE TABLE Lectores (
  numLector INT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30) NOT NULL,
  numMembresia VARCHAR(30) NOT NULL
);

-- Crear tabla de Libro
CREATE TABLE Libro (
  numlibro INT PRIMARY KEY,
  numISBN INT NOT NULL,
  titulo VARCHAR(30) NOT NULL,
  autor VARCHAR(30) NOT NULL,
  numLector INT NOT NULL,
  FOREIGN KEY (numLector) REFERENCES Lectores(numLector)
);
