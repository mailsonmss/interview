/*
    Consider two tables:
    1. "Employees" table with columns (EmployeeID, EmployeeName, ManagerID)
    2. "Salaries" table with columns (EmployeeID, Salary)

    Write an SQL query to fetch the names of all employees who are also managers and have a salary higher than their respective manager.
*/

1 Jose Null     Manager

15 Joao 1       Employee



with c_salary_employee
As
(
    Select  e.EmployeeID, e.EmployeeName, e.ManagerID, s.salary
    From    employees e
            Join Salaries s
                On  e.EmployeeID = s.EmployeeID
)
Select  em.EmployeeID--, em.EmployeeName, em.salary as EmployeeSalary, m.salary as Manager_Salary
From    c_salary_employee em
        Join c_salary_employee m
            On  em.ManagerID = m.EmployeeID
            And em.salary > m.salary -- Bigger salary?
Where   em.EmployeeID is in (Select ManagerID from employees) -- Is it manager?


-- Correct one:

with c_salary_employee
As
(
    Select  e.EmployeeID, e.EmployeeName, e.ManagerID, s.salary
    From    employees e
            Join Salaries s
                On  e.EmployeeID = s.EmployeeID
)
Select  em.EmployeeID--, em.EmployeeName, em.salary as EmployeeSalary, m.salary as Manager_Salary
From    c_salary_employee em
        Join c_salary_employee m
            On  em.ManagerID = m.EmployeeID
            And em.salary > m.salary -- Bigger salary?
Where   em.EmployeeID in (Select ManagerID from employees) -- Is it manager?


