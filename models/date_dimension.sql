{{ config(materialized="table") }}

with
    date_dim as (
        select
            to_timestamp(start_time) as started_at,
            date(to_timestamp(start_time)) as date_started_at,
            hour(to_timestamp(start_time)) as hour_started_at,
            {{ day_type("start_time") }} as day_type,
            {{ input_date("start_time") }}
            station_of_year
        from {{ source("demo", "bike") }}
        where start_time != 'starttime'
    )
select *
from date_dim
