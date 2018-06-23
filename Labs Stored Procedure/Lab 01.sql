--- Ver la configuración de idioma del servidor---
SELECT @@LANGUAGE
GO
 
--- Ver formato de fecha de acuerdo al idioma ---
EXEC sp_helplanguage
GO 

/* visualiza base de datos del servidor */
EXEC sp_databases;

/* Visualiza los SP de la BD */
EXEC sp_stored_procedures;

/* Listar tablas y vistas de una base de datos activa */
EXEC sp_tables
GO
/* Mi primer procedimiento almacenado (Sumas) */
CREATE PROCEDURE sp_SumNum
    @VarUno INT = 0,
    @VarDos INT = 0,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno + @VarDos
    SELECT @Suma
END
GO
/* Ejecutamos el Procedimiento ALmacenado */
EXEC sp_SumNum
 GO

/* Modificar el Procedimiento Almacenado */
ALTER PROCEDURE sp_SumNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno + @VarDos
    SELECT @Suma AS 'Resultado'
END
GO

/* Ejecutamos el Procedimiento ALmacenado */
EXEC sp_SumNum
GO

/* Mi Segundo procedimiento almacenado (Multiplicar) */
CREATE PROCEDURE sp_MulNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno * @VarDos
    SELECT @Suma AS 'Resultado'
END
GO

/* Ejecutamos el Procedimienot Almacenado */
EXEC sp_MulNum
GO

/* Elimanamos el Procedimienot ALmacenado */
DROP PROCEDURE sp_SumNum2
GO

/* Elaborar un SP que permita ingresar 2 números y devuelva la sumatoria de ellos */
CREATE PROCEDURE sp_SumNum2
    @VarUno INT ,
    @VarDos INT ,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno + @VarDos
    SELECT @Suma AS 'Resultado'
END
GO

/* Ejecutamos el Procedimienot Almacenado */
EXEC sp_SumNum2 @VarUno = 30, @VarDos = 60
GO

/* Elaborar un SP que permita ingresar 2 números y devuelva la Multiplicación  de ellos */
CREATE PROCEDURE sp_MulNum2
    @VarUno INT ,
    @VarDos INT ,
    @Multiplicación INT = 0
AS
BEGIN
    SET @Multiplicación = @VarUno * @VarDos
    SELECT @Multiplicación AS 'Resultado'
END
GO

/* Ejecutamos el Procedimienot Almacenado */
EXEC sp_MulNum2 @VarUno = 30, @VarDos = 60
GO

/* Elaborar un SP que permita ingresar dos números y devolver el mayor de ellos */
CREATE PROCEDURE sp_Evaluar
    @NumUno INT ,
    @NumDos INT
AS
BEGIN
    IF @NumUno > @NumDos
        SELECT  @NumUno AS 'Número mayor'
    ELSE 
        SELECT  @NumDos AS 'Número mayor'
END
GO

/* Comparando números */
EXEC sp_Evaluar @NumUno = 80, @NumDos = 80
GO

/* Elaborar un SP que permita comparar dos números si son iguales o si son diferentes devolver el mayor */
CREATE PROCEDURE sp_Comparar
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos 
            PRINT 'Los números son iguales'
        ELSE
            IF @NumUno > @NumDos
                SELECT @NumUno AS 'Número mayor'
            ELSE
                SELECT @NumDos AS 'Número mayor'
    END
GO
 
/* Ejecutamos el Procedimienot Almacenado */
EXEC sp_Comparar @NumUno = 800, @NumDos = 80
EXEC sp_Comparar @NumUno = 800, @NumDos = 800
GO

/* Elaborar un SP que permita enumerar una debida cantidad de números */
CREATE PROCEDURE sp_Evaluar2
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos
            PRINT 'Los números son iguales'
        ELSE 
            IF @NumUno > @NumDos
                SELECT @NumUno AS 'Número Mayor',
                @NumDos AS 'Número Menor'
            ELSE 
                SELECT @NumDos AS 'Número mayor',
                @NumDos AS 'Número Menor'
    END
