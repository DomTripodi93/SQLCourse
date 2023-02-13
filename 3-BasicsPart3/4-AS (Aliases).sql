USE [AdventureWorks2019];
GO

--SELECT  [DepartmentID]
--        , [Name]
--        , [GroupName]
--        , [ModifiedDate]
--  FROM  HumanResources.Department

SELECT  [GroupName]
        , MAX ([DepartmentID])
        , MIN ([DepartmentID])
        , AVG ([DepartmentID])
        , SUM ([DepartmentID])
        , COUNT (*)
  FROM  [HumanResources].[Department]
 GROUP BY [GroupName];

SELECT  [GroupName]
        , MAX ([DepartmentID]) AS [MaxDeptId]
        , MIN ([DepartmentID]) AS [MinDeptId]
        , AVG ([DepartmentID]) AS [AvgDeptId]
        , SUM ([DepartmentID]) AS [SumOfDeptIds]
        , COUNT (*) AS [CountDepartments]
  FROM  [HumanResources].[Department]
 GROUP BY [GroupName];

SELECT  [DeptInfo].[DepartmentID]
        , [DeptInfo].[Name]
        , [DeptInfo].[GroupName]
        , [DeptInfo].[ModifiedDate]
  FROM  [HumanResources].[Department] AS [DeptInfo];

SELECT  [Department].[DepartmentID]
        , [Department].[Name]
        , [Department].[GroupName]
        , [Department].[ModifiedDate]
  FROM  [HumanResources].[Department] AS [Department];
GO