/* Crear una BD en blanco*/
create DATABASE HospitalHHH;
GO

/*Necesito visualizar el listado de base de datos de tu servidor local*/
SELECT DATABASE_ID, name
FROM sys.databases;
GO

/* Poner en uso una base de datos*/
USE HospitalHHH;
go

/*Ver listado de tablas de una base de datos*/
USE AdventureWorks2016
select name from sys.tables;

/* Ver listado de Vistas de una base de Datos */
USE AdventureWorks2016;
SELECT name from sys.views;
go

/* Visualizar la informacion detallada de una base de datos */
EXEC sp_helpdb AdventureWorks2016;

/* Utilizando snipets*/
-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'ColegioMG'
)
CREATE DATABASE ColegioMG
GO

/*Eliminar una BD*/
DROP DATABASE HospitalHHH;
GO

/*Eliminar base de datos AdventureWorks2016*/
drop DATABASE AdventureWorksDW2016;
go

