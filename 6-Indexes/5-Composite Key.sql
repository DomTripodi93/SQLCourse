USE AdventureWorks2019
GO

-- SELECT * FROM HumanResources.Department

DROP TABLE IF EXISTS [HumanResources].[Department_WithIndexes]

CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,-- PRIMARY KEY,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
    -- CONSTRAINT uq_GroupName_Name UNIQUE([Name], [GroupName])
    -- CONSTRAINT pk_DepartmentId PRIMARY KEY (DepartmentID)
    -- CONSTRAINT pk_DepartmentId PRIMARY KEY (DepartmentID, GroupName)
    CONSTRAINT pk_DepartmentId PRIMARY KEY (DepartmentID, GroupName)
)

-- ALTER TABLE HumanResources.Department_WithIndexes 
--     ADD CONSTRAINT pk_DepartmentId PRIMARY KEY (DepartmentID, GroupName)
--     ADD CONSTRAINT pk_DepartmentId PRIMARY KEY (DepartmentID)

-- ALTER TABLE HumanResources.Department_WithIndexes ADD CONSTRAINT uq_GroupName_Name UNIQUE([Name], [GroupName])
-- ALTER TABLE HumanResources.Department_WithIndexes 
--     ADD CONSTRAINT uq_GroupName_DepartmentID UNIQUE([GroupName], [DepartmentID])

-- CREATE CLUSTERED INDEX cix_Department_WithIndexes_GroupName_DepartmentID
--     ON [HumanResources].[Department_WithIndexes] (GroupName, DepartmentID)

CREATE NONCLUSTERED INDEX ix_Department_WithIndexes_Name
    ON [HumanResources].[Department_WithIndexes] ([Name])-- INCLUDE (ModifiedDate)


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
    -- WITH(INDEX(cix_Department_WithIndexes_GroupName_DepartmentID))

-- SELECT DepartmentID,
--     [Name],
--     [GroupName],
--     [ModifiedDate] 
-- FROM HumanResources.Department
