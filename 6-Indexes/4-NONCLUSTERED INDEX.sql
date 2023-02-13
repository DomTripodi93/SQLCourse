USE AdventureWorks2019;
GO

--SELECT  *
--  FROM  HumanResources.Department;

DROP TABLE IF EXISTS HumanResources.Department_Index;

CREATE TABLE HumanResources.Department_Index
(
    --DepartmentID SMALLINT IDENTITY(1, 1) NOT NULL   --PRIMARY KEY
    DepartmentID SMALLINT IDENTITY(1, 1) NOT NULL   --UNIQUE
    , DeptName VARCHAR(50) NOT NULL
    , GroupName VARCHAR(50) NOT NULL
    , ModifiedDate DATETIME NOT NULL
          DEFAULT (GETDATE ())
                                                    --, CONSTRAINT ck_DeptName_GroupName
                                                    --      PRIMARY KEY (DeptName, GroupName)
    , CONSTRAINT unq_DeptName_GroupName
          UNIQUE (DeptName, GroupName)
);
GO

CREATE CLUSTERED INDEX cix_Department_Index_DepartmentID
    ON HumanResources.Department_Index (DepartmentID);

--CREATE CLUSTERED INDEX cix_Department_Index_DepartmentName_GroupName
--    ON HumanResources.Department_Index (DeptName, GroupName);

CREATE NONCLUSTERED INDEX cix_Department_Index_DepartmentName_GroupName
    ON HumanResources.Department_Index (DeptName, GroupName);
GO