USE [AdventureWorks2019];
GO

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
  FROM  [Person].[Person];
--WHERE  [Title] = '';
--WHERE  ISNULL ([Title], '') = '';
--WHERE  [Title] IS NULL;
--WHERE  NULLIF ([Title], '') IS NULL;
GO