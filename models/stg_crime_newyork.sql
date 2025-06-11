WITH CTE AS (
    SELECT *    FROM {{ source('uscrime', 'URBAN_CRIME_INCIDENT_LOG') }}
    WHERE CITY = 'New York' AND OFFENSE_CATEGORY IN ('Driving Under The Influence','Theft')
)SELECT 
    OFFENSE_CATEGORY,
    {{season('DATE')}} as season,
    {{day_type('DATE')}} AS day_type,
    count(OFFENSE_CATEGORY) as number_offense
 from CTE
 group by OFFENSE_CATEGORY,season,day_type
 order by number_offense desc