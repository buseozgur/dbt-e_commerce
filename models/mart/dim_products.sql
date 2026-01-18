{{ config(materialized='table') }}
select
    product_id,
    product_name,
    category,
    brand,
    department,
    sku,
    retail_price,
    cost
from {{ ref('stg_products') }}
