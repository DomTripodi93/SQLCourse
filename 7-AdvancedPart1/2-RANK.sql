USE AdventureWorks2019;
GO

SELECT  Person.BusinessEntityID
        , Person.PersonType
        , Person.FirstName
        , ROW_NUMBER () OVER (PARTITION BY Person.PersonType
                                  ORDER BY Person.FirstName
                             ) AS PersonRow
        , RANK () OVER (PARTITION BY Person.PersonType
                            ORDER BY Person.FirstName
                       ) AS PersonRank
  FROM  Person.Person;
GO