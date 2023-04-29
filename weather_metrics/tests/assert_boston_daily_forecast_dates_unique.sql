SELECT
    forecast_date,
    COUNT(*)
FROM {{ ref('boston_daily_forecast') }}
GROUP BY 
    forecast_date
HAVING count(*) > 1