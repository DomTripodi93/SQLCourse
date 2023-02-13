USE AdventureWorks2019;
GO

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.Department
 WHERE  [Department].[Name] = 'Research and Development';

UPDATE  HumanResources.Department
   SET  [Department].[Name] = 'R and D'
 WHERE  [Department].[Name] = 'Research and Development';

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.Department
 --WHERE  [Department].[Name] = 'Research and Development';
 WHERE  [Department].[Name] = 'R and D';
GO