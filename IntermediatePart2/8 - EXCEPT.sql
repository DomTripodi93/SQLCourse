USE AdventureWorks2019;
GO

SELECT  [EmployeeDepartmentHistory].[BusinessEntityID]
        , [EmployeeDepartmentHistory].[DepartmentID]
        , [EmployeeDepartmentHistory].[ShiftID]
        , [EmployeeDepartmentHistory].[StartDate]
        , [EmployeeDepartmentHistory].[EndDate]
        , [EmployeeDepartmentHistory].[ModifiedDate]
  FROM  [HumanResources].[EmployeeDepartmentHistory]
 WHERE  [EmployeeDepartmentHistory].[BusinessEntityID] < 200;

DROP TABLE IF EXISTS [HumanResources].[EmployeeDepartmentHistoryIncremental];

SELECT  [EmployeeDepartmentHistory].[BusinessEntityID]
        , [EmployeeDepartmentHistory].[DepartmentID]
        , [EmployeeDepartmentHistory].[ShiftID]
        , [EmployeeDepartmentHistory].[StartDate]
        , [EmployeeDepartmentHistory].[EndDate]
        , [EmployeeDepartmentHistory].[ModifiedDate]
  INTO  [HumanResources].[EmployeeDepartmentHistoryIncremental]
  FROM  [HumanResources].[EmployeeDepartmentHistory]
 WHERE  [EmployeeDepartmentHistory].[BusinessEntityID] < 200;

SELECT  [EmployeeDepartmentHistory].[BusinessEntityID]
        , [EmployeeDepartmentHistory].[DepartmentID]
        , [EmployeeDepartmentHistory].[ShiftID]
        , [EmployeeDepartmentHistory].[StartDate]
        , [EmployeeDepartmentHistory].[EndDate]
        , [EmployeeDepartmentHistory].[ModifiedDate]
  FROM  [HumanResources].[EmployeeDepartmentHistory]
EXCEPT
SELECT  [EmployeeDepartmentHistoryIncremental].[BusinessEntityID]
        , [EmployeeDepartmentHistoryIncremental].[DepartmentID]
        , [EmployeeDepartmentHistoryIncremental].[ShiftID]
        , [EmployeeDepartmentHistoryIncremental].[StartDate]
        , [EmployeeDepartmentHistoryIncremental].[EndDate]
        , [EmployeeDepartmentHistoryIncremental].[ModifiedDate]
  FROM  [HumanResources].[EmployeeDepartmentHistoryIncremental];

INSERT INTO [HumanResources].[EmployeeDepartmentHistoryIncremental] ([BusinessEntityID]
                                                                     , [DepartmentID]
                                                                     , [ShiftID]
                                                                     , [StartDate]
                                                                     , [EndDate]
                                                                     , [ModifiedDate])
SELECT  [EmployeeDepartmentHistory].[BusinessEntityID]
        , [EmployeeDepartmentHistory].[DepartmentID]
        , [EmployeeDepartmentHistory].[ShiftID]
        , [EmployeeDepartmentHistory].[StartDate]
        , [EmployeeDepartmentHistory].[EndDate]
        , [EmployeeDepartmentHistory].[ModifiedDate]
  FROM  [HumanResources].[EmployeeDepartmentHistory]
EXCEPT
SELECT  [EmployeeDepartmentHistoryIncremental].[BusinessEntityID]
        , [EmployeeDepartmentHistoryIncremental].[DepartmentID]
        , [EmployeeDepartmentHistoryIncremental].[ShiftID]
        , [EmployeeDepartmentHistoryIncremental].[StartDate]
        , [EmployeeDepartmentHistoryIncremental].[EndDate]
        , [EmployeeDepartmentHistoryIncremental].[ModifiedDate]
  FROM  [HumanResources].[EmployeeDepartmentHistoryIncremental];

INSERT INTO [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityID]
                                                          , [DepartmentID]
                                                          , [ShiftID]
                                                          , [StartDate]
                                                          , [EndDate]
                                                          , [ModifiedDate])
VALUES (290, 3, 1, '2023-07-15', NULL, GETDATE ());
GO