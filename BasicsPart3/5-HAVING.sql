USE [AdventureWorks2019];
GO

--SELECT  [DepartmentID]
--        , [Name]
--        , [GroupName]
--        , [ModifiedDate]
--  FROM  HumanResources.Department

SELECT  [Department].[GroupName]
        , MAX ([Department].[DepartmentID]) AS [MaxDeptId]
        , MIN ([Department].[DepartmentID]) AS [MinDeptId]
        , AVG ([Department].[DepartmentID]) AS [AvgDeptId]
        , SUM ([Department].[DepartmentID]) AS [SumOfDeptIds]
        , COUNT (*) AS [CountDepartments]
        , STRING_AGG ([Department].[Name], ',') AS [DepartmentNames]
  FROM  [HumanResources].[Department]
 GROUP BY [Department].[GroupName]
--WHERE COUNT (*) < 3;
--WHERE [CountDepartments] < 3;
HAVING  COUNT (*) < 3;
GO