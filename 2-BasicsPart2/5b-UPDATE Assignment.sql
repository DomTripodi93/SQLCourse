USE AdventureWorks2019;
GO

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.Department
 WHERE  [Department].[GroupName] = 'Research and Development';

UPDATE  HumanResources.Department
   SET  [Department].[GroupName] = 'R and D'
 WHERE  [Department].[GroupName] = 'Research and Development';

SELECT  [DepartmentID]
        , [Name]
        , [GroupName]
        , [ModifiedDate]
  FROM  HumanResources.Department
 --WHERE  [Department].[GroupName] = 'Research and Development';
 WHERE  [Department].[GroupName] = 'R and D';
GO