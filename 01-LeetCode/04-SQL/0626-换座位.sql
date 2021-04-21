SELECT
    CASE
        WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1 -- 奇数, 并且id!=数据行数
        WHEN MOD(id, 2) != 0 AND counts = id THEN id      -- 奇数, 并且id =数据行数
        ELSE id - 1 -- 偶数
    END AS id,
    student
FROM
    seat,
    (SELECT
        COUNT(*) AS counts
    FROM
        seat
    ) AS seat_counts
ORDER BY id ASC;


select
    id
    , if(t.id % 2 = 1, t.back, t.ahead) as 'student'
from
    (select
        id
        , student
        , LAG(student, 1, student) over() ahead -- 当前行之前的行的值
        , LEAD(student, 1, student) over() back -- 当前行之后的行的值
    from
        seat
    ) t