USE AdventureWorks2019
GO

SELECT 
    GroupName AS NameOfGroup,
    MIN(DepartmentId) AS MinimumDepartmentId,
    MAX(DepartmentId) MaximumDepartmentId,
    COUNT(*),
    SUM(DepartmentID),
    AVG(CAST(DepartmentID AS DECIMAL(18,4)))
FROM HumanResources.Department AS Dept
    -- WHERE GroupName = 'Inventory Management'
    -- WHERE SUM(DepartmentID) > 15
    GROUP BY GroupName
    HAVING SUM(DepartmentID) > 15
    ORDER BY COUNT(*) DESC 
