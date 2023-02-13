USE AdventureWorks2019;
GO

--SELECT  [DepartmentID]
--        , [Name]
--        , [GroupName]
--        , [ModifiedDate]
--  FROM  HumanResources.Department

SELECT  [DepartmentID]
        , [GroupName]
  FROM  HumanResources.Department;

SELECT  MAX(DepartmentID)
		, MIN(DepartmentID)
		, AVG(DepartmentID)
		, SUM(DepartmentID)
		, COUNT(*)
  FROM  HumanResources.Department;

SELECT  [GroupName]
		, MAX(DepartmentID)
		, MIN(DepartmentID)
		, AVG(DepartmentID)
		, SUM(DepartmentID)
		, COUNT(*)
  FROM  HumanResources.Department
  GROUP BY [GroupName];
GO