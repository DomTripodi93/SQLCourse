USE AdventureWorks2019;
GO

SELECT  *
  FROM  [HumanResources].[EmployeeDepartmentHistory];

SELECT  *
  FROM  [Person].[Person];

SELECT  *
  FROM  [HumanResources].[Shift];

SELECT  *
  FROM  [HumanResources].[Department];
GO

CREATE SCHEMA IndexTesting;
GO

SELECT  [EmployeeDepartmentHistory].[BusinessEntityID]
        , [EmployeeDepartmentHistory].[DepartmentID]
        , [EmployeeDepartmentHistory].[ShiftID]
        , [EmployeeDepartmentHistory].[StartDate]
        , [EmployeeDepartmentHistory].[EndDate]
        , [EmployeeDepartmentHistory].[ModifiedDate]
  INTO  [IndexTesting].[EmployeeDepartmentHistory]
  FROM  [HumanResources].[EmployeeDepartmentHistory];

SELECT  [Person].[BusinessEntityID]
        , [Person].[PersonType]
        , [Person].[NameStyle]
        , [Person].[Title]
        , [Person].[FirstName]
        , [Person].[MiddleName]
        , [Person].[LastName]
        , [Person].[Suffix]
        , [Person].[EmailPromotion]
        , [Person].[AdditionalContactInfo]
        , [Person].[Demographics]
        , [Person].[rowguid]
        , [Person].[ModifiedDate]
  INTO  [IndexTesting].[Person]
  FROM  [Person].[Person];

SELECT  [Shift].[ShiftID]
        , [Shift].[Name]
        , [Shift].[StartTime]
        , [Shift].[EndTime]

        , [Shift].[ModifiedDate]
  INTO  [IndexTesting].[Shift]
  FROM  [HumanResources].[Shift];

SELECT  [Department].[DepartmentID]
        , [Department].[Name]
        , [Department].[GroupName]
        , [Department].[ModifiedDate]
  INTO  [IndexTesting].[Department]
  FROM  [HumanResources].[Department];
GO



