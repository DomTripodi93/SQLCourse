USE AdventureWorks2019;
GO

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.Department
 --WHERE  Department.[Name] LIKE '%and%';
 --WHERE  Department.GroupName LIKE '%and%';
 --WHERE  Department.GroupName IN ('Research and Development', 'Sales and Marketing');
 --WHERE  Department.DepartmentID IN (1,2,3,4,9,10,11);
 WHERE  Department.DepartmentID BETWEEN 4
                                AND     12;
GO