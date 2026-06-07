WITH la_heli AS (
    SELECT * FROM {{ ref('scd_silver_aiports') }}
)
SELECT
    *
FROM
    la_heli
WHERE airport_ident = '01CN'