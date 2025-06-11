{{ config(materialized="table") }}

with
    bike as (
        select
            start_statio_id as station_id,
            start_station_name as station_name,
            start_station_latitude as station_lat,
            start_station_longitude as station_lng
        from {{ ref("stg_bike") }}
    )
select *
from bike
