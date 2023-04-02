USE AdventureWorks2019
GO


SELECT [Department].[DepartmentID],
    [Department].[Name],
    [Department].[GroupName],
    [Department].[ModifiedDate] 
FROM HumanResources.Department AS Department
EXCEPT
SELECT [Department].[DepartmentID] * 10,
    [Department].[Name],
    [Department].[GroupName],
    [Department].[ModifiedDate] 
FROM HumanResources.Department AS Department
    WHERE GroupName = 'Executive General and Administration'


