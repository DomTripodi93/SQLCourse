USE AdventureWorks2019;
GO

SELECT  [EmployeeDepartmentHistory].[StartDate]
        , [EmployeeDepartmentHistory].[EndDate]
        , [Person].[Title]
        , [Person].[FirstName]
        , [Person].[MiddleName]
        , [Person].[LastName]
        , [Person].[Suffix]
  --FROM  [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
  --    --INNER JOIN [Person].[Person] AS [Person]
  --    --LEFT JOIN [Person].[Person] AS [Person]
  --    --LEFT OUTER JOIN [Person].[Person] AS [Person]
  --    RIGHT JOIN [Person].[Person] AS [Person]
  --        ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID];
  FROM  [Person].[Person] AS [Person]
      --INNER JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      --JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      --LEFT JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      --RIGHT JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      --RIGHT OUTER JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      FULL OUTER JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
          ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID];

DROP TABLE IF EXISTS dbo.TestMissingDepartment;

SELECT  [Department].[DepartmentID]
        , [Department].[Name]
        , [Department].[GroupName]
        , [Department].[ModifiedDate]
  INTO  dbo.TestMissingDepartment
  FROM  [HumanResources].[Department];

INSERT INTO dbo.TestMissingDepartment ([Name]
                                       , [GroupName]
                                       , [ModifiedDate])
VALUES ('Missing Department', 'Missing Group', GETDATE ());

DELETE  FROM [dbo].[TestMissingDepartment]
 WHERE  [TestMissingDepartment].[DepartmentID] = 1;

SELECT  *
  FROM  [dbo].[TestMissingDepartment]
      --FULL OUTER JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      FULL JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
          ON [TestMissingDepartment].[DepartmentID] = [EmployeeDepartmentHistory].[DepartmentID];

--[HumanResources].[EmployeeDepartmentHistory] JOIN / INNER JOIN [Person].[Person] --All Records that match in both tables
--[HumanResources].[EmployeeDepartmentHistory] LEFT JOIN / LEFT OUTER JOIN [Person].[Person] --All Records from the left table, and any matches from the right table
--[HumanResources].[EmployeeDepartmentHistory] RIGHT JOIN / LEFT OUTER JOIN [Person].[Person] --All Records from the right table, and any matches from the left table
--[HumanResources].[EmployeeDepartmentHistory] FULL JOIN / FULL OUTER JOIN [Person].[Person] --All Records that exist in EITHER tables
GO