{{
    config(
        materialized='table'
    )
}}

WITH BIKE AS (
    SELECT 
        START_STATION_ID as station_id,
        START_STATION_NAME AS STATION_NAME,
        START_STATION_LATITUDE AS STATION_LAT,
        START_STATION_LONGITUDE AS STATION_LNG
    FROM {{ source('demo', 'bike') }}
    where START_STATION_ID != 'start station id'
)SELECT * FROM BIKE