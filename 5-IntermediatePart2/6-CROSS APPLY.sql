USE AdventureWorks2019
GO

SELECT EmployeesInDepartment.EmployeeCount, 
    FirstEmployeeInDepartment.FullName,
    LastEmployeeInDepartment.FullName,
    * 
FROM HumanResources.Department AS RootDepartment
    -- OUTER APPLY (SELECT * FROM HumanResources.Department AS NestedDepartment
    --     WHERE NestedDepartment.DepartmentID = RootDepartment.DepartmentID) AS InnerDepartment
    -- OUTER APPLY (-- LEFT JOIN
    CROSS APPLY (-- INNER JOIN
        SELECT TOP 1
            Person.FirstName + ' ' + ISNULL(Person.MiddleName, '') + ' ' + Person.LastName AS FullName
            FROM HumanResources.EmployeeDepartmentHistory AS FirstEmployee 
                JOIN Person.Person 
                    ON Person.BusinessEntityID = FirstEmployee.BusinessEntityID
                WHERE FirstEmployee.DepartmentID = RootDepartment.DepartmentID
                    -- AND RootDepartment.DepartmentID = 2
            ORDER BY FirstEmployee.StartDate 
    ) AS FirstEmployeeInDepartment
    OUTER APPLY (
        SELECT TOP 1
            Person.FirstName + ' ' + ISNULL(Person.MiddleName, '') + ' ' + Person.LastName AS FullName
            FROM HumanResources.EmployeeDepartmentHistory AS LastEmployee 
                JOIN Person.Person 
                    ON Person.BusinessEntityID = LastEmployee.BusinessEntityID
                WHERE LastEmployee.DepartmentID = RootDepartment.DepartmentID
            ORDER BY LastEmployee.StartDate DESC
    ) AS LastEmployeeInDepartment
    OUTER APPLY (
        SELECT COUNT(*) AS EmployeeCount
            FROM HumanResources.EmployeeDepartmentHistory AS EmployeeCount
                WHERE EmployeeCount.DepartmentID = RootDepartment.DepartmentID
    ) AS EmployeesInDepartment


