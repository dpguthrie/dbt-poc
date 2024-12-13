WITH source AS (

    SELECT * FROM {{ source('hospital_claims_data', 'facilitydetail') }}

),

renamed AS (

    SELECT
        PROVIDERID AS provider_id,
        BEDSIZE AS bed_size,
        REGION AS region,
        GEOGRAPHICCLASSIFICATION AS geographic_classification,
        HOSPITALTYPE AS hospital_type,
        TEACHINGSTATUS AS teaching_status,
        FACILITYZIP AS facility_zip
    FROM source

)

SELECT * FROM renamed
