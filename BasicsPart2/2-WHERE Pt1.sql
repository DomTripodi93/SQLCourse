USE AdventureWorks2019;
GO

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.Department
 --WHERE Department.GroupName = 'Executive General and Administration';
 --WHERE Department.DepartmentID > 10;
 --WHERE Department.DepartmentID < 10;
 --WHERE Department.DepartmentID <> 10;
 --WHERE  Department.GroupName <> 'Executive General and Administration'
 WHERE  Department.GroupName <> 'Executive General and Administration'
        AND Department.DepartmentID > 10;
GO