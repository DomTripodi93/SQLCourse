USE AdventureWorks2019
GO

SELECT [FirstName],
    [MiddleName],
    [LastName],
    CASE 
        -- WHEN MiddleName IS NOT NULL
        WHEN (MiddleName IS NOT NULL) 
            THEN 
                CASE WHEN MiddleName = 'A'
                    THEN 2
                    ELSE 1 
                END
        ELSE 0
    END,
    CASE 
        -- WHEN MiddleName IS NOT NULL
        WHEN MiddleName = 'A'
            THEN 2
        WHEN (MiddleName IS NOT NULL) 
            THEN 1 
    END,
    CASE 
        WHEN (MiddleName IS NOT NULL) 
            THEN 1 
        ELSE 0
    END AS HasMiddleName
FROM Person.Person


SELECT 
    SUM(CASE 
        WHEN (MiddleName IS NOT NULL) 
            THEN 1 
        ELSE 0
    END) AS HasMiddleName
    , SUM(CASE 
        WHEN (MiddleName IS NULL) 
            THEN 1 
        ELSE 0
    END) AS HasNoMiddleName
FROM Person.Person

--11473

SELECT
    COUNT(*)  
FROM Person.Person 
    WHERE MiddleName IS NOT NULL