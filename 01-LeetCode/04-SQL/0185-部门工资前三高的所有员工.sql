select
    t1.Department
    , t1.Employee
    , t1.Salary
from
    (select
        t2.Name Department
        , t1.Name Employee
        , t1.Salary
        , dense_rank() over(partition by t1.DepartmentId order by t1.Salary desc) rk
    from
        Employee t1
    join
        Department t2
    on
        t1.DepartmentId = t2.Id
    ) t1
where
    t1.rk <= 3