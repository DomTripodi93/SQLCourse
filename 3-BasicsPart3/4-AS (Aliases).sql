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
    GroupName AS NameOfGroup,
    MIN(DepartmentId) AS MinimumDepartmentId,
    MAX(DepartmentId) MaximumDepartmentId,
    COUNT(*),
    SUM(DepartmentID),
    AVG(CAST(DepartmentID AS DECIMAL(18,4)))
-- FROM HumanResources.Department Dept
FROM HumanResources.Department AS Dept
    GROUP BY GroupName
    ORDER BY COUNT(*) DESC 

SELECT [Department].[DepartmentID],
    [Department].[Name],
    [Department].[GroupName],
    [Department].[ModifiedDate]  
FROM HumanResources.Department AS Department
