USE AdventureWorks2019;
GO

CREATE PROCEDURE dbo.spTestOutput
    @OutputValue VARCHAR(50) OUTPUT
AS
BEGIN
    SET  @OutputValue = 'Some random Text';
END;
GO

DECLARE @TestOutput VARCHAR(50);

EXEC dbo.spTestOutput @OutputValue = @TestOutput OUTPUT;

SELECT @TestOutput
GO

CREATE PROCEDURE HumanResources.spDepartments_Insert
    --@GroupName [dbo].[Name]
    @DeptName dbo.Name = NULL
    , @GroupName dbo.Name = NULL
    , @DepartmentId SMALLINT OUTPUT
AS
BEGIN
    INSERT INTO HumanResources.Department (Name
                                           , GroupName
                                           , ModifiedDate)
    VALUES (@DeptName, @GroupName, GETDATE ());

    SET @DepartmentId = SCOPE_IDENTITY ();
END;
GO

DECLARE @DeptIdOutput SMALLINT;

EXEC HumanResources.spDepartments_Insert @DeptName = 'Test Group'
                                         , @GroupName = 'Executive General and Administration'
                                         , @DepartmentId = @DeptIdOutput OUTPUT;

SELECT @DeptIdOutput

--17
SELECT * FROM HumanResources.Department