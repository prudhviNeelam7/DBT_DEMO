{{
    config(
        materialized='table'
    )
}}

WITH BIKE AS (
    SELECT 
            RIDE_ID ,
			REPLACE(STARTED_AT,'"','') AS STARTED_AT,
			REPLACE(ENDED_AT,'"','') AS ENDED_AT,
			START_STATION_NAME ,
			START_STATIO_ID ,
			END_STATION_NAME ,
			END_STATION_ID ,
			START_LAT as start_station_latitude ,
			START_LNG as start_station_longitude ,
			END_LAT ,
			END_LNG ,
			MEMBER_CSUAL 
    FROM {{ source('demo', 'bike') }}
    where STARTED_AT != 'starttime' and STARTED_AT != '"starttime"'
)SELECT * FROM BIKE