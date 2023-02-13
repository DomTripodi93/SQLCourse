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
        , DENSE_RANK () OVER (PARTITION BY Person.PersonType
                                  ORDER BY Person.FirstName
                             ) AS PersonDenseRank
        , NTILE (50) OVER (PARTITION BY Person.PersonType
                              ORDER BY Person.FirstName
                         ) AS PersonNtile
  FROM  Person.Person;

SELECT  COUNT (*)
        , Person.PersonType
  FROM  Person.Person
 GROUP BY Person.PersonType;
GO