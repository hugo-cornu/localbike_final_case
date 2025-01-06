select
    order_summary.customer_id,
    avg(order_summary.total_amount) as average_basket,
    avg(order_summary.item_count) as average_items_per_order
from (
    select
        o.customer_id,
        sum((oi.list_price - oi.discount) * oi.quantity) as total_amount,  -- Inclure le discount
        count(oi.item_id) as item_count
    from `databird_local_bike.order_items` oi
    join `databird_local_bike.orders` o on oi.order_id = o.order_id
    group by o.customer_id, oi.order_id
) as order_summary
group by order_summary.customer_id
