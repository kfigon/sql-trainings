# postgres:

with random_rows as ( # how many rows generate
    SELECT *
    FROM generate_series(1, 500000)
)
insert into the_table(text1, text2, date1, bool1, bool2, date2)
select
    md5(random()::text),
    md5(random()::text),
    '2023-09-13'::date + trunc(random() * 10)::int,
        case when random() > 0.5 then true else false end,
    case when random() > 0.5 then true else false end,
    '2023-09-13'::date + trunc(random() * 10)::int
from random_rows;