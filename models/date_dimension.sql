{{ config(materialized="table") }}

with
    date_dim as (
        select
            to_timestamp(STARTED_AT) as started_at,
            date(to_timestamp(STARTED_AT)) as date_started_at,
            hour(to_timestamp(STARTED_AT)) as hour_started_at,
            {{ day_type("STARTED_AT") }} as day_type,
            {{ season("STARTED_AT") }}
            station_of_year
        from {{ ref('stg_bike') }}
    )
select *
from date_dim
