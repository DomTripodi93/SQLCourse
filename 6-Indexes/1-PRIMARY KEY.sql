USE AdventureWorks2019;
GO

SELECT  *
  FROM  HumanResources.Department;

DROP TABLE IF EXISTS HumanResources.Department_Index;

CREATE TABLE HumanResources.Department_Index
(
    DepartmentID SMALLINT IDENTITY(1, 1) NOT NULL PRIMARY KEY
    --, Name dbo.Name NOT NULL
    , DeptName VARCHAR(50) NOT NULL
    --, GroupName dbo.Name NOT NULL
    , GroupName VARCHAR(50) NOT NULL
    , ModifiedDate DATETIME NOT NULL
          DEFAULT (GETDATE ())
);
GO