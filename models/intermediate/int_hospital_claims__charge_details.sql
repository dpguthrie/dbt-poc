WITH claim_charge_detail AS (

    SELECT * FROM {{ ref('stg_claims__claim_charge_detail') }}

),

claims_enhanced AS (

    SELECT * FROM {{ ref('int_hospital_claims__claims_enhanced') }}

),

charge_details AS (

    SELECT
        ccd.*,
        ce.total_charges AS claim_total_charges,
        ce.stm_from AS claim_service_start_date,
        ce.stm_thru AS claim_service_end_date
    FROM claim_charge_detail ccd
    LEFT JOIN claims_enhanced ce
        ON ccd.site_id = ce.site_id
        AND ccd.claim_id = ce.claim_id

)

SELECT * FROM charge_details
