USE AdventureWorks2019
GO

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department

SELECT [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department

SELECT DISTINCT [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department

SELECT DISTINCT [ModifiedDate] 
FROM HumanResources.Department

SELECT DISTINCT [Name], 
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department
