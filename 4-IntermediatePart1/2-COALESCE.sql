USE [AdventureWorks2019];
GO

SELECT  [Person].[BusinessEntityID]
        , [Person].[PersonType]
        , [Person].[NameStyle]
        , ISNULL ([Person].[Title], '') AS Title
        , [Person].[FirstName]
        , ISNULL ([Person].[MiddleName], 'No Middle Name') AS MiddleName
        , [Person].[LastName]
        --, ISNULL ([Person].[Suffix], [Person].[Title]) AS [Suffix]
        , COALESCE([Person].[Suffix], [Person].[Title], '')  AS [Suffix]
        , [Person].[EmailPromotion]
  FROM  [Person].[Person]
 --WHERE  ISNULL ([Title], '') <> 'Mr.';
 --WHERE  ISNULL ([Person].[Suffix], [Person].[Title]) <> 'Mr.';
 WHERE  COALESCE([Person].[Suffix], [Person].[Title], '') <> 'Mr.';
GO