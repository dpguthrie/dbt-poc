{{

    config(

        materialized = 'table',
        transient = false
    )
}}

with customer as (

    select * from {{ref('stg_tpch_customers')}}
)

select * from customer