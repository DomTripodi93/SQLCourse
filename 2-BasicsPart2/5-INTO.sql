USE AdventureWorks2019
GO

DROP TABLE IF EXISTS HumanResources.DepartmentCopy

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
    INTO HumanResources.DepartmentCopy
FROM HumanResources.Department
    WHERE DepartmentID > 10

SELECT * FROM HumanResources.DepartmentCopy
