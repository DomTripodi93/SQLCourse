USE AdventureWorks2019
GO

-- SELECT * FROM HumanResources.Department

DROP TABLE IF EXISTS [HumanResources].[Department_WithIndexes]

CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
)

-- CREATE CLUSTERED INDEX cix_Department_WithIndexes_DepartmentID
--     ON [HumanResources].[Department_WithIndexes] (DepartmentID)

CREATE CLUSTERED INDEX cix_Department_WithIndexes_Name
    ON [HumanResources].[Department_WithIndexes] ([Name])


SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM [HumanResources].[Department_WithIndexes]

-- INSERT INTO [HumanResources].[Department_WithIndexes] (
--     [Name],
--     [GroupName],
--     [ModifiedDate])
SELECT DepartmentID,
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department
