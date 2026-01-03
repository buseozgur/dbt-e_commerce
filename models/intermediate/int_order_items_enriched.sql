with order_items as (
    select *
    from {{ ref('stg_order_items') }}
),

orders as (
    select *
    from {{ ref('int_orders') }}
),

products as (
    select *
    from {{ ref('stg_products') }}
)

select
    oi.order_item_id,
    oi.order_id,
    o.user_id,

    oi.product_id,
    p.product_name,
    p.category,
    p.brand,

    o.created_at as order_created_at,
    oi.created_at as order_item_created_at,

    p.retail_price,

    1 as quantity,
    p.retail_price as revenue

from order_items oi
left join orders o
    on oi.order_id = o.order_id
left join products p
    on oi.product_id = p.product_id
