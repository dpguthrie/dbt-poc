{{
    config(
        materialized='table'
    )
}}

with source as (
    select * from {{ source('tpch', 'customer') }}
),

renamed as (
    select
        c_custkey as customer_key,
        c_nationkey as nation_key
    from source
)

select * from renamed