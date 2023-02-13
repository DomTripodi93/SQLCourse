USE AdventureWorks2019;
GO

--SELECT  [DepartmentID]
--        , [Name]
--        , [GroupName]
--        , [ModifiedDate]
--  FROM  HumanResources.Department

SELECT  [GroupName]
  FROM  HumanResources.Department;

SELECT  DISTINCT
        [GroupName]
  FROM  HumanResources.Department;
GO