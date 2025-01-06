select
    customer_id,
    count(order_id) as total_orders,
    avg(order_count) as average_orders_per_customer
from (
    select
        customer_id,
        order_id,
        count(order_id) as order_count
    from {{ ref('stg_databird_local_bike__orders') }}
    group by customer_id, order_id
)
group by customer_id
