USE AdventureWorks2019
GO

BEGIN TRANSACTION

    SELECT [DepartmentID],
        [Name],
        [GroupName],
        [ModifiedDate] FROM HumanResources.DepartmentCopy


    -- TRUNCATE TABLE HumanResources.DepartmentCopy

    INSERT INTO HumanResources.DepartmentCopy (
        [Name],
        [GroupName],
        [ModifiedDate])
    SELECT
        [Name],
        [GroupName],
        [ModifiedDate] 
    FROM HumanResources.Department

ROLLBACK TRANSACTION
COMMIT TRANSACTION