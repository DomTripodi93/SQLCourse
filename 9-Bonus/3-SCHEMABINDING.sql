USE AdventureWorks2019
GO

CREATE OR ALTER   VIEW [HumanResources].[vwEmployeePayRate]
/*
    EXEC HumanResources.spEmployeePayRate_Get
    SELECT * FROM  HumanResources.vwEmployeePayRate WHERE FirstName = 'Diane'
*/
WITH SCHEMABINDING
AS
    -- SELECT [MostRecentPayRate].[Rate],
    --     [Person].[BusinessEntityID],
    --     [Person].[PersonType],
    --     [Person].[NameStyle],
    --     [Person].[Title],
    --     [Person].[FirstName],
    --     [Person].[MiddleName],
    --     [Person].[LastName],
    --     [Person].[Suffix],
    --     [Person].[EmailPromotion],
    --     [Person].[AdditionalContactInfo],
    --     [Person].[Demographics],
    --     [Person].[rowguid],
    --     [Person].[ModifiedDate] 
    -- FROM (
    --     SELECT EmployeePayHistory.Rate
    --         , ROW_NUMBER() OVER (PARTITION BY EmployeePayHistory.BusinessEntityID 
    --             ORDER BY EmployeePayHistory.ModifiedDate DESC) AS IsMostRecent
    --         , EmployeePayHistory.BusinessEntityID
    --     FROM HumanResources.EmployeePayHistory
    --     -- WHERE EmployeePayHistory.BusinessEntityID = Person.BusinessEntityID --4
    -- ) MostRecentPayRate
    --     LEFT JOIN Person.Person
    --         ON MostRecentPayRate.BusinessEntityID = Person.BusinessEntityID
    --     WHERE IsMostRecent = 1

    -- DROP TABLE IF EXISTS #MostRecentPayRate

    -- -- IF OBJECT_ID('tempdb..#MostRecentPayRate') IS NOT NULL
    -- --     DROP TABLE #MostRecentPayRate
    WITH MostRecentPayRateCTE AS (
        SELECT MostRecentPayRate.Rate, 
            MostRecentPayRate.BusinessEntityID 
            -- INTO #MostRecentPayRate
            FROM (
                SELECT EmployeePayHistory.Rate
                    , ROW_NUMBER() OVER (PARTITION BY EmployeePayHistory.BusinessEntityID 
                        ORDER BY EmployeePayHistory.ModifiedDate DESC) AS IsMostRecent
                    , EmployeePayHistory.BusinessEntityID
                FROM HumanResources.EmployeePayHistory
                -- WHERE EmployeePayHistory.BusinessEntityID = Person.BusinessEntityID --4
            ) MostRecentPayRate
                WHERE IsMostRecent = 1
    )
    SELECT MostRecentPayRateCTE.[Rate],
        [Person].[BusinessEntityID],
        [Person].[PersonType],
        [Person].[NameStyle],
        [Person].[Title],
        [Person].[FirstName],
        [Person].[MiddleName],
        [Person].[LastName],
        [Person].[Suffix],
        [Person].[EmailPromotion],
        [Person].[AdditionalContactInfo],
        [Person].[Demographics],
        [Person].[rowguid],
        [Person].[ModifiedDate]
        -- Person.DummyField
    FROM Person.Person
        JOIN MostRecentPayRateCTE
            ON MostRecentPayRateCTE.BusinessEntityID = Person.BusinessEntityID

    -- SELECT * FROM MostRecentPayRateCTE

    -- -- SELECT BusinessEntityID, COUNT(*) FROM #MostRecentPayRate GROUP BY BusinessEntityID ORDER BY COUNT(*) DESC 

    -- CREATE CLUSTERED INDEX cix_MostRecentPayRate_BusinessEntityID ON #MostRecentPayRate(BusinessEntityID)
GO

-- ALTER TABLE  Person.Person ADD DummyField VARCHAR(255)
ALTER TABLE  Person.Person DROP COLUMN DummyField 
-- SELECT * FROM HumanResources.vwEmployeePayRate