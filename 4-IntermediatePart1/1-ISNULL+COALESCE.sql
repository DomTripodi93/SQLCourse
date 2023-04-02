USE AdventureWorks2019
GO

SELECT[Person].[PersonType],
    [Person].[MiddleName],
    ISNULL([Person].[MiddleName], 'No Middle Name'),
    COALESCE([Person].[MiddleName], [Person].[Title], ''), 
    [Person].[Title],
    [Person].[BusinessEntityID],
    [Person].[NameStyle],
    ISNULL(Title, ''),
    [Person].[FirstName],
    [Person].[LastName]
FROM Person.Person AS Person
    -- WHERE Title = 'Mr.'
    WHERE ISNULL(Title, '') <> 'Mr.'