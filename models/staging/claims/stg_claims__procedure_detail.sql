WITH source AS (

    SELECT * FROM {{ source('hospital_claims_data', 'proceduredetail') }}

),

renamed AS (

    SELECT
        SITEID AS site_id,
        CLAIMID AS claim_id,
        PRIMARYCLAIMID AS primary_claim_id,
        SEQUENCE AS sequence,
        PROCEDURECODE AS procedure_code
    FROM source

)

SELECT * FROM renamed
