with 

source as (

    select * from {{ source('claims', 'diagnosisdetail') }}

),

renamed as (

    select
        siteid as site_id,
        claimid as claim_id,
        primaryclaimid as primary_claim_id,
        sequence,
        diagcode as diag_code
    from source

)

select * from renamed
