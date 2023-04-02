USE AdventureWorks2019;
GO

SELECT 
    [PersonType],
    -- [Title],
    [FirstName],
    -- [LastName],

    FIRST_VALUE(FirstName) OVER (PARTITION BY PersonType 
        ORDER BY PersonType DESC, FirstName DESC) AS LastPersonsName,
    LAST_VALUE(FirstName) OVER (PARTITION BY PersonType 
        ORDER BY PersonType, FirstName
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS LastPersonsName,
    -- LAST_VALUE(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS LastPersonsName, --Doesn't Work
    FIRST_VALUE(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS FirstPersonsName,
    -- LEAD(FirstName) OVER (ORDER BY PersonType, FirstName) AS NextPersonsNameNoPartition,
    LEAD(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS NextPersonsName,
    -- LAG(FirstName) OVER (ORDER BY PersonType, FirstName) AS LastPersonsNameNoPartition,
    LAG(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS LastPersonsName,
    NTILE(27) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonNTile,
    DENSE_RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonDenseRank,
    RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonRank,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonRow
FROM Person.Person
    ORDER BY PersonType, FirstName