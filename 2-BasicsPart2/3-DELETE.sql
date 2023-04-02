USE AdventureWorks2019
GO

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department
    WHERE DepartmentID = 7

DELETE FROM HumanResources.Department
    WHERE DepartmentID = 7


SELECT * FROM HumanResources.EmployeeDepartmentHistory
    WHERE DepartmentID = 7

DELETE FROM HumanResources.EmployeeDepartmentHistory
    WHERE DepartmentID = 7


-- The DELETE statement conflicted with the REFERENCE constraint 
-- "FK_EmployeeDepartmentHistory_Department_DepartmentID". 
-- The conflict occurred in database "AdventureWorks2019", table 
-- "HumanResources.EmployeeDepartmentHistory", column 'DepartmentID'.
