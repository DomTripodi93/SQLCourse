USE AdventureWorks2019
GO

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department
    -- WHERE DepartmentID > 7
    -- WHERE [Name] = 'Production Control'
    -- WHERE GroupName = 'Manufacturing'
    -- WHERE [Name] LIKE 'Production%'
    -- WHERE DepartmentID = 7
    -- WHERE DepartmentID <> 7
    -- WHERE GroupName <> 'Manufacturing'
    -- WHERE 1=1
    -- WHERE GroupName IS NOT NULL
    -- WHERE GroupName <>  NULL
    -- WHERE NULL IS NULL
    -- WHERE NULL IS NOT NULL
    -- WHERE DepartmentID IN(7,11)
    -- WHERE [Name] IN('Production','Sales')
    -- WHERE DepartmentID BETWEEN 7 AND 14
    -- WHERE DepartmentID BETWEEN 8 AND 14
    --     AND GroupName = 'Manufacturing'
    WHERE DepartmentID BETWEEN 10 AND 14
        OR GroupName = 'Manufacturing'