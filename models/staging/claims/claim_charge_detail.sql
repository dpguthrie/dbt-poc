WITH source AS (

    SELECT * FROM {{ source('hospital_claims_data', 'claimchargedetail') }}

),

renamed AS (

    SELECT
        SITEID AS site_id,
        CLAIMID AS claim_id,
        CLAIMSTMFROM AS claim_stm_from,
        CLAIMSTMTHRU AS claim_stm_thru,
        LINEITEMCONTROLNUMBER AS line_item_control_number,
        CHARGEID AS charge_id,
        CHARGEDRUGNDCNUMBER AS charge_drug_ndc_number,
        CHARGEPROCEDURECODE AS charge_procedure_code,
        CHARGEREVENUECODE AS charge_revenue_code,
        CHARGESTMFROM AS charge_stm_from,
        CHARGESTMTHRU AS charge_stm_thru,
        CHARGEPROCEDUREDATE AS charge_procedure_date,
        PLACEOFSERVICECODE AS place_of_service_code,
        MODIFIER1 AS modifier1,
        MODIFIER2 AS modifier2,
        MODIFIER3 AS modifier3,
        MODIFIER4 AS modifier4,
        CHARGES AS charges,
        UNITS AS units
    FROM source

)

SELECT * FROM renamed
