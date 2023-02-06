USE AdventureWorks2019;
GO

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.Department
 --ORDER BY [Department].[Name];
 --ORDER BY [Department].[GroupName];
 --ORDER BY [Department].[GroupName] DESC;
 --ORDER BY
 --   [Department].[GroupName]
 --   , [Department].[Name];
 --ORDER BY
 --   [Department].[GroupName]
 --   , [Department].[Name] DESC;
 --   , [Department].[Name];
 ORDER BY
    [Department].[GroupName] DESC
    , [Department].[Name];
GO