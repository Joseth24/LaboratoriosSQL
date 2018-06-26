/* PONER EN USO LA BD LIBRERIA */
USE dbLibrary
GO

/* VISUALIZAR LAS TABLAS DE LA BASE DE DATOS ACTIVA */
EXEC sp_tables
GO

/* VISUALIZAR LOS REGISTROS DE LA TABLA GÉNERO */
SELECT *
FROM Genero
GO

/* CREAR UN SP QUE PERMITA LISTAR LOS REGISTROS DE LA TABLA GÉNERO */
CREATE PROCEDURE sp_ListGen
AS
BEGIN
    SELECT *
    FROM Genero
END

/* EJECUTAR STORE PROCEDURE DE LISTADO DE GÉNERO */
EXEC sp_ListGen
GO

/* CREAR UN SP QUE PERMITA LISTAR LOS REGISTROS DE LA TABLA CLIENTE */
CREATE PROCEDURE sp_ListCliente
AS
BEGIN
    SELECT *
    FROM Cliente
END
/* EJECUTAR STORE PROCEDURE DE LISTADO DE CLIENTE */
EXEC sp_ListCliente
GO

/* CREAR UN SP QUE PERMITA LISTAR LOS CLIENTES ORDENADOS POR LA COLUMNA DE FROMA ASCENDENTE */
CREATE PROCEDURE sp_ListClienteSexo
AS
BEGIN
    SELECT *
    FROM Cliente
    ORDER BY Cliente.sexoCliente ASC
END
/* EJECUTAR STORE PROCEDURE DE LISTADO DE CLIENTE POR SEXO*/
EXEC sp_ListClienteSexo
GO

/* MODIFICAR EL SP ANTERIOR DE TAL FORMA QUE PERMITA MOSTRAR EL LISTADO DE CLIENTES DE ACUERDO 
A LA LETRA DEL SEXO INDICADO */
ALTER PROCEDURE sp_ListClienteSexo
    @Sexo VARCHAR(1)
AS
BEGIN
    SELECT *
    FROM Cliente
    WHERE Cliente.sexoCliente = @Sexo
END
/* EJECUTAR STORE PROCEDURE DE LISTADO DE CLIENTE POR SEXO*/
EXEC sp_ListClienteSexo @Sexo = F
GO

/* MODIFICAR EL SP DE TAL FORMA QUE SE VEA COMPLETO EL NOMBRE DEL SEXO */
ALTER PROCEDURE sp_ListClienteSexo
    @Sexo VARCHAR(1)
AS
BEGIN
    SELECT CONCAT( Cliente.apeCliente, ',', Cliente.nomCliente) AS Cliente, Cliente.dniCliente AS 'DNI',
        Sexo = 
    CASE
        WHEN Cliente.sexoCliente = 'F' THEN 'FEMENIMO'
        WHEN Cliente.sexoCliente = 'M' THEN 'MASCULINO'
        END
    FROM Cliente
    WHERE Cliente.sexoCliente = @Sexo
END
/* EJECUTAR STORE PROCEDURE DE LISTADO DE CLIENTE POR SEXO*/
EXEC sp_ListClienteSexo @Sexo = F
GO

/* CREAR UN SP QUE PERMITA INGRESAR REGISTROS A LA TABLA GÉNERO */
CREATE PROCEDURE sp_AddGen
    @Codigo VARCHAR (4),
    @Nombre VARCHAR (MAX)
AS
BEGIN
    INSERT INTO Genero
        (idGenero,nomGenero)
    VALUES
        (@Codigo, @Nombre)
END
GO
/* AGREGAR EL GÉNERO COMEDIA */
EXEC sp_AddGen @Codigo = 6, @Nombre = 'Comedia'
GO

/* VERIFICAMOS QUE SE HAYA AGREGADO EL REGISTRO */
SELECT *
FROM Genero
GO

/* AGREGAR LOS GÉNEROS INFANTIL, OBRA LITERARIA Y DRAMA */
EXEC sp_AddGen @Codigo = 7, @Nombre = 'Infantil'
EXEC sp_AddGen @Codigo = 8, @Nombre = 'Obra Literaria'
EXEC sp_AddGen @Codigo = 9, @Nombre = 'Drama'
GO


/* ELABORAR UN SP QUE PERMITA VALIDAR EL CÓDIGO DE GÉNERO ANTES DE INGRESAR UN REGISTRO */
ALTER PROCEDURE sp_ValidAddReg
    @Codigo INT,
    @Nombre VARCHAR (MAX)
AS
BEGIN
    IF(SELECT Genero.idGenero
    FROM Genero
    WHERE Genero.idGenero = @Codigo) IS NOT NULL

    SELECT 'El Código ya Existe' AS 'Resultado'
    ELSE
    INSERT INTO Genero
        (idGenero, nomGenero)
    VALUES
        (@Codigo, @Nombre)

    INSERT INTO Genero
        (idGenero,nomGenero)
    VALUES
        (@Codigo, @Nombre);
    SELECT *
    FROM Genero
    ORDER BY idGenero
END
GO

/* VALIDAR INGRESO DE GENERO CON EL CODIGO 2 */
EXEC sp_ValidAddReg @Codigo =12, @Nombre = 'Cuento'
GO

/* ELIMINAR REGISTRO A TRAVÉS DE UN SP */
ALTER PROCEDURE SP_DelGen
    @Codigo VARCHAR (4)
AS
    BEGIN
    DELETE FROM Genero
        WHERE Genero.idGenero = @Codigo
    select *
    from Genero
END
GO

/* Ejecutar sp */
EXEC SP_DelGen @Codigo = 10
GO

ALTER PROCEDURE sp_ValidAddReg
    @Codigo INT,
    @Nombre VARCHAR (MAX)
AS
BEGIN
    IF(SELECT Genero.idGenero
    FROM Genero
    WHERE Genero.idGenero = @Codigo) IS NOT NULL

    SELECT 'El Código no existe' AS 'Resultado'
    ELSE
    INSERT INTO Genero
        (idGenero, nomGenero)
    VALUES
        (@Codigo, @Nombre)

    INSERT INTO Genero
        (idGenero,nomGenero)
    VALUES
        (@Codigo, @Nombre);
    SELECT *
    FROM Genero
    ORDER BY idGenero
END
GO

EXEC sp_ValidAddReg @Codigo =12, @Nombre = 'Cuento'
GO
