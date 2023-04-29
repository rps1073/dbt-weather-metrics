WITH boston_daily_forecast AS (
    SELECT * 
    FROM raw.daily_forecast
    WHERE 
        city = 'Somerville'
    ORDER BY 
        forecast_date
)
SELECT *
FROM boston_daily_forecast