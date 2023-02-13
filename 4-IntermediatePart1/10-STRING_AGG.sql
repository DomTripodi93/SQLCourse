USE AdventureWorks2019;
GO

SELECT  Department.DepartmentID
        , Department.[Name]
        , Department.GroupName
        , Department.ModifiedDate
  FROM  HumanResources.Department;

SELECT  STRING_AGG (Department.[Name], ', ') AS DepartmentsInGroup
        , Department.GroupName
  FROM  HumanResources.Department
 GROUP BY Department.GroupName;
GO