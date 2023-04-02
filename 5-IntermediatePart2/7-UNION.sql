USE AdventureWorks2019
GO

SELECT [Department].[DepartmentID],
    'QA: ' + [Department].[Name] AS DepartmentName,
    [Department].[GroupName],
    [Department].[ModifiedDate] 
FROM HumanResources.Department AS Department
    WHERE GroupName = 'Quality Assurance'
-- UNION
UNION ALL
SELECT [Department].[DepartmentID] * 10,
    'EGA: ' + [Department].[Name],
    -- [Department].[Name],
    [Department].[GroupName],
    [Department].[ModifiedDate] 
FROM HumanResources.Department AS Department
    WHERE GroupName = 'Executive General and Administration'
UNION ALL
SELECT [Department].[DepartmentID] * 100,
    'RD: ' + [Department].[Name],
    [Department].[GroupName],
    [Department].[ModifiedDate] 
FROM HumanResources.Department AS Department
    WHERE GroupName = 'R and D'

