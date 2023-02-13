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
  FROM  [Person].[Person]
 --WHERE [BusinessEntityID] = @MatchOn
 WHERE  CAST ([Person].[BusinessEntityID] AS VARCHAR(255)) = @MatchOn
        --OR [rowguid] = @MatchOn
        OR  CAST ([Person].[rowguid] AS VARCHAR(255)) = @MatchOn;
GO