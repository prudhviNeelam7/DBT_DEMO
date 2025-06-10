{{ config(materialized="table") }}

with
    trip as (
        select
            bikeid as rider_id,
            usertype,
            date(to_timestamp(start_time)) as trip_start_date,
            start_station_id,
            end_station_id,
            timestampdiff(
                second, to_timestamp(start_time), to_timestamp(stop_time)
            ) as trip_duration_seconds
        from {{ source("demo", "bike") }}
        where trip_duration != 'tripduration'
    )
select *
from trip
