select
    o.store_id,
    sum(oi.list_price * oi.quantity) as total_sales
from {{ ref('stg_databird_local_bike__order_items') }} oi
join {{ ref('stg_databird_local_bike__orders') }} o on oi.order_id = o.order_id
group by o.store_id