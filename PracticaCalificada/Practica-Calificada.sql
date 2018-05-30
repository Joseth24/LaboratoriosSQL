/* PRÁCTICA CALIFICADA DE MS SQL SERVER */
/* PARA ESTA PRACTICA VAMOS A UTILIZAR LA BASE DE DATOS ADVENTURE WORKS 2016 */
/* ELABORE EL CODIGO TRANSACT SQL PARA RESOLVER LOS SIGUIENTES ENUNCIADOS */




/* ¿Se necesita listar los empleados y sus repectivos departamentos en el que laboran? */
CREATE VIEW vw_Pregunta1
AS
SELECT LastName, FirstName, Department
FROM HumanResources.Employee

select * FROM vw_Pregunta1

/* ¿Se necesita saber la cantidad de empleados por departamento? */


select * From vw_Pregunta2
/* ¿Se necesita listar las cantidades de ventas realizadas por año? */
CREATE VIEW vw_Pregunta3
AS
SELECT SalesYTD
FROM Sales.SalesPerson

SELECT * FROM vw_Pregunta3

/* ¿Se necesita listar los empleados son su respectivo correo y numero de telefono? */

CREATE VIEW vw_Empleados
AS 
SELECT LastName, FirstName, PhoneNumber , EmailAddress
FROM HumanResources.vEmployee

 SELECT * FROM vw_Empleados


/* ¿Se necesita saber la cantidad de ventas atendidas por cada vendedor? */


/*Cada uno de los enunciados debe ser considerados Vistas*/
/* Se calificara desde su repositorio de GitHub en la que debera crear
una carpeta llamada Práctica calificada */












