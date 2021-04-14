-- not in
select
    Name Customers
from
    Customers
where
    Id not in (select CustomerId from Orders)


-- 关联
select
    t1.Name Customers
from
    Customers t1
left join
    Orders t2
on
    t1.Id = t2.CustomerId
where
    t2.CustomerId is null