WITH seattle_daily_forecast AS (
    SELECT * 
    FROM raw.daily_forecast
    WHERE 
        city = 'Seattle'
    ORDER BY 
        forecast_date
)
SELECT *
FROM seattle_daily_forecast