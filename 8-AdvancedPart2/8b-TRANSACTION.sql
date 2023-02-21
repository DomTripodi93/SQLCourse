USE AdventureWorks2019;
GO
	
CREATE OR ALTER PROCEDURE HumanResources.spEmployeePayRates_Get
    @BusinessEntityId INT = NULL
    , @NameSearch VARCHAR(100) = NULL
AS
BEGIN
    SELECT  EmployeePayRates.Rate
            , EmployeePayRates.BusinessEntityID
            , EmployeePayRates.FirstName
            , EmployeePayRates.LastName
            , EmployeePayRates.FullName
            , EmployeePayRates.DepartmentID
            , EmployeePayRates.DepartmentName
            , EmployeePayRates.DepartmentGroup
      FROM  HumanResources.EmployeePayRates
     WHERE  EmployeePayRates.BusinessEntityID = ISNULL (@BusinessEntityId, EmployeePayRates.BusinessEntityID)
            AND EmployeePayRates.FullName LIKE '%' + ISNULL (@NameSearch, '') + '%';
END;
GO

EXEC HumanResources.spEmployeePayRates_Get;