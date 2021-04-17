select
    Department
    , Employee
    , Salary
from
    (select
        t2.Name as Department
        , t1.Name as Employee
        , t1.Salary
        , rank() over(partition by(t1.DepartmentId) order by Salary desc) as rn
    from
        Employee t1
    inner join
        Department t2
    on
        t1.DepartmentId = t2.Id
    ) t3
where
    t3.rn = 1