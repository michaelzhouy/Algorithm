select
    t1.id
from
    Weather t1
inner join
    Weather t2
on
    datediff(t1.recordDate, t2.recordDate) = 1
where
    t1.Temperature > t2.Temperature