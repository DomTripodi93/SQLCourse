USE AdventureWorks2019;
GO

CREATE OR ALTER PROCEDURE HumanResources.spEmployeePayRates_Get
    @BusinessEntityId INT = NULL
    , @NameSearch VARCHAR(100) = NULL
AS
BEGIN
    --SELECT  *
    --  FROM  HumanResources.EmployeePayHistory
    --      JOIN Person.Person
    --          ON Person.BusinessEntityID = EmployeePayHistory.BusinessEntityID
    -- --WHERE  EmployeePayHistory.BusinessEntityID = 4
    -- ORDER BY EmployeePayHistory.BusinessEntityID;
    SELECT  PayHistory.BusinessEntityID
            , PayHistory.Rate
            , Person.FirstName
            , Person.LastName
      FROM  (
                SELECT  EmployeePayHistory.BusinessEntityID
                        , EmployeePayHistory.Rate
                        , ROW_NUMBER () OVER (PARTITION BY EmployeePayHistory.BusinessEntityID
                                                  ORDER BY EmployeePayHistory.RateChangeDate DESC
                                             ) AS PayHistoryRow
                  FROM  HumanResources.EmployeePayHistory
            ) AS PayHistory
          JOIN Person.Person
              ON Person.BusinessEntityID = PayHistory.BusinessEntityID
     WHERE  PayHistory.PayHistoryRow = 1
            AND PayHistory.BusinessEntityID = ISNULL (@BusinessEntityId, PayHistory.BusinessEntityID)
            AND Person.FirstName + ISNULL(Person.MiddleName, '') + Person.LastName LIKE '%' + ISNULL (@NameSearch, '') + '%';

--SELECT  EmployeePayHistory.Rate
--        , Person.BusinessEntityID
--        , Person.PersonType
--        , Person.NameStyle
--        , Person.Title
--        , Person.FirstName
--        , Person.MiddleName
--        , Person.LastName
--        , Person.Suffix
--        , Person.EmailPromotion
--        , Person.AdditionalContactInfo
--        , Person.Demographics
--        , Person.rowguid
--        , Person.ModifiedDate
--  FROM  Person.Person
--      CROSS APPLY (
--                      SELECT    TOP 1
--                                EmployeePayHistory.Rate
--                        FROM    HumanResources.EmployeePayHistory
--                       WHERE EmployeePayHistory.BusinessEntityID = Person.BusinessEntityID
--                       ORDER BY EmployeePayHistory.RateChangeDate DESC
--                  ) AS EmployeePayHistory
END;
GO

EXEC HumanResources.spEmployeePayRates_Get;