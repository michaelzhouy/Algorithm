-- row_number() 1,2,3,4
-- rank()       1,1,1,4
-- dense_rank() 1,1,1,2
select
    Score
    , dense_rank() over(order by Score desc) as 'Rank'
from
    Scores