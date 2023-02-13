USE AdventureWorks2019;
GO

SELECT  TOP 1
        [Department].[DepartmentID]
        , [Department].[Name]
        , [Department].[GroupName]
        , [Department].[ModifiedDate]
  FROM  HumanResources.Department;
GO