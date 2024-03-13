USE AdventureWorks2019
GO

CREATE OR ALTER   VIEW [HumanResources].[vwEmployeeInfo]
/*
    SELECT * FROM  HumanResources.vwEmployeeInfo WHERE FirstName = 'Diane'
*/
WITH SCHEMABINDING
AS
    SELECT [Employee].[BusinessEntityID],
        [Employee].[NationalIDNumber],
        [Employee].[LoginID],
        [Employee].[OrganizationNode],
        [Employee].[OrganizationLevel],
        [Employee].[JobTitle],
        [Employee].[BirthDate],
        [Employee].[MaritalStatus],
        [Employee].[Gender],
        [Employee].[HireDate],
        [Employee].[SalariedFlag],
        [Employee].[VacationHours],
        [Employee].[SickLeaveHours],
        [Employee].[CurrentFlag],
        [Person].[PersonType],
        [Person].[NameStyle],
        [Person].[FirstName],
        [Person].[MiddleName],
        [Person].[LastName],
        [Person].[Suffix],
        [Person].[EmailPromotion],
        [Person].[AdditionalContactInfo],
        [Person].[Demographics]
    FROM Person.Person
        JOIN HumanResources.Employee
            ON Employee.BusinessEntityID = Person.BusinessEntityID

GO

-- SP_HELPINDEX 'HumanResources.vwEmployeeInfo'

CREATE UNIQUE CLUSTERED INDEX cix_vwEmployeeInfo_BusinessEntityID ON HumanResources.vwEmployeeInfo(BusinessEntityID)