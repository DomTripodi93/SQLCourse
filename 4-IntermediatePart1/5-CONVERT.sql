USE [AdventureWorks2019];
GO

--DECLARE @MatchOn VARCHAR(255) = 'C45E8AB8-01BE-4B76-B215-820C8368181A' --rowguid
DECLARE @MatchOn VARCHAR(255) = '7'; --BusinessEntityId

SELECT  [Person].[BusinessEntityID]
        , [Person].[PersonType]
        , [Person].[NameStyle]
        , ISNULL ([Person].[Title], '') AS Title
        , ISNULL (NULLIF ([Person].[Title], 'Mr.'), '') AS Title
        , NULLIF ([Person].[Title], 'Mr.') AS Title
        , [Person].[FirstName]
        , ISNULL ([Person].[MiddleName], 'No Middle Name') AS MiddleName
        , [Person].[LastName]
                                                                --, ISNULL ([Person].[Suffix], [Person].[Title]) AS [Suffix]
        , COALESCE ([Person].[Suffix], [Person].[Title], '') AS [Suffix]
        , [Person].[EmailPromotion]
        , [Person].[rowguid]
        , [Person].[ModifiedDate]
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 101)  --mm/dd/yyyy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 1)    --mm/dd/yy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 110)  --mm-dd-yyyy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 10)   --mm-dd-yy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 103)  --dd/mm/yyyy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 3)    --dd/mm/yy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 105)  --dd-mm-yyyy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 5)    --dd-mm-yy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 111)  --dd-mm-yy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 11)   --dd-mm-yy
        , CONVERT (VARCHAR(100), [Person].[ModifiedDate], 23)   --dd-mm-yy
        , CONVERT (VARCHAR(100), CAST (12345.7500 AS MONEY), 0)
        , CONVERT (VARCHAR(100), CAST (12345.7500 AS MONEY), 1)
        , CONVERT (VARCHAR(100), CAST (12345.7500 AS MONEY), 2)
  FROM  [Person].[Person]
 --WHERE [BusinessEntityID] = @MatchOn
 WHERE  CONVERT (VARCHAR(255), [Person].[BusinessEntityID]) = @MatchOn
        --OR [rowguid] = @MatchOn
        OR  CONVERT (VARCHAR(255), [Person].[rowguid]) = @MatchOn;
GO