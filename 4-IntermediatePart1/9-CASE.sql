USE AdventureWorks2019;
GO

DROP TABLE IF EXISTS Person.PersonMiddleName;

SELECT  Person.Title
        , Person.FirstName
        , Person.MiddleName
        , CASE WHEN Person.MiddleName IS NOT NULL THEN 1 ELSE 0 END AS HasMiddleName
        , CASE WHEN Person.MiddleName IS NOT NULL
                   THEN CASE WHEN LEN (Person.MiddleName) = 1 THEN 'Initial' ELSE 'Full' END
              ELSE 'None'
          END AS MiddleNameType
        , Person.LastName
  INTO  Person.PersonMiddleName
  FROM  Person.Person;

SELECT  SUM (PersonMiddleName.HasMiddleName) AS WithMiddleName
        , SUM (CASE WHEN PersonMiddleName.HasMiddleName = 0 THEN 1 ELSE 0 END) AS WithoutMiddleName
        , SUM (CASE WHEN PersonMiddleName.MiddleNameType = 'Initial' THEN 1 ELSE 0 END) AS WithInitial
        , SUM (CASE WHEN PersonMiddleName.MiddleNameType = 'Full' THEN 1 ELSE 0 END) AS WithFull
        , SUM (CASE WHEN PersonMiddleName.MiddleNameType = 'None' THEN 1 ELSE 0 END) AS WithNone
  FROM  Person.PersonMiddleName;
GO