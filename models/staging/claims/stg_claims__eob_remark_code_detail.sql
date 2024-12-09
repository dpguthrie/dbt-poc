WITH source AS (

    SELECT * FROM {{ source('hospital_claims_data', 'eobremarkcodedetail') }}

),

renamed AS (

    SELECT
        SITEID AS site_id,
        EOBID AS eob_id,
        ADJUSTMENTTYPE AS adjustment_type,
        EOBCHARGEID AS eob_charge_id,
        GROUPCODE AS group_code,
        ADJUSTMENTCODE AS adjustment_code,
        REMARKCODE AS remark_code,
        CODE AS code,
        DESCRIPTION AS description,
        QUANTITY AS quantity,
        AMOUNT AS amount,
        PROCEDURECODE AS procedure_code,
        REVENUECODE AS revenue_code,
        SERVICELINEAMOUNT AS service_line_amount,
        PAIDAMOUNT AS paid_amount,
        LINENUMBER AS line_number,
        LEVEL AS level,
        LEVELNAME AS level_name,
        REASONCODETYPE AS reason_code_type,
        APG AS apg,
        COINSADJ AS coins_adj,
        CONTRACTADJ AS contract_adj,
        COPAYADJ AS copay_adj,
        COVEREDCHARGES AS covered_charges,
        DEDUCTADJ AS deduct_adj,
        DENIEDADJ AS denied_adj,
        NONCONVEREDCHARGES AS non_covered_charges,
        OTHERADJ AS other_adj,
        PATAMT AS pat_amt,
        SERVICEPERIODSTART AS service_period_start,
        SERVICEPERIODEND AS service_period_end,
        UNITS1 AS units1,
        UNITS2 AS units2
    FROM source

)

SELECT * FROM renamed
