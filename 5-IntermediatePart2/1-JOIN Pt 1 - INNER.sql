USE AdventureWorks2019;
GO

--SELECT * FROM  [HumanResources].[EmployeeDepartmentHistory];

--SELECT * FROM [HumanResources].[Department]
--SELECT * FROM  [Person].[Person];

--SELECT * FROM [HumanResources].[Shift]

--SELECT  *
--SELECT  [EmployeeDepartmentHistory].[BusinessEntityID]
--      , [EmployeeDepartmentHistory].[DepartmentID]
--      , [EmployeeDepartmentHistory].[ShiftID]
--      , [EmployeeDepartmentHistory].[StartDate]
--      , [EmployeeDepartmentHistory].[EndDate]
--      , [EmployeeDepartmentHistory].[ModifiedDate]
--      , [Person].[BusinessEntityID]
--      , [Person].[PersonType]
--      , [Person].[NameStyle]
--      , [Person].[Title]
--      , [Person].[FirstName]
--      , [Person].[MiddleName]
--      , [Person].[LastName]
--      , [Person].[Suffix]
--      , [Person].[EmailPromotion]
--      , [Person].[AdditionalContactInfo]
--      , [Person].[Demographics]
--      , [Person].[rowguid]
--      , [Person].[ModifiedDate]

SELECT  [EmployeeDepartmentHistory].[StartDate]
        , [EmployeeDepartmentHistory].[EndDate]
        , [Person].[Title]
        , [Person].[FirstName]
        , [Person].[MiddleName]
        , [Person].[LastName]
        , [Person].[Suffix]
  --FROM  [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
  --    INNER JOIN [Person].[Person] AS [Person]
  --        ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID];
  FROM  [Person].[Person] AS [Person]
      --INNER JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
      JOIN [HumanResources].[EmployeeDepartmentHistory] AS [EmployeeDepartmentHistory]
          ON [Person].[BusinessEntityID] = [EmployeeDepartmentHistory].[BusinessEntityID];

--[HumanResources].[EmployeeDepartmentHistory] JOIN / INNER JOIN [Person].[Person] --All Records that match in both tables
--[HumanResources].[EmployeeDepartmentHistory] LEFT JOIN / LEFT OUTER JOIN [Person].[Person] -- ?
GO