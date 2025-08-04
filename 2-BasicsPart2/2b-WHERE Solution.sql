USE AdventureWorks2019;

SELECT  *
  FROM  HumanResources.Employee
 WHERE  MaritalStatus = 'M';

SELECT  *
  FROM  HumanResources.EmployeeDepartmentHistory
 -- WHERE EndDate = NULL /*This wouldn't work because comparisons to NULL don't return results*/
 WHERE  EndDate IS NULL;
