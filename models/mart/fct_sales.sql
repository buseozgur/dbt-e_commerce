{{ config(materialized='table') }}
with base as (
    select *
    from {{ ref('int_order_items_enriched') }}
)

select
    -- keys
    order_item_id,
    order_id,
    user_id,
    product_id,

    -- time (timestamp kalsın)
    order_created_at,
    order_item_created_at,

    -- product attrs (istersen burada tut, istersen dim'de bırak)
    category,
    brand,
    retail_price,

    -- metrics
    quantity,
    revenue

from base
