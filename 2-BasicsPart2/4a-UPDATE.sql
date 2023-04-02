USE AdventureWorks2019
GO

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department
    WHERE GroupName = 6

UPDATE HumanResources.Department SET [Name] = 'R and D'
    WHERE DepartmentID = 6
