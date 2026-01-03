{{ config(materialized='table') }}
select
  date(order_created_at) as order_date,
  sum(revenue) as total_revenue,
  sum(quantity) as total_qty,
  count(distinct order_id) as total_orders,
  count(distinct user_id) as total_customers
from {{ ref('fct_sales') }}
group by 1
