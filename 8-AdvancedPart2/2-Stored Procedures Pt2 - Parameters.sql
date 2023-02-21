USE AdventureWorks2019;
GO

ALTER PROCEDURE HumanResources.spDepartments_Get
    --@GroupName [dbo].[Name]
    @GroupName dbo.Name = NULL
AS
BEGIN
    SELECT  Department.Name
            , Department.GroupName
            , Department.ModifiedDate
      FROM  HumanResources.Department
     --WHERE Department.GroupName = @GroupName;
     WHERE  Department.GroupName = ISNULL (@GroupName, Department.GroupName);
END;
GO

EXEC HumanResources.spDepartments_Get;

EXEC HumanResources.spDepartments_Get 'Executive General and Administration';

EXEC HumanResources.spDepartments_Get @GroupName = 'Executive General and Administration';
