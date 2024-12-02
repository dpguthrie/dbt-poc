with 

source as (

    select * from {{ source('claims', 'proceduredetail') }}

),

renamed as (

    select
        siteid as site_id,
        claimid as claim_id,
        primaryclaimid as primary_claim_id,
        sequence,
        procedurecode as procedure_code

    from source

)

select * from renamed
