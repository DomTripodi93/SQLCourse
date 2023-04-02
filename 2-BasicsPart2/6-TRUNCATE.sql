USE AdventureWorks2019
GO

DROP TABLE IF EXISTS HumanResources.DepartmentCopy

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
    INTO HumanResources.DepartmentCopy
FROM HumanResources.Department
    WHERE DepartmentID > 10

-- TRUNCATE TABLE HumanResources.DepartmentCopy

DELETE FROM HumanResources.DepartmentCopy WHERE 1 = 1


SELECT * FROM HumanResources.DepartmentCopy


INSERT INTO HumanResources.DepartmentCopy(
    [Name],
    [GroupName],
    [ModifiedDate] ) VALUES ('Random Name', 'Random Group', '2023-08-15')
