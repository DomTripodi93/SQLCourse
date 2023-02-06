USE [AdventureWorks2019];
GO

SELECT  [Person].[BusinessEntityID]
        , [Person].[PersonType]
        , [Person].[NameStyle]
        , ISNULL ([Person].[Title], '') AS Title
        , [Person].[FirstName]
        , ISNULL ([Person].[MiddleName], 'No Middle Name') AS MiddleName
        , [Person].[LastName]
        --, ISNULL ([Person].[Suffix], '') AS [Suffix]
        , ISNULL ([Person].[Suffix], [Person].[Title]) AS [Suffix]
        , [Person].[EmailPromotion]
  --, [AdditionalContactInfo]
  --, [Demographics]
  --, [rowguid]
  --, [ModifiedDate]
  FROM  [Person].[Person]
 --WHERE [Title] <> 'Mr.';
 WHERE  ISNULL ([Title], '') <> 'Mr.';
GO