# Esquema de Base de Datos: Empresa1

## Objetivo
Modelar una empresa con sus departamentos, empleados, proyectos y dependientes usando SQL Server y MySQL.

---

## Entidades y Relaciones

### Department
- `numberDepta`: ID único del departamento.
- `NameDepto`: Nombre único del departamento.
- `ssn`: Supervisor principal (puede estar en Employee).
- `stardate`: Fecha de creación.

### Employee
- `ssn`: ID del empleado (clave primaria).
- `FirstName`, `LastName`: Nombres.
- `Address1`: Dirección.
- `BirtDate`: Fecha de nacimiento.
- `Salary`: Sueldo.
- `Sex`: Género (M/F).
- `NumDepto`: Relación al departamento.
- `supervisor`: Referencia a otro empleado.

### DeptLocation
- Relaciona un departamento con su ubicación (`DLocation`).

### Project
- `numberProject`: ID del proyecto.
- `nameProject`, `location1`, `nameNumber`: Descripción.
- `numDepto`: Departamento responsable.

### Works_On
- Relación muchos a muchos entre `Employee` y `Project`.
- Incluye horas trabajadas.

### Dependent1
- Registra dependientes del empleado.
- Relación, género, nacimiento.

---

## Compatibilidad SQL Server vs MySQL

| Característica          | SQL Server              | MySQL                    |
|-------------------------|--------------------------|--------------------------|
| Tipo `money`            | Sí                       | No (usa `DECIMAL`)       |
| `NVARCHAR`              | Sí                       | Reemplazado por `VARCHAR`|
| `CHECK` en versiones    | Completo                 | MySQL 8+ soporta `CHECK` |

---

## Notas
- El campo `supervisor` referencia recursivamente a Employee.
- Se evita ON DELETE CASCADE para preservar integridad manual.

