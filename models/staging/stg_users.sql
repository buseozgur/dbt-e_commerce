with source as (
  select * 
  from {{ source('thelook', 'users') }}
)

select
  id as user_id,
  first_name,
  last_name,
  email,
  age,
  upper(gender) as gender,

  country,
  state,
  city,
  postal_code,
  street_address,

  traffic_source,
  created_at,

  latitude,
  longitude
from source
