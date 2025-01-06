select
    staff_id,
    first_name,
    last_name,
    email,
    phone,
    active,
    store_id,
    SAFE_CAST(manager_id AS INT64) as manager_id
    
from {{  source('databird_local_bike', 'staffs') }}