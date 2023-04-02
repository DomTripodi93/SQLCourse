SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATE PROCEDURE HumanResources.spDepartments_Get
-- ALTER PROCEDURE HumanResources.spDepartments_Get
CREATE OR ALTER   PROCEDURE [HumanResources].[spDepartments_Get]
    @GroupName [dbo].[Name]
/*
    EXEC HumanResources.spDepartments_Get 
        @GroupName = 'R and D'
*/
AS
BEGIN
    SELECT [Department].[DepartmentID],
        [Department].[Name],
        [Department].[GroupName],
        [Department].[ModifiedDate] 
    FROM HumanResources.Department AS Department
        WHERE Department.GroupName = @GroupName
END
GO
