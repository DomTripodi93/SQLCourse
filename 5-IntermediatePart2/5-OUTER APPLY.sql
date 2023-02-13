USE AdventureWorks2019;
GO

SELECT  *
  FROM  [HumanResources].[Department]
      LEFT JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
          ON [EmployeeDepartmentHistory].[DepartmentID] = [Department].[DepartmentID];

SELECT  *
  FROM  [HumanResources].[Department]
      --LEFT JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
          ON [EmployeeDepartmentHistory].[DepartmentID] = [Department].[DepartmentID]
 WHERE  [Department].[Name] = 'Sales';

SELECT  *
  FROM  [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
 WHERE  [EmployeeDepartmentHistory].[DepartmentID] = 3;

SELECT  [EmployeeDepartmentHistory].[DepartmentID]
        , [Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName] AS FullName
  FROM  [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      JOIN [Person].[Person]
          ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID]
 WHERE  [EmployeeDepartmentHistory].[DepartmentID] = 3;

SELECT  [EmployeeDepartmentHistory].[DepartmentID]
        , STRING_AGG ([Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName], '; ') AS FullNames
  FROM  [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      JOIN [Person].[Person]
          ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID]
 --WHERE  [EmployeeDepartmentHistory].[DepartmentID] = 3
 GROUP BY [EmployeeDepartmentHistory].[DepartmentID];

--SELECT  [EmployeeDepartmentHistory].[DepartmentID]
SELECT  TOP 1
        [EmployeeDepartmentHistory].[DepartmentID]
        , [Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName] AS FullName
        , [EmployeeDepartmentHistory].[StartDate]
  FROM  [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      JOIN [Person].[Person]
          ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID]
 WHERE  [EmployeeDepartmentHistory].[DepartmentID] = 5
 ORDER BY [EmployeeDepartmentHistory].[StartDate];

SELECT  *
  FROM  [HumanResources].[Department]
      --OUTER APPLY ()  AS EmployeesInDepartment
      --OUTER APPLY ()  AS FirstEmployeeInDepartment
      OUTER APPLY (
                      SELECT    STRING_AGG ([Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName], '; ') AS PeopleInDepartment
                        FROM    [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
                            JOIN [Person].[Person]
                                ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID]
                       WHERE [EmployeeDepartmentHistory].[DepartmentID] = [Department].[DepartmentID]
                       GROUP BY [EmployeeDepartmentHistory].[DepartmentID]
                  ) AS EmployeesInDepartment
      OUTER APPLY (
                      SELECT    TOP 1
                                [Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName] AS FirstPersonInDepartment
                                , [EmployeeDepartmentHistory].[StartDate] AS FirstPersonStartDate
                        FROM    [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
                            JOIN [Person].[Person]
                                ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID]
                       WHERE [EmployeeDepartmentHistory].[DepartmentID] = [Department].[DepartmentID]
                       ORDER BY [EmployeeDepartmentHistory].[StartDate]
                  ) AS FirstEmployeeInDepartment;

SELECT  *
  FROM  [HumanResources].[Department]
      --OUTER APPLY ()  AS EmployeesInDepartment
      --OUTER APPLY ()  AS FirstEmployeeInDepartment
      OUTER APPLY (
                      SELECT --STRING_AGG ([Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName], '; ') AS PeopleInDepartment
                            [Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName] AS FullName
                        FROM    [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
                            JOIN [Person].[Person]
                                ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID]
                       WHERE [EmployeeDepartmentHistory].[DepartmentID] = [Department].[DepartmentID]
                  --GROUP BY [EmployeeDepartmentHistory].[DepartmentID]
                  ) AS EmployeesInDepartment
      OUTER APPLY (
                      SELECT --TOP 1
                            [Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName] AS FirstPersonInDepartment
                            , [EmployeeDepartmentHistory].[StartDate] AS FirstPersonStartDate
                        FROM    [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
                            JOIN [Person].[Person]
                                ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID]
                       WHERE [EmployeeDepartmentHistory].[DepartmentID] = [Department].[DepartmentID]
                  --ORDER BY [EmployeeDepartmentHistory].[StartDate]
                  ) AS FirstEmployeeInDepartment;

--[HumanResources].[Department] OUTER APPLY [HumanResources].[EmployeeDepartmentHistory] --All Records from the left table, and any matches from the right table
--[HumanResources].[Department] CROSS APPLY [HumanResources].[EmployeeDepartmentHistory] -- ?
GO