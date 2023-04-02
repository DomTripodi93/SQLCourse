SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATE PROCEDURE HumanResources.spDepartments_Get
-- ALTER PROCEDURE HumanResources.spDepartments_Get
CREATE OR ALTER   PROCEDURE [HumanResources].[spDepartments_Get]
    @GroupName [dbo].[Name] = NULL
    , @DepartmentName [dbo].[Name] = NULL
    , @PageNumber INT = 1
    , @RowsToReturn INT = 7
/*
    EXEC HumanResources.spDepartments_Get 
        @DepartmentName = 'R and D'
        , @GroupName = 'R and D'
        
    EXEC HumanResources.spDepartments_Get 
        @PageNumber = 3
        , @RowsToReturn = 5
*/
AS
BEGIN
    DECLARE @Offset INT = @RowsToReturn * (@PageNumber - 1)

    SELECT [Department].[DepartmentID],
        [Department].[Name],
        [Department].[GroupName],
        [Department].[ModifiedDate] 
    FROM HumanResources.Department AS Department
        WHERE Department.GroupName = ISNULL(@GroupName, Department.GroupName)
            AND Department.[Name] = ISNULL(@DepartmentName, Department.[Name])
    ORDER BY Department.GroupName, Department.[Name]
    OFFSET @Offset ROWS FETCH NEXT @RowsToReturn ROWS ONLY
END
GO
