with source as (
  select * 
  from {{ source('thelook', 'products') }}
)

select
  id as product_id,
  name as product_name,
  brand,
  category,
  department,
  sku,
  distribution_center_id,
  cost,
  retail_price
from source
