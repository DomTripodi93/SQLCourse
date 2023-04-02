USE AdventureWorks2019
GO

SELECT[Person].[PersonType],    
    [Person].[FirstName],
    [Person].[LastName],
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 101) AS DateKey101, --mm/dd/yyyy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 1) AS DateKey1,     --mm/dd/yy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 110) AS DateKey110, --mm-dd-yyyy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 10) AS DateKey10,   --mm-dd-yy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 103) AS DateKey103, --dd/mm/yyyy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 3) AS DateKey3,     --dd/mm/yy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 105) AS DateKey105, --dd-mm-yyyy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 5) AS DateKey5,     --dd-mm-yy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 111) AS DateKey111, --yyyy/mm/dd
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 11) AS DateKey11,   --dd/mm/yy
    CONVERT (VARCHAR(100), [Person].[ModifiedDate], 23) AS DateKey23,   --yyyy-mm-dd
    CONVERT (VARCHAR(100), CAST (12345.7500 AS MONEY), 0) AS MoneyKey0,  --No commas, 2 decimal places
    CONVERT (VARCHAR(100), CAST (12345.7500 AS MONEY), 1) AS MoneyKey1,  --With commas, 2 decimal places
    CONVERT (VARCHAR(100), CAST (12345.7500 AS MONEY), 2) AS MoneyKey2,  --No commas, 4 decimal places
    Person.BusinessEntityID,
    Person.rowguid
FROM Person.Person AS Person