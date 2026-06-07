WITH src_runways AS (
    SELECT * FROM {{ ref('src_runways') }}
)
SELECT
    runway_id,
    airport_ident,
    runway_length_ft,
    runway_width_ft,
    NVL(NULLIF(TRIM(runway_surface), ''), '__UNKNOWN__') AS runway_surface,
    CASE WHEN runway_lighted = 1 THEN 'True' WHEN runway_lighted = 0 THEN 'False' END AS runway_lighted,
    CASE WHEN runway_closed = 1 THEN 'True' WHEN runway_closed = 0 THEN 'False' END AS runway_closed
FROM src_runways