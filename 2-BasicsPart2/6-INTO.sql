USE AdventureWorks2019;
GO

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  INTO  HumanResources.DepartmentCopy
  FROM  HumanResources.Department
 WHERE  [Department].[GroupName] = 'Research and Development';

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.DepartmentCopy;
GO