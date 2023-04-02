USE AdventureWorks2019;
GO

SELECT 
    [PersonType],
    -- [Title],
    [FirstName],
    -- [LastName],

    RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonRank,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonRow
FROM Person.Person
    ORDER BY PersonType, FirstName