use AdventureWorks2016

SELECT ModifiedDate, City  FROM Person.Address
where year(ModifiedDate) = '2014' AND
MONTH(ModifiedDate) = '01' and 
city = 'Beaverton'


select AddressLine2 FROM Person.Address
WHERE AddressLine2 like 'B%'

SELECT * from Person.Person
WHERE LastName = 'Miller'



SELECT * FROM HumanResources.Employee where not Gender = 'M'


SELECT BusinessEntityID, FirstName, LastName
from Person.Person
WHERE FirstName in ('Michael')

SELECT BusinessEntityID, JobTitle FROM HumanResources.Employee WHERE BusinessEntityID >= '10' and BusinessEntityID <='20'
or JobTitle like 'V%'