USE AdventureWorks2019;
GO

SELECT  [EmployeeDepartmentHistory].[StartDate]
        , [EmployeeDepartmentHistory].[EndDate]
        , [Person].[Title]
        , [Person].[FirstName]
        , [Person].[MiddleName]
        , [Person].[LastName]
        , [Person].[Suffix]
  FROM  [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      --INNER JOIN [Person].[Person] AS [Person]
      --LEFT JOIN [Person].[Person] AS [Person]
      LEFT OUTER JOIN [Person].[Person] AS [Person]
          ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID];
--FROM  [Person].[Person] AS [Person]
--    --INNER JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
--    --JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
--    LEFT JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
--        ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID];

--[HumanResources].[EmployeeDepartmentHistory] JOIN / INNER JOIN [Person].[Person] --All Records that match in both tables
--[HumanResources].[EmployeeDepartmentHistory] LEFT JOIN / LEFT OUTER JOIN [Person].[Person] --All Records from the left table, and any matches from the right table
--[HumanResources].[EmployeeDepartmentHistory] RIGHT JOIN / LEFT OUTER JOIN [Person].[Person] -- ?
GO