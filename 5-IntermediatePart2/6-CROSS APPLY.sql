USE AdventureWorks2019;
GO

SELECT  *
  FROM  [HumanResources].[Department]
      --OUTER APPLY (
      CROSS APPLY (
                      SELECT    STRING_AGG ([Person].[FirstName] + ' ' + [Person].[MiddleName] + ' ' + [Person].[LastName], '; ') AS PeopleInDepartment
                        FROM    [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
                            JOIN [Person].[Person]
                                ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID]
                       WHERE [EmployeeDepartmentHistory].[DepartmentID] = [Department].[DepartmentID]
                             AND [Person].[FirstName] LIKE '%d%'
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

--[HumanResources].[Department] OUTER APPLY [HumanResources].[EmployeeDepartmentHistory] --All Records from the left table, and any matches from the right table
--[HumanResources].[Department] CROSS APPLY [HumanResources].[EmployeeDepartmentHistory] --All Records that match in both tables (or result sets)
GO