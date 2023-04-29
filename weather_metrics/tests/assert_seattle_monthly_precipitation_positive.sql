SELECT
    *
FROM {{ ref('seattle_monthly_precipitation') }}
WHERE total_monthly_precipitation < 0