USE AdventureWorks2019
GO

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department

SELECT COUNT(DISTINCT GroupName)
FROM HumanResources.Department

SELECT 
    GroupName,
    MIN(DepartmentId),
    MAX(DepartmentId),
    COUNT(*),
    SUM(DepartmentID),
    AVG(CAST(DepartmentID AS DECIMAL(18,4)))
FROM HumanResources.Department
    GROUP BY GroupName
    ORDER BY COUNT(*) DESC 

