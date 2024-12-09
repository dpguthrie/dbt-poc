WITH source AS (

    SELECT * FROM {{ source('hospital_claims_data', 'diagnosisdetail') }}

),

renamed AS (

    SELECT
        SITEID AS site_id,
        CLAIMID AS claim_id,
        PRIMARYCLAIMID AS primary_claim_id,
        SEQUENCE AS sequence,
        DIAGCODE AS diag_code
    FROM source

)

SELECT * FROM renamed
