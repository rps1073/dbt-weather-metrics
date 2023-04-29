SELECT
    *
FROM {{ ref('boston_monthly_precipitation') }}
WHERE total_monthly_precipitation < 0