USE AdventureWorks2019;

SELECT  *
  FROM  HumanResources.Employee
 WHERE  MaritalStatus = 'M';

SELECT  *
  FROM  HumanResources.EmployeeDepartmentHistory
 -- WHERE EndDate <> NULL
 WHERE  EndDate IS NOT NULL;