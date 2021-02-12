//编写一个 SQL 查询，获取 Employee 表中第 n 高的薪水（Salary）。
select
    distinct salary
from
    (select
        salary
        , dense_rank() OVER (order by salary desc) rn
    from
        Employee
    ) t
where
    t.rn = n