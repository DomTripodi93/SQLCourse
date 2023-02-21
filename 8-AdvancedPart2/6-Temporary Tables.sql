USE AdventureWorks2019;
GO

CREATE OR ALTER PROCEDURE HumanResources.spEmployeePayRates_Get
    @BusinessEntityId INT = NULL
    , @NameSearch VARCHAR(100) = NULL
AS
BEGIN
    SELECT  PayHistory.BusinessEntityID
            , PayHistory.Rate
      --, Person.FirstName
      --, Person.LastName
      INTO  #LatestPay
      FROM  (
                SELECT  EmployeePayHistory.BusinessEntityID
                        , EmployeePayHistory.Rate
                        , ROW_NUMBER () OVER (PARTITION BY EmployeePayHistory.BusinessEntityID
                                                  ORDER BY EmployeePayHistory.RateChangeDate DESC
                                             ) AS PayHistoryRow
                  FROM  HumanResources.EmployeePayHistory
            ) AS PayHistory
     --JOIN Person.Person
     --    ON Person.BusinessEntityID = PayHistory.BusinessEntityID
     WHERE  PayHistory.PayHistoryRow = 1;

    CREATE CLUSTERED INDEX cix_PayHistory_BusinessEntityId
        ON #LatestPay (BusinessEntityID);

    --SELECT * FROM HumanResources.EmployeeDepartmentHistory
    SELECT  DepartmentChange.BusinessEntityID
            , DepartmentChange.DepartmentID
      INTO  #LatestDepartment
      FROM  (
                SELECT  EmployeeDepartmentHistory.BusinessEntityID
                        , EmployeeDepartmentHistory.DepartmentID
                        , ROW_NUMBER () OVER (PARTITION BY EmployeeDepartmentHistory.BusinessEntityID
                                                  ORDER BY EmployeeDepartmentHistory.ModifiedDate DESC
                                             ) AS DepartmentChangeRow
                  FROM  HumanResources.EmployeeDepartmentHistory
            ) AS DepartmentChange
     WHERE  DepartmentChange.DepartmentChangeRow = 1;

    CREATE CLUSTERED INDEX cix_LatestDepartment_BusinessEntityId
        ON #LatestDepartment (BusinessEntityID);

    --SELECT  EmployeePayHistory.Rate
    SELECT  #LatestPay.Rate
            , Person.BusinessEntityID
            , Person.FirstName
            , Person.LastName
            , #LatestDepartment.DepartmentID
            , Department.Name AS DepartmentName
            , Department.GroupName AS DepartmentGroup
      FROM  Person.Person
          JOIN #LatestPay
              ON #LatestPay.BusinessEntityID = Person.BusinessEntityID
          --JOIN #LatestDepartment
          LEFT JOIN #LatestDepartment
              ON #LatestDepartment.BusinessEntityID = Person.BusinessEntityID
          --JOIN HumanResources.Department
          LEFT JOIN HumanResources.Department
              ON Department.DepartmentID = #LatestDepartment.DepartmentID
     WHERE  Person.BusinessEntityID = ISNULL (@BusinessEntityId, Person.BusinessEntityID)
            AND Person.FirstName + ISNULL (Person.MiddleName, '') + Person.LastName LIKE '%' + ISNULL (@NameSearch, '') + '%';
END;
GO

EXEC HumanResources.spEmployeePayRates_Get;