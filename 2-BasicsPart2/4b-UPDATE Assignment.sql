USE AdventureWorks2019
GO

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department
    WHERE GroupName = 'R and D'
    -- WHERE GroupName = 'Research and Development'

UPDATE HumanResources.Department SET [GroupName] = 'R and D'
    WHERE GroupName = 'Research and Development'
