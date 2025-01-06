select
    s.manager_id,
    s.staff_id,
    s.first_name,
    s.last_name,
    sum(oi.list_price * oi.quantity) as total_sales
from {{ ref('stg_databird_local_bike__order_items') }} oi
join {{ ref('stg_databird_local_bike__orders') }} o on oi.order_id = o.order_id
join {{ ref('stg_databird_local_bike__staffs') }} s on o.staff_id = s.staff_id
group by s.manager_id, s.staff_id, s.first_name, s.last_name
