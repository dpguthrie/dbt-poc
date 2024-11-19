{{
    config(
        materialized='incremental',
        unique_key='order_key',
    )
}}

with source as (
    select * from {{ source('tpch', 'orders') }}
),

renamed as (
    select
        o_orderkey as order_key,
        o_custkey as customer_key,
        o_totalprice as total_price,
        o_orderdate as order_date,
        _etl_updated_timestamp
    from source

    {% if is_incremental() %}

    where _etl_updated_timestamp > (select max(_etl_updated_timestamp) from {{ this }})

    {% endif %}

)

select * from renamed