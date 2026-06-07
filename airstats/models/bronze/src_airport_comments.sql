{{
  config(
    materialized = 'ephemeral'
    )
}}
WITH comments AS (
    SELECT * FROM {{ source('airstats', 'comments') }}
)
SELECT
    id as comment_id,
    airport_ident,
    date as comment_timestamp,
    member_nickname,
    subject as comment_subject,
    body as comment_body
FROM comments