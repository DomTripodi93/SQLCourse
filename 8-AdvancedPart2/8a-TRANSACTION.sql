USE AdventureWorks2019;
GO

CREATE OR ALTER PROCEDURE HumanResources.spEmployeePayRates_Load
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

    BEGIN TRANSACTION;

    DROP TABLE IF EXISTS HumanResources.EmployeePayRates;

    WAITFOR DELAY '00:00:15';

    --SELECT  EmployeePayHistory.Rate
    SELECT  #LatestPay.Rate
            , Person.BusinessEntityID
            , Person.FirstName
            , Person.LastName
            , Person.FirstName + ' ' + CASE WHEN Person.MiddleName IS NULL THEN '' ELSE Person.MiddleName + ' ' END + Person.LastName AS FullName
            , #LatestDepartment.DepartmentID
            , Department.Name AS DepartmentName
            , Department.GroupName AS DepartmentGroup
      INTO  HumanResources.EmployeePayRates
      FROM  Person.Person
          JOIN #LatestPay
              ON #LatestPay.BusinessEntityID = Person.BusinessEntityID
          --JOIN #LatestDepartment
          LEFT JOIN #LatestDepartment
              ON #LatestDepartment.BusinessEntityID = Person.BusinessEntityID
          --JOIN HumanResources.Department
          LEFT JOIN HumanResources.Department
              ON Department.DepartmentID = #LatestDepartment.DepartmentID;

    DECLARE @RecordsInEmployeeRates INT;

    SELECT  @RecordsInEmployeeRates = COUNT (*)
      FROM  HumanResources.EmployeePayRates;

    IF @RecordsInEmployeeRates < 300
    --IF @RecordsInEmployeeRates < 200
    BEGIN
        PRINT ('Not enough records in the table, something might have gone wrong');
    END;
    ELSE
    BEGIN
        PRINT ('The load looks like it worked as expected');
    END;

    COMMIT TRANSACTION;
END;
GO