{{ config(materialized="table") }}

with
    trip as (
        select
            ride_id,
            date(to_timestamp(started_at)) as trip_date,
            START_STATIO_ID as START_STATION_ID,
            end_station_id,
            member_csual,
            timestampdiff(
                second, to_timestamp(started_at), to_timestamp(ended_at)
            ) as trip_duration_seconds
        from {{ ref("stg_bike") }}
    )
select *
from trip
