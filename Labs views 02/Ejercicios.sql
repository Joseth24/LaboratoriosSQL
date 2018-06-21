/* Listar el nombre del autor, el libro que a escrito, el género y país respectivo en una vista llamada vwDatosAutor  */
CREATE VIEW vw_Datos
as
    SELECT Libro.tituloLibro as 'Titulo del Libro', Autor.nomAutor as'Nombre del Autor',
        Autor.apeAutor as 'Apellido del Autor',
        Genero.nomGenero, Pais.nomPais
    FROM Libro
        INNER JOIN Autor on Libro.Autor_idAutor = Autor.idAutor
        INNER JOIN Genero on Libro.Genero_idGenero = Genero.idGenero
        INNER JOIN Pais on Libro.Pais_idPais = Pais.idPais
go
SELECT *
FROM vw_Datos
GO
/* Listar la cantidad de libros por género */
CREATE view vwGenLib
as
    SELECT COUNT(Libro.Genero_idGenero) as Total, Genero.nomGenero
    FROM Libro
        INNER JOIN Genero on Libro.Genero_idGenero = Genero.idGenero
    GROUP BY Genero.nomGenero
GO

SELECT *
FROM vwGenLib
GO

/* Listado de la cantidad de libros por país */

CREATE view vwGenLibPais
as
    SELECT COUNT(Libro.Pais_idPais) as Total, Pais.nomPais
    FROM Libro
        INNER JOIN Pais on Libro.Pais_idPais = Pais.idPais
    GROUP BY Pais.nomPais
GO
SELECT *
FROM vwGenLibPais
GO

SELECT *
FROM Prestamos
GO

/*  */
CREATE VIEW vw_DatosPrestamo
as
    SELECT Prestamos.fecsalPrestamo as 'Fecha de Prestamo', Bibliotecario.nomBibliotecario as 'Bibliotecario',
        Libro.tituloLibro as 'Libro', Cliente.nomCliente as 'Cliente'
    FROM Prestamos
        INNER JOIN Bibliotecario on Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
        INNER JOIN Detalle_Prestamo on Prestamos.idPrestamo = Detalle_Prestamo.Prestamos_idPrestamo
        INNER JOIN Libro on Detalle_Prestamo.Libro_idLibro = Libro.idLibro
        INNER JOIN Cliente on Prestamos.Cliente_idCliente = Cliente.idCliente
GO

SELECT *
FROM vw_DatosPrestamo 
GO