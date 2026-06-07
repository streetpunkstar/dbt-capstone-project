{{
  config(
    materialized = 'incremental'
    )
}}
WITH src_airport_comments AS (
    SELECT * FROM {{ ref('src_airport_comments') }}
)
SELECT
    comment_id,
    airport_ident,
    comment_timestamp,
    NVL(NULLIF(TRIM(member_nickname), ''), '__UNKNOWN__') AS member_nickname,
    comment_subject,
    comment_body,
    CURRENT_TIMESTAMP AS loaded_at
FROM src_airport_comments

{% if is_incremental() %}
  WHERE comment_id > (select max(comment_id) from {{ this }})
{% endif %}