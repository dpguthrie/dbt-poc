WITH claims_enhanced AS (

    SELECT * FROM {{ ref('int_hospital_claims__claims_enhanced') }}

),

facility_detail AS (

    SELECT * FROM {{ ref('stg_claims__facility_detail') }}

),

facility_claims AS (

    SELECT
        ce.*,
        fd.bed_size,
        fd.region,
        fd.geographic_classification,
        fd.hospital_type,
        fd.teaching_status,
        fd.facility_zip
    FROM claims_enhanced ce
    LEFT JOIN facility_detail fd
        ON ce.provider_id = fd.provider_id

)

SELECT * FROM facility_claims