GO
/* Ejecutamos el SP */
EXEC sp_Evaluar2 @NumUno = 40, @NumDos = 80
GO

/* Elaborar un SP que permita enumerar una debida cantida de números */
CREATE PROCEDURE sp_Listar
    @Num INT,
    @Inicio INT = 0
AS
    BEGIN
        WHILE (@Inicio < @Num)
            BEGIN
                SET @Inicio = @Inicio + 1
                PRINT @Inicio
            END
    END
GO

/* Listar 5 Números */            
EXEC sp_Listar @Num = 5
GO

/* Elaborar un SP que permita repetir el mensaje "RETROCEDER NUNCA, RENDIRSE JAMAS"
de acuerdo a un número que ha sido ingresado */
CREATE PROCEDURE sp_Frase
    @Num INT,
    @Inicio INT = 0
AS
    BEGIN
        WHILE (@Inicio < @Num)
            BEGIN
                SET @Inicio = @Inicio + 1
                PRINT 'RETROCEDER NUNCA, RENDIRSE JAMAS'
            END
    END
GO

/* Ejecutamos el SP */            
EXEC sp_Frase @Num = 5
GO

/* Elaborar un SP que permita ingresar un nombre y devuelva un mensaje de saludo con 
el mismo nombre */
CREATE PROCEDURE sp_Saludo
    @Nombre VARCHAR(40)
AS
    BEGIN 
        PRINT 'Hola ' + @Nombre 
    END
GO

/* Provando el SP Saludo */
EXEC sp_Saludo @Nombre = Manuel
GO

/* Elaborar un SP que permita ingresar un nombre y una fecha de nacimiento */
CREATE PROCEDURE sp_NomFecNac
    @Nombre VARCHAR(40),
    @FecNac DATE
AS 
    BEGIN
        SELECT @Nombre as Nombre, @FecNac AS 'Fecha de Naciminento'
    END
GO

/* Probando SP Ingresar no,mbre y fecha de nacimiento */ 
EXEC sp_NomFecNac @Nombre = 'Joseth Anthonny', @FecNac = '09/24/2001'
GO

/* Elaborar un SP que permita ingresar un nombre y fecha de nacimiento en formato dd/mm/yyyy */
CREATE PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS 
    BEGIN
        SELECT @Nombre as Nombre,
        CONVERT(date, @FecNac, 103) AS 'Fecha de Nacimiento'
    END
GO

/* Probando SP Ingresar no,mbre y fecha de nacimiento */ 
EXEC sp_NomFecNac2 @Nombre = 'Joseth Anthonny', @FecNac = '24/09/2001'
GO

/* Modificanod el SP */
ALTER PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS 
    BEGIN
        SELECT @Nombre as Nombre,
        FORMAT( CONVERT(date, @FecNac, 103),'dd/MM/yyyy','en-gb') AS 'Fecha de Nacimiento'
    END
GO
/* Probando SP Ingresar no,mbre y fecha de nacimiento */ 
EXEC sp_NomFecNac2 @Nombre = 'Joseth Anthonny', @FecNac = '24/09/2001'
GO

/* Elaborar un SP que permita ingresar un nombre, una fecha de nacimiento y devuelva 
los mismos datos más la edad */
CREATE PROCEDURE sp_NomFecNac3
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS 
    BEGIN
        SELECT @Nombre as Nombre,
        FORMAT( CONVERT(date, @FecNac, 103),'dd/MM/yyyy','en-gb') AS 'Fecha de Nacimiento',
        DATEDIFF(YEAR, CONVERT(date, @FecNac, 103), GETDATE())AS 'Edad'
    END
GO

/* Probando SP Ingresar no,mbre y fecha de nacimiento */ 
EXEC sp_NomFecNac3 @Nombre = 'Joseth Anthonny', @FecNac = '24/09/2001'
GO