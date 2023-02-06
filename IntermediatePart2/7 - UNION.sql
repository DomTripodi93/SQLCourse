USE AdventureWorks2019;
GO

SELECT  [Department].[DepartmentID]
        , [Department].[Name] AS DepartmentName
        , [Department].[GroupName]
        , [Department].[ModifiedDate]
  FROM  [HumanResources].[Department]
--UNION
UNION ALL
SELECT  [Department].[DepartmentID] * 10
        , [Department].[Name]
        , [Department].[GroupName]
        , [Department].[ModifiedDate]
  FROM  [HumanResources].[Department]
UNION ALL
SELECT  [Department].[DepartmentID] * 100
        , [Department].[Name]
        , [Department].[GroupName]
        , [Department].[ModifiedDate]
  FROM  [HumanResources].[Department];
GO

DROP TABLE IF EXISTS dbo.DepartmentFromNewSource;

SELECT  [Department].[DepartmentID]
        , [Department].[Name] AS DepartmentName
        , 'Group: ' + [Department].[GroupName] AS GroupName
        , [Department].[GroupName] + ' - ' + [Department].[Name] AS DepartmentDescription
        , GETDATE () AS ModifiedDate
  INTO  dbo.DepartmentFromNewSource
  FROM  [HumanResources].[Department];

SELECT  [DepartmentFromNewSource].[DepartmentID]
        , [DepartmentFromNewSource].[DepartmentName]
        , [DepartmentFromNewSource].[GroupName]
        , [DepartmentFromNewSource].[DepartmentDescription]
        , [DepartmentFromNewSource].[ModifiedDate]
  FROM  dbo.DepartmentFromNewSource
UNION
SELECT  [Department].[DepartmentID]
        , [Department].[Name]
        , [Department].[GroupName]
        , '' AS DepartmentDescription
        , [Department].[ModifiedDate]
  FROM  [HumanResources].[Department];
GO