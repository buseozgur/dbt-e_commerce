{{ config(materialized='table') }}
select
    user_id,
    first_name,
    last_name,
    email,
    age,
    gender,
    country,
    state,
    city
from {{ ref('stg_users') }}
