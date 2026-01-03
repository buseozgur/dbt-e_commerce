with order_items as (
  select * from {{ ref('stg_order_items') }}
),
orders as (
  select * from {{ ref('stg_orders') }}
),
products as (
  select * from {{ ref('stg_products') }}
)

select
  -- keys
  order_items.order_item_id,
  order_items.order_id,
  order_items.user_id,
  order_items.product_id,

  -- dates (timestamp kalsın; power bi’da date dimension ile çözeceğiz)
  orders.created_at as order_created_at,
  orders.shipped_at as order_shipped_at,
  orders.delivered_at as order_delivered_at,
  orders.returned_at as order_returned_at,

  -- status
  orders.status as order_status,
  order_items.order_item_status as order_item_status,

  -- product attributes
  products.department,
  products.category,
  products.brand,
  products.sku,

  -- money
  products.retail_price,
  products.cost

from order_items
left join orders using (order_id)
left join products using (product_id)
