WITH all_monthly_precipitation AS (
    SELECT *
    FROM {{ref('boston_monthly_precipitation')}}

    UNION

    SELECT *
    FROM {{ref('seattle_monthly_precipitation')}}
)
SELECT *
FROM all_monthly_precipitation