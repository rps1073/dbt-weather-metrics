WITH forecast_months AS (
    SELECT
        CONCAT(YEAR(forecast_date),MONTH(forecast_date)) AS forecast_month,
        forecast_date
    FROM {{ ref('seattle_daily_forecast') }}
), seattle_monthly_precipitation AS (
    SELECT DISTINCT
        fm.forecast_month,
        f.city,
        SUM(totalprecip_in) OVER(PARTITION BY forecast_month) total_monthly_precipitation
    FROM forecast_months fm
    JOIN {{ ref('seattle_daily_forecast') }} f
    ON fm.forecast_date = f.forecast_date
)
SELECT *
FROM seattle_monthly_precipitation
