USE AdventureWorks2019
GO

-- CREATE PROCEDURE HumanResources.spDepartments_Get
-- ALTER PROCEDURE HumanResources.spDepartments_Get
CREATE OR ALTER PROCEDURE HumanResources.spDepartments_Get
/*
    EXEC HumanResources.spDepartments_Get
        
*/
AS
BEGIN
    SELECT [Department].[DepartmentID],
        [Department].[Name],
        [Department].[GroupName],
        [Department].[ModifiedDate] 
    FROM HumanResources.Department AS Department
END


-- EXEC HumanResources.spDepartments_Get
