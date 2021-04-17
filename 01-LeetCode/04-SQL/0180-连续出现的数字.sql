select
    distinct t1.Num ConsecutiveNums
from
    Logs t1
join
    Logs t2
on
    t1.Id = t2.Id - 1 and t1.Num = t2.Num
join
    Logs t3
on
    t2.Id = t3.Id - 1 and t2.Num = t3.Num