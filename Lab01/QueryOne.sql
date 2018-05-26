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
