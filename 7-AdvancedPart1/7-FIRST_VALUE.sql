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
        , LAG (Person.FirstName) OVER (PARTITION BY Person.PersonType
                                           ORDER BY Person.FirstName
                                      ) AS PersonLag
        , LEAD (Person.FirstName) OVER (PARTITION BY Person.PersonType
                                            ORDER BY Person.FirstName
                                       ) AS PersonLead
        , FIRST_VALUE (Person.FirstName) OVER (PARTITION BY Person.PersonType
                                                   ORDER BY Person.FirstName
                                              ) AS FirstPerson
  FROM  Person.Person;
GO