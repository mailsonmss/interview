-- Option 1
with c_avg_1
as
(
    Select  avg(Salary) salary
    From    table_a
),
as c_avg_2
(
    Select  avg(salary) salary
    From    table_b
)
Select  b.salary - a.salary
From    c_avg_1 a
        cross join c_avg_2 b


-- Option 2
Select  avg(salary) - (Select avg(slary) from table_b)
From    table_a

-- Option 3
(Select  avg(salary) from table_b) - (Select  avg(salary) from table_a)
