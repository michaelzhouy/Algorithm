select
    Email
from
    Person t
group by
    Email
having
    count(Email) > 1