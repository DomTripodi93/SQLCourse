USE AdventureWorks2019
GO

SELECT [Department].[DepartmentID],
    [Department].[Name],
    [Department].[GroupName],
    [Department].[ModifiedDate] 
FROM HumanResources.Department AS Department

SELECT 
    [Department].[GroupName]
    , STRING_AGG([Name], ', ') AS DepartmentsInGroup
    , STRING_AGG([Name], ';') AS DepartmentsInGroupForProgram
FROM HumanResources.Department AS Department
GROUP BY [Department].[GroupName]
