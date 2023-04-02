USE AdventureWorks2019;
GO

SELECT 
    [PersonType],
    -- [Title],
    [FirstName],
    -- [LastName],

    DENSE_RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonDenseRank,
    RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonRank,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonRow
FROM Person.Person
    ORDER BY PersonType, FirstName