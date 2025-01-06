select
    oi.order_item_id,
    p.product_id,
    p.product_name,
    c.category_name,
    b.brand_name,
from {{ ref('stg_databird_local_bike__order_items') }} oi
left join {{ ref('stg_databird_local_bike__products') }} p on oi.product_id = p.product_id
left join {{ ref('stg_databird_local_bike__categories') }} c on p.category_id = c.category_id
left join {{ ref('stg_databird_local_bike__brands') }} b on p.brand_id = b.brand_id