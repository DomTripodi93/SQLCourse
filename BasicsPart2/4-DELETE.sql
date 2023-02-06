USE AdventureWorks2019;
GO

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.Department;

--DELETE  FROM HumanResources.Department
-- WHERE  Department.DepartmentID = 7;
SELECT  *
  FROM  HumanResources.EmployeeDepartmentHistory
 WHERE  EmployeeDepartmentHistory.DepartmentID = 7;

DELETE  HumanResources.EmployeeDepartmentHistory
 WHERE  EmployeeDepartmentHistory.DepartmentID = 7;

DELETE  FROM HumanResources.Department
 WHERE  Department.DepartmentID = 7;
GO

SELECT  *
  FROM  HumanResources.EmployeeDepartmentHistory
 WHERE  EmployeeDepartmentHistory.BusinessEntityID BETWEEN 1
                                                   AND     7;

DELETE  FROM HumanResources.EmployeeDepartmentHistory
 WHERE  EmployeeDepartmentHistory.BusinessEntityID BETWEEN 1
                                                   AND     7;

SELECT  *
  FROM  HumanResources.EmployeeDepartmentHistory;
GO