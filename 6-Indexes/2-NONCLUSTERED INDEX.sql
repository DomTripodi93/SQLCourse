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

CREATE CLUSTERED INDEX cix_Department_WithIndexes_GroupName_DepartmentID
    ON [HumanResources].[Department_WithIndexes] (GroupName, DepartmentID)

CREATE NONCLUSTERED INDEX ix_Department_WithIndexes_Name
    ON [HumanResources].[Department_WithIndexes] ([Name]) INCLUDE (ModifiedDate)


INSERT INTO [HumanResources].[Department_WithIndexes] (
    [Name],
    [GroupName],
    [ModifiedDate])
SELECT 
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department


SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM [HumanResources].[Department_WithIndexes] 

-- SELECT DepartmentID,
--     [Name],
--     [GroupName],
--     [ModifiedDate] 
-- FROM HumanResources.Department
