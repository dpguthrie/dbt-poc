with 

source as (

    select * from {{ source('claims', 'cptdetail') }}

),

renamed as (

    select
        siteid as site_id,
        claimid as claim_id,
        primaryclaimid as primary_claim_id,
        sequence,
        cptcode as cpt_code

    from source

)

select * from renamed
