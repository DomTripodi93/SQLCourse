USE AdventureWorks2019;
GO

EXEC HumanResources.spDepartments_Get @GroupName = 'Executive General and Administration';  -- Name
GO

SET QUOTED_IDENTIFIER ON;

SET ANSI_NULLS ON;
GO

ALTER PROCEDURE HumanResources.spDepartments_Get
    --@GroupName [dbo].[Name]
    @GroupName dbo.Name = NULL
    , @PageNumber INT = 1
    , @RowsToGet INT = 10
AS
BEGIN
    DECLARE @Offset INT = (@PageNumber - 1) * @RowsToGet;

    SELECT  Department.Name
            , Department.GroupName
            , Department.ModifiedDate
      FROM  HumanResources.Department
     --WHERE Department.GroupName = @GroupName;
     WHERE  Department.GroupName = ISNULL (@GroupName, Department.GroupName)
     ORDER BY Department.Name
    --OFFSET 0 ROWS
    --FETCH NEXT 10 ROWS ONLY;
    OFFSET @Offset ROWS FETCH NEXT @RowsToGet ROWS ONLY;
END;
GO

EXEC HumanResources.spDepartments_Get @PageNumber = 2;

EXEC HumanResources.spDepartments_Get @PageNumber = 2, @RowsToGet = 12;

EXEC HumanResources.spDepartments_Get @PageNumber = 2, @RowsToGet = 5;

EXEC HumanResources.spDepartments_Get @PageNumber = 3, @RowsToGet = 5;

EXEC HumanResources.spDepartments_Get @PageNumber = 1, @RowsToGet = 5;

EXEC HumanResources.spDepartments_Get @RowsToGet = 5;