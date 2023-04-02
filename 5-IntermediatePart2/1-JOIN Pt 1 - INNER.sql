USE AdventureWorks2019
GO

SELECT [EmployeeDepartmentHistory].[BusinessEntityID],
    [EmployeeDepartmentHistory].[DepartmentID],
    [EmployeeDepartmentHistory].[ShiftID],
    [EmployeeDepartmentHistory].[StartDate],
    [EmployeeDepartmentHistory].[EndDate],
    [Person].[FirstName],
    [Person].[MiddleName],
    [Person].[LastName]
FROM HumanResources.EmployeeDepartmentHistory AS EmployeeDepartmentHistory
    -- INNER JOIN Person.Person AS Person
    JOIN Person.Person AS Person
        ON Person.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID

-- SELECT * 
-- FROM Person.Person AS Person
--     -- INNER JOIN Person.Person AS Person
--     JOIN HumanResources.EmployeeDepartmentHistory AS EmployeeDepartmentHistory
--         ON Person.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID




--HumanResources.EmployeeDepartmentHistory INNER JOIN / JOIN Person.Person -- Only Records that exist in both tables
    --Doesn't matter which table is on the left or right

--HumanResources.EmployeeDepartmentHistory LEFT JOIN Person.Person -- ?