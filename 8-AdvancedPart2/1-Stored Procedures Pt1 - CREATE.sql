USE AdventureWorks2019;
GO

SELECT  Department.DepartmentID
        , Department.Name
        , Department.GroupName
        , Department.ModifiedDate
  FROM  HumanResources.Department;
GO

--CREATE PROCEDURE HumanResources.spDepartments_Get
ALTER PROCEDURE HumanResources.spDepartments_Get
AS
BEGIN
    --SELECT Department.DepartmentID
    --	 , Department.Name
    SELECT  Department.Name
            , Department.GroupName
            , Department.ModifiedDate
      FROM  HumanResources.Department;
END;
GO

EXEC HumanResources.spDepartments_Get;