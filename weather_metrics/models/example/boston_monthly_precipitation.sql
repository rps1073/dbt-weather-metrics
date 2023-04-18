WITH forecast_months AS (
    SELECT
        CONCAT(YEAR(forecast_date),MONTH(forecast_date)) AS forecast_month,
        forecast_date
    FROM {{ ref('boston_daily_forecast') }}
), boston_monthly_precipitation AS (
    SELECT DISTINCT
        fm.forecast_month,
        SUM(totalprecip_in) OVER(PARTITION BY forecast_month) total_monthly_precipitation
    FROM forecast_months fm
    JOIN analytics.boston_daily_forecast b
    ON fm.forecast_date = b.forecast_date
)
SELECT *
FROM boston_monthly_precipitation
