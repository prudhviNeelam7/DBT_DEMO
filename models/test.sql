with bike_data as (select * from {{ source("demo", "bike") }})
select *
from bike_data