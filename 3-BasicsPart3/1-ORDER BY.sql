USE AdventureWorks2019
GO

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department
    -- ORDER BY GroupName 
    -- ORDER BY GroupName, [Name]
    -- ORDER BY GroupName DESC, [Name]
    -- ORDER BY GroupName DESC, [Name] DESC
    ORDER BY GroupName ASC, [Name] DESC
