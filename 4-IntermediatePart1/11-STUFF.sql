USE AdventureWorks2019
GO

SELECT 
    [Department].[GroupName]
    , STRING_AGG([Name], ', ') AS DepartmentsInGroup
    , STRING_AGG([Name], ';') AS DepartmentsInGroupForProgram
FROM HumanResources.Department AS Department
GROUP BY [Department].[GroupName]


SELECT DISTINCT 
    [Department].[GroupName]
    , STUFF((
        SELECT ', ' +
        [DepartmentInner].[Name] 
        --  , Department.GroupName
        FROM HumanResources.Department AS DepartmentInner
            WHERE DepartmentInner.GroupName = Department.GroupName
            -- FOR XML PATH('Main')
            FOR XML PATH('')),
            1,
            2,
            '')
FROM HumanResources.Department AS Department
-- GROUP BY [Department].[GroupName]

    -- <name> value </name>