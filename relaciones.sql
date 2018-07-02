/* Familiares y Empleados */
CREATE VIEW vw_FamiEmpl
AS
SELECT NomFami, Ape, Par, Ocu ,Tel,Estado,Empleado.Nom,Empleado.ApelPate
FROM Familiares
INNER JOIN Empleado on Familiares.Empleado_idEmpl = Empleado.idEmpl
WHERE Estado like 'Inactivo'
GO
SELECT * FROM vw_FamiEmpl
GO

/* Emergencia y Empleado */
CREATE VIEW vw_EmerEmpl
AS
SELECT NomEmer, Ape, Paren,Celular, Estado, Empleado.Nom, Empleado.ApelPate
FROM Emergencia
INNER JOIN Empleado ON Emergencia.Empleado_idEmpl = Empleado.idEmpl
WHERE Estado like 'Activo'
GO
select * from vw_EmerEmpl
GO
/*  */
SELECT * FROM EstudiosBasicos