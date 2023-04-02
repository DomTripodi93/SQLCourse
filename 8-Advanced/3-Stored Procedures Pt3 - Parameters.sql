SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATE PROCEDURE HumanResources.spDepartments_Get
-- ALTER PROCEDURE HumanResources.spDepartments_Get
CREATE OR ALTER   PROCEDURE [HumanResources].[spDepartments_Get]
    @GroupName [dbo].[Name] = NULL
    , @DepartmentName [dbo].[Name] = NULL
/*
    EXEC HumanResources.spDepartments_Get 
        @DepartmentName = 'R and D'
        , @GroupName = 'R and D'
*/
AS
BEGIN
    SELECT [Department].[DepartmentID],
        [Department].[Name],
        [Department].[GroupName],
        [Department].[ModifiedDate] 
    FROM HumanResources.Department AS Department
        WHERE Department.GroupName = ISNULL(@GroupName, Department.GroupName)
            AND Department.[Name] = ISNULL(@DepartmentName, Department.[Name])
END
GO
