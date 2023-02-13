USE AdventureWorks2019;
GO

SELECT  Department.DepartmentID
        , Department.[Name]
        , Department.GroupName
        , Department.ModifiedDate
  FROM  HumanResources.Department;

SELECT  STUFF ((
                   SELECT   DISTINCT
                            ', ' + InnerDept.[Name]
                     FROM   HumanResources.Department AS InnerDept
                    WHERE   InnerDept.GroupName = Department.GroupName
                   FOR XML PATH ('')
               )
               , 1
               , 1
               , ''
              ) AS DepartmentsInGroupStuffed
        , STRING_AGG (Department.[Name], ', ') AS DepartmentsInGroup
        , Department.GroupName
  FROM  HumanResources.Department
 GROUP BY Department.GroupName;
GO