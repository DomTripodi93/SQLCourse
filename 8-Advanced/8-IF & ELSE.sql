USE AdventureWorks2019
GO

ALTER PROCEDURE HumanResources.spEmployeePayRate_Get
/*
    EXEC  HumanResources.spEmployeePayRate_Get
*/
AS
BEGIN
    -- SELECT EmployeePayHistory.Rate
    --     , ROW_NUMBER() OVER (PARTITION BY EmployeePayHistory.BusinessEntityID 
    --         ORDER BY EmployeePayHistory.ModifiedDate DESC) AS IsMostRecent
    --  FROM HumanResources.EmployeePayHistory
    -- WHERE EmployeePayHistory.BusinessEntityID = 4


    -- SELECT MostRecentPayRate.Rate, * FROM Person.Person
    --     CROSS APPLY (
    --         SELECT EmployeePayHistory.Rate
    --             , ROW_NUMBER() OVER (PARTITION BY EmployeePayHistory.BusinessEntityID 
    --                 ORDER BY EmployeePayHistory.ModifiedDate DESC) AS IsMostRecent
    --             , EmployeePayHistory.BusinessEntityID
    --         FROM HumanResources.EmployeePayHistory
    --         WHERE EmployeePayHistory.BusinessEntityID = Person.BusinessEntityID --4
    --     ) MostRecentPayRate
    --     WHERE MostRecentPayRate.IsMostRecent = 1


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
    --     [Person].[ModifiedDate] FROM (
    --         SELECT EmployeePayHistory.Rate
    --             , ROW_NUMBER() OVER (PARTITION BY EmployeePayHistory.BusinessEntityID 
    --                 ORDER BY EmployeePayHistory.ModifiedDate DESC) AS IsMostRecent
    --             , EmployeePayHistory.BusinessEntityID
    --         FROM HumanResources.EmployeePayHistory
    --         -- WHERE EmployeePayHistory.BusinessEntityID = Person.BusinessEntityID --4
    --     ) MostRecentPayRate
    --         LEFT JOIN Person.Person
    --             ON MostRecentPayRate.BusinessEntityID = Person.BusinessEntityID
    --         WHERE IsMostRecent = 1

    DROP TABLE IF EXISTS #MostRecentPayRate

    -- IF OBJECT_ID('tempdb..#MostRecentPayRate') IS NOT NULL
    --     DROP TABLE #MostRecentPayRate

    SELECT MostRecentPayRate.Rate, 
        MostRecentPayRate.BusinessEntityID 
        INTO #MostRecentPayRate
        FROM (
            SELECT EmployeePayHistory.Rate
                , ROW_NUMBER() OVER (PARTITION BY EmployeePayHistory.BusinessEntityID 
                    ORDER BY EmployeePayHistory.ModifiedDate DESC) AS IsMostRecent
                , EmployeePayHistory.BusinessEntityID
            FROM HumanResources.EmployeePayHistory
            -- WHERE EmployeePayHistory.BusinessEntityID = Person.BusinessEntityID --4
        ) MostRecentPayRate
            WHERE IsMostRecent = 1

    -- SELECT BusinessEntityID, COUNT(*) FROM #MostRecentPayRate GROUP BY BusinessEntityID ORDER BY COUNT(*) DESC 

    CREATE CLUSTERED INDEX cix_MostRecentPayRate_BusinessEntityID ON #MostRecentPayRate(BusinessEntityID)


    DECLARE @CountInMostRecentPayRate INT 

    SELECT @CountInMostRecentPayRate = COUNT(*) FROM #MostRecentPayRate

    IF @CountInMostRecentPayRate > 400
        BEGIN
            PRINT('Greater than 400')
        END
        ELSE IF @CountInMostRecentPayRate > 300
        BEGIN
            PRINT('Greater than 300')
        END
        ELSE
        BEGIN
            PRINT('Not Greater than 300')
        END


    SELECT [#MostRecentPayRate].[Rate],
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
    FROM Person.Person
        JOIN #MostRecentPayRate
            ON #MostRecentPayRate.BusinessEntityID = Person.BusinessEntityID
END