with orders as (
    select *
    from {{ ref('stg_orders') }}
)

select
    order_id,
    user_id,

    -- durum
    lower(status) as order_status,

    -- zamanlar (timestamp kalsın, şimdilik date'e çevirmiyoruz)
    created_at,
    shipped_at,
    delivered_at,
    returned_at

from orders
