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
-- FROM HumanResources.EmployeeDepartmentHistory AS EmployeeDepartmentHistory
--     LEFT JOIN Person.Person AS Person
--         ON Person.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
FROM Person.Person AS Person
    LEFT JOIN HumanResources.EmployeeDepartmentHistory AS EmployeeDepartmentHistory
        ON Person.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID




--HumanResources.EmployeeDepartmentHistory INNER JOIN / JOIN Person.Person -- Only Records that exist in both tables
    --Doesn't matter which table is on the left or right

--Person.Person LEFT JOIN HumanResources.EmployeeDepartmentHistory -- Include all records from the Left table, but only matching records from the Right table
    --If we don't have a match then we get NULL values for the fields from our Right table
    
--Person.Person RIGHT JOIN HumanResources.EmployeeDepartmentHistory -- ?