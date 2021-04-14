select
    t1.Name Employee
from
    (select * from Employee where ManagerId is not null) t1
inner join
    (select * from Employee) t2
on
    t1.ManagerId = t2.Id
where
    t1.Salary > t2.Salary