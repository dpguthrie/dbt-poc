select
    c.nation_key,,
    sum(o.total_price) as total_price
from {{ ref('stg_tpch_orders') }} as o
join {{ ref('stg_tpch_customers') }} as c on
    o.customer_key = c.customer_key
group by 1
