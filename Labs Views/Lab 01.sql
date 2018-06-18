/* Muestrame el nombre, apellido, departamento, estado civil del empleado */
SELECT Person.FirstName as Nombre, Person.LastName as Apellido, HumanResources.Department.Name as Departamento, HumanResources.Employee.MaritalStatus as 'Estado Civil'
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
    INNER JOIN HumanResources.Employee
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID

/* Muestrame el listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012 */
SELECT CONCAT(Person.LastName, ',',Person.FirstName) AS Cliente,
Concat (MONTH(OrderDate),'/', YEAR(OrderDate)) as 'Mes y Año'
from Sales.SalesOrderHeader
inner join Sales.Customer 
ON Sales.SalesOrderHeader.CustomerID = Customer.CustomerID 
inner join Person.Person 
on Customer.PersonID = Person.BusinessEntityID
where YEAR (OrderDate) = 2012 AND (MONTH(OrderDate) BETWEEN 11 and 12)

/* Muestrame la cantidad de ordenes de pedido atentidos por cada medio de envio */

SELECT  Purchasing.ShipMethod.Name,
COUNT(Purchasing.ShipMethod.Name) as 'Cantidad'
FROM Sales.SalesOrderHeader
INNER JOIN Purchasing.ShipMethod
ON Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name

/* Mostrar la cantidad de ventas realizadas de acuerdo al país */

SELECT País = 
CASE
WHEN Sales.SalesTerritory.CountryRegionCode = 'AU' THEN 'Australia'
WHEN Sales.SalesTerritory.CountryRegionCode = 'US' THEN 'Estados Unidos'
WHEN Sales.SalesTerritory.CountryRegionCode = 'DE' THEN 'Alemania'
WHEN Sales.SalesTerritory.CountryRegionCode = 'FR' THEN 'Francia'
WHEN Sales.SalesTerritory.CountryRegionCode = 'GB' THEN 'Inglaterra'
WHEN Sales.SalesTerritory.CountryRegionCode = 'CA' THEN 'Canada'
ENd
,
Sales.SalesTerritory.Name as 'Estado' , 
COUNT(Sales.SalesOrderHeader.TerritoryID) 
FROM Sales.SalesOrderHeader
INNER JOIN Sales.SalesTerritory
ON Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
GROUP BY  Sales.SalesTerritory.CountryRegionCode, Sales.SalesTerritory.Name