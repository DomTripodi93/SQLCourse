USE AdventureWorks2019
GO

DECLARE @SearchValue NVARCHAR(255)

SET @SearchValue = '3'
-- SET @SearchValue = '92c4279f-1207-48a3-8448-4636514eb7e2'

SELECT[Person].[PersonType],
    [Person].[FirstName],
    [Person].[LastName],
     Person.BusinessEntityID,
     Person.rowguid
FROM Person.Person AS Person
    WHERE CAST(Person.BusinessEntityID AS NVARCHAR(255)) = @SearchValue
        OR CAST(Person.rowguid AS NVARCHAR(255)) = @SearchValue
    -- WHERE BusinessEntityID  = @SearchValue