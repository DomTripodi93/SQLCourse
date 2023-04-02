USE AdventureWorks2019;
GO

SELECT 
    [PersonType],
    [Title],
    [FirstName],
    [LastName],
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName)
FROM Person.Person
    ORDER BY PersonType, FirstName