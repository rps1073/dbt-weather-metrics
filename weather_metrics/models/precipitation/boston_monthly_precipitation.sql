WITH forecast_months AS (
    SELECT
        CONCAT(YEAR(forecast_date),MONTH(forecast_date)) AS forecast_month,
        forecast_date
    FROM {{ ref('boston_daily_forecast') }}
), boston_monthly_precipitation AS (
    SELECT DISTINCT
        YEAR(f.forecast_date) AS forecast_year,
        MONTH(f.forecast_date) AS forecast_month,
        f.city,
        SUM(totalprecip_in) OVER(PARTITION BY forecast_month) total_monthly_precipitation
    FROM forecast_months fm
    JOIN {{ ref('boston_daily_forecast') }} f
    ON fm.forecast_date = f.forecast_date
)
SELECT *
FROM boston_monthly_precipitation
